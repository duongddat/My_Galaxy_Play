package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.adminbean;
import bo.adminbo;

/**
 * Servlet implementation class adminLoginController
 */
@WebServlet("/adminLoginController")
public class adminLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminLoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();
			adminbo adbo = new adminbo();
			
			String un = request.getParameter("txtun");
			String pass = request.getParameter("txtpw");
			int check;
			
			if(session.getAttribute("gc") == null) {
				check = 0;
				session.setAttribute("gc", check);
			}
			
			if(un != null && pass != null) {
				adminbean ad = adbo.login(un, pass);
				
				if(ad != null) {
					if(session.getAttribute("ad") == null) {
						session.setAttribute("ad", null);
					}
					
					session.setAttribute("ad", ad);
					RequestDispatcher rd = request.getRequestDispatcher("adminController");
					rd.forward(request, response);
				} else {
					check = (int)session.getAttribute("gc");
				
					check++;
					session.setAttribute("gc", check);
					String mes = "Đăng nhập sai !!!";
					request.setAttribute("mes", mes);
				}
			}
			
			RequestDispatcher rd = request.getRequestDispatcher("adminLogin.jsp");
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
