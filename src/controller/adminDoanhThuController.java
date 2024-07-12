package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bo.doanThubo;

/**
 * Servlet implementation class adminDoanhThuController
 */
@WebServlet("/adminDoanhThuController")
public class adminDoanhThuController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminDoanhThuController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String tk = request.getParameter("kt");
			doanThubo dtbo = new doanThubo();
			long thunhap = dtbo.thuNhapNgay();
			
			if(tk != null) {
				if(tk.equals("ngay")) {
				   thunhap = dtbo.thuNhapNgay();
				} else if(tk.equals("thang")) {
					thunhap = dtbo.thuNhapThang();
				} else if(tk.equals("nam")) {
					thunhap = dtbo.thuNhapThang();
				}
			}
			request.setAttribute("daban", dtbo.daBanNgay());
			request.setAttribute("thunhap", thunhap);
			request.setAttribute("tongDT", dtbo.tongDT());
			request.setAttribute("tongDT", dtbo.tongDT());
			request.setAttribute("tongSPThue", dtbo.tongSPTHue());
			request.setAttribute("dothi", dtbo.TKThang());
			request.setAttribute("tuan", dtbo.bieuDoDT());
			
			RequestDispatcher rd = request.getRequestDispatcher("adminDoanhThu.jsp");
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
