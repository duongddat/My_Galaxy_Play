package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.loaibean;
import bean.phimbean;
import bo.gioHangbo;
import bo.loaibo;
import bo.phimbo;

/**
 * Servlet implementation class homeController
 */
@WebServlet("/homeController")
public class homeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public homeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			//Từ server --> clien === unitcode (utf-8)
			response.setCharacterEncoding("utf-8");
			//Từ clien --> server === unitcode (utf-8)
			request.setCharacterEncoding("utf-8");
			
			HttpSession session = request.getSession();
			String ml = request.getParameter("ml");
			String key = request.getParameter("txttim");
			String sort = request.getParameter("sort");
			
			phimbo pbo = new phimbo();
			ArrayList<phimbean> ds = pbo.getPhim();
			
			if(ml != null) {
				ds = pbo.TimLoai(ml);
			}
			
			if(key != null) {
				ds = pbo.TimPhim(key);
			}
			
			if(sort != null) {
				ds = pbo.sortNew();
			}
			
			if(session.getAttribute("gh") != null) {
				gioHangbo g = new gioHangbo();
				g = (gioHangbo)session.getAttribute("gh");
				int count = g.ds.size();
				request.setAttribute("count", (int)count);	
			}
			
			loaibo lbo = new loaibo(); 
			ArrayList<loaibean> dsloai = lbo.getloai();
			

			//Chuyển về home.jsp: ds và dsloai
			request.setAttribute("ds", ds);
			request.setAttribute("dsloai", dsloai);
			
			//Chuyển hướng về home.jsp
			RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
			rd.forward(request, response);	
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
