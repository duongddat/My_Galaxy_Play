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

import bean.khachHangbean;
import bean.lichSuMuabean;
import bo.gioHangbo;
import bo.lichSuMuabo;

/**
 * Servlet implementation class lichSuController
 */
@WebServlet("/lichSuController")
public class lichSuController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public lichSuController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();
			khachHangbean kh = (khachHangbean)session.getAttribute("dn");
			String damua = request.getParameter("damua");
			gioHangbo g = new gioHangbo();
			int count = 0;
			
			if(kh != null) {
				if(session.getAttribute("gh") != null) {
					g = (gioHangbo)session.getAttribute("gh");
					count = g.ds.size();
				} else if(session.getAttribute("gh") == null) {
					session.setAttribute("gh", g);
				} 
				
				
				lichSuMuabo lsbo = new lichSuMuabo();
				
				ArrayList<lichSuMuabean> ds = lsbo.getLS(kh.getMakh());
				long tong = lsbo.thanhToan(kh.getMakh());
				
				if(damua != null) {
					if(Integer.parseInt(damua)  == 1) {
						System.out.println("hahah");
						ds = lsbo.getLSDaTT(kh.getMakh());
					}
					else {
						System.out.println("jhihi");
						ds = lsbo.getLSChuaTT(kh.getMakh());
					}
				}

				request.setAttribute("count", (int)count);	
				request.setAttribute("ds", ds);	
				request.setAttribute("tong", tong);	
				
				RequestDispatcher rd = request.getRequestDispatcher("lichsu.jsp");
				rd.forward(request, response);
				
		  } else {
				RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
				rd.forward(request, response);
		  }
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
