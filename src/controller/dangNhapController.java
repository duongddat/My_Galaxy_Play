package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.khachHangbean;
import bo.khachHangbo;

/**
 * Servlet implementation class dangNhapController
 */
@WebServlet("/dangNhapController")
public class dangNhapController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public dangNhapController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();
			khachHangbo khbo = new khachHangbo();
			
			String un = request.getParameter("txtun");
			String pass = request.getParameter("txtpw");
			int check;
			
			if(session.getAttribute("gc") == null) {
				check = 0;
				session.setAttribute("gc", check);
			}
			
			if(un != null && pass != null) {
				khachHangbean kh = khbo.khdn(un, pass);
				
				if(kh != null) {
					if(session.getAttribute("dn") == null) {
						session.setAttribute("dn", null);
					}
					
					session.setAttribute("dn", kh);
					RequestDispatcher rd = request.getRequestDispatcher("homeController");
					rd.forward(request, response);
				} else {
					check = (int)session.getAttribute("gc");
				
					check++;
					session.setAttribute("gc", check);
					String mes = "Đăng nhập sai !!!";
					request.setAttribute("mes", mes);
				}
			}
			
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
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
