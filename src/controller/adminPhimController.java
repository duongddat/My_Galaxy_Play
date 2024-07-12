package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.loaibean;
import bean.phimbean;
import bo.loaibo;
import bo.phimbo;

/**
 * Servlet implementation class adminPhimController
 */
@WebServlet("/adminPhimController")
public class adminPhimController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminPhimController() {
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
			String tab = request.getParameter("tab");
			String query = request.getParameter("query");
			phimbo pbo = new phimbo();
			loaibo lbo = new loaibo();
			
			String alert = null;
			String mes = null;
			
			if(tab != null) {
				String mp = request.getParameter("mp");
				
				if(tab.equals("chon")) {
					phimbean p = pbo.getDetail(mp);
					
					request.setAttribute("mp", p.getMaphim());
					request.setAttribute("tp", p.getTenphim());
					request.setAttribute("g", String.valueOf(p.getGia()));
					request.setAttribute("ml", p.getMaloai());
					request.setAttribute("tg", p.getTacgia());
					request.setAttribute("dv", p.getDienvien());
					request.setAttribute("img", p.getImage());
					request.setAttribute("video", p.getVideo());
					request.setAttribute("mt", p.getMota());
				}
				else if(tab.equals("xoa")) {
					pbo.Xoa(mp);
					mes = "Xóa loại phim thành công!!!";
					alert = "alert-success";
				}
			}
			
			ArrayList<phimbean> ds = pbo.getPhim();
			if(query != null) {
				ds = pbo.TimPhim(query);
			}
			
			request.setAttribute("ds", ds);
			
			ArrayList<loaibean> dsloai = lbo.getloai();
			request.setAttribute("dsloai", dsloai);
			request.setAttribute("mes", mes);
			request.setAttribute("alert", alert);
			
			RequestDispatcher rd = request.getRequestDispatcher("adminPhim.jsp");
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
