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
 * Servlet implementation class detailController
 */
@WebServlet("/detailController")
public class detailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public detailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();
			String mp = request.getParameter("mp");
			phimbo pbo = new phimbo();
			loaibo lbo = new loaibo();
			
			if(session.getAttribute("gh") != null) {
				gioHangbo g = new gioHangbo();
				g = (gioHangbo)session.getAttribute("gh");
				int count = g.ds.size();
				request.setAttribute("count", (int)count);	
			}
			
			if(mp != null) {
				phimbean p = pbo.getDetail(mp);
				ArrayList<loaibean> dsloai = lbo.getloai();
				request.setAttribute("dsloai", dsloai);
				request.setAttribute("ds", pbo.phimLienQuan(p.getMaloai(), mp));
				request.setAttribute("p", p);
			}
			RequestDispatcher rd = request.getRequestDispatcher("detail.jsp");
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
