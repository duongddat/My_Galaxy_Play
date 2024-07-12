package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.xacNhanHDbean;
import bo.chiTietHoaDonbo;
import bo.hoaDonbo;

/**
 * Servlet implementation class adminXacNhanHDController
 */
@WebServlet("/adminXacNhanHDController")
public class adminXacNhanHDController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminXacNhanHDController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			chiTietHoaDonbo ctbo = new chiTietHoaDonbo();
			hoaDonbo hdbo = new hoaDonbo();
			
			String ma = request.getParameter("mahd");
			
			if(ma != null) {
				hdbo.CapNhat(Long.parseLong(ma));
				ctbo.CapNhatTheoHD(Long.parseLong(ma));
			}
			
			ArrayList<xacNhanHDbean> ds = hdbo.getHDXacNhan();
			request.setAttribute("dshd", ds);
			
			RequestDispatcher rd = request.getRequestDispatcher("adminXNHD.jsp");
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
