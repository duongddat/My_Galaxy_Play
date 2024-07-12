package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bo.khachHangbo;

/**
 * Servlet implementation class dangKyController
 */
@WebServlet("/dangKyController")
public class dangKyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public dangKyController() {
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
			khachHangbo khbo = new khachHangbo();
			
			String ht = request.getParameter("txtht");
			String dc = request.getParameter("txtdc");
			String sdt = request.getParameter("txtsdt");
			String email = request.getParameter("txtemail");
			String un = request.getParameter("txtun");
			String pass = request.getParameter("txtpw");
			String pass1 = request.getParameter("txtpw2");
			
			String err;
			
			if(ht != null && sdt != null && un != null  && pass != null && pass1 != null) {
				if(khbo.khdk(ht, dc, sdt, email, un, pass, pass1) != 0) {
					
					RequestDispatcher rd = request.getRequestDispatcher("dangNhapController");
					rd.forward(request, response);
					
				} else {
					if(!pass.equals(pass1)) {
						err = "Mật khẩu xác nhận không chính xác!!!";	
					} else {
						err = "User name đã được sử dụng!!!(Đăng ký username khác)";
						
					}
					request.setAttribute("err", (String)err);
					RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
					rd.forward(request, response);
				}
			} else {
				RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
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
