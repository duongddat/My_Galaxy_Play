package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.gioHangbean;
import bean.khachHangbean;
import bo.chiTietHoaDonbo;
import bo.gioHangbo;
import bo.hoaDonbo;

/**
 * Servlet implementation class xacNhanController
 */
@WebServlet("/xacNhanController")
public class xacNhanController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public xacNhanController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();
			hoaDonbo hdbo = new hoaDonbo();
			chiTietHoaDonbo ctbo = new chiTietHoaDonbo();
			
			gioHangbo gh = (gioHangbo)session.getAttribute("gh");
			khachHangbean kh = (khachHangbean)session.getAttribute("dn");
			
			if(gh != null && kh != null) {

				hdbo.Them(kh.getMakh());
				long mahd = hdbo.getMaxHD();
				//Duyệt gio để lưu vào cthoadon
				for(gioHangbean g: gh.ds) {
					ctbo.Them(g.getMaphim(), g.getThue(), mahd);
				}
				//xoa gio hang
				session.removeAttribute("gh");
			}
			
			//Chuyển tiếp về trang lichsu.jsp
			RequestDispatcher rd = request.getRequestDispatcher("lichSuController");
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
