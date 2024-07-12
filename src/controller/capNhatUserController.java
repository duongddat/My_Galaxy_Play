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
 * Servlet implementation class capNhatUserController
 */
@WebServlet("/capNhatUserController")
public class capNhatUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public capNhatUserController() {
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
				String ht = request.getParameter("txtht");
				String dc = request.getParameter("txtdc");
				String sdt = request.getParameter("txtsdt");
				String email = request.getParameter("txtemail");

				khbo.Sua(kh.getMakh(), ht, dc, sdt, email);
				String mes = "Cập nhật thông tin thành công!!!";
				request.setAttribute("mes", mes);
				
				khachHangbean khnew = khbo.khdn(kh.getUsername(), kh.getPass());
				session.setAttribute("dn", khnew);
				
				RequestDispatcher rd = request.getRequestDispatcher("thanhToanController");
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
