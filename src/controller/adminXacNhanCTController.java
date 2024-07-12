package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.xacNhanCTbean;
import bo.chiTietHoaDonbo;
import bo.hoaDonbo;

/**
 * Servlet implementation class adminXacNhanCTController
 */
@WebServlet("/adminXacNhanCTController")
public class adminXacNhanCTController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminXacNhanCTController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String ma = request.getParameter("mact");
			String mahd = request.getParameter("mahd");
			String tab = request.getParameter("tab");
						
			chiTietHoaDonbo ctbo = new chiTietHoaDonbo();
			hoaDonbo hdbo = new hoaDonbo();
			
			if(tab != null) {
				if(ma != null && tab.equals("xn")) {
					ctbo.CapNhat(Long.parseLong(ma));
					hdbo.TuDongCapNhat();
					
				} else if (ma != null && tab.equals("xoa")) {
					ctbo.Xoa(Long.parseLong(ma));
					hdbo.Xoa();
					hdbo.TuDongCapNhat();
				}
			}
			
			ArrayList<xacNhanCTbean> dshd = ctbo.getHDChuaXacNhan();
			if(mahd != null) {
				dshd = ctbo.timTheoHD(Long.parseLong(mahd));
			}
			
			request.setAttribute("dshd", dshd);
			RequestDispatcher rd = request.getRequestDispatcher("adminXNCT.jsp");
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
