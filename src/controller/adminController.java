package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bo.bieuDobo;
import bo.doanThubo;
import bo.khachHangbo;
import bo.loaibo;
import bo.phimbo;

/**
 * Servlet implementation class adminController
 */
@WebServlet("/adminController")
public class adminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			khachHangbo khbo = new khachHangbo();
			phimbo pbo = new phimbo();
			loaibo lbo = new loaibo();
			bieuDobo bdbo = new bieuDobo();
			doanThubo dtbo = new doanThubo();
			
			request.setAttribute("countP", pbo.countSL());
			request.setAttribute("countL", lbo.countSL());
			request.setAttribute("countKH", khbo.countKH());
			request.setAttribute("bieudo", bdbo.getBDLoai());
			request.setAttribute("daban", dtbo.daBanNgay());
			request.setAttribute("thunhap", dtbo.thuNhapNgay());
			
			RequestDispatcher rd = request.getRequestDispatcher("admin.jsp");
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
