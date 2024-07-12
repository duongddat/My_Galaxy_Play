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
 * Servlet implementation class doiMKController
 */
@WebServlet("/doiMKController")
public class doiMKController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public doiMKController() {
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
			khachHangbean kh = (khachHangbean)session.getAttribute("dn");
			
			if(kh != null) {
				String pw = request.getParameter("pw");
				String pwn = request.getParameter("pwn");
				String pwn2 = request.getParameter("pwn2");
				
				if(pw != null && pwn != null && pwn2 != null) {
					if(khbo.khdn(kh.getUsername(), pw) != null) {
						if(pwn.equals(pwn2)) {
							khbo.doiMK(kh.getMakh(), pwn, pwn2);
							khachHangbean khnew = khbo.khdn(kh.getUsername(), pwn);
							session.setAttribute("dn", khnew);
							
							String alert = "success";
							String mes = "Đổi mật khẩu thành công!!!";
							request.setAttribute("mes", mes);
							request.setAttribute("alert", alert);
						} else {
							String alert = "warning";
							String mes = "Confirm mật khẩu sai!!!";
							request.setAttribute("mes", mes);
							request.setAttribute("alert", alert);
						}
					} else {
						String alert = "warning";
						String mes = "Sai mật khẩu!!!";
						request.setAttribute("mes", mes);
						request.setAttribute("alert", alert);
					}
				}
				
				request.setAttribute("un", kh.getUsername());
				RequestDispatcher rd = request.getRequestDispatcher("doiMK.jsp");
				rd.forward(request, response);
			} else {
				RequestDispatcher rd = request.getRequestDispatcher("dangNhapController");
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
