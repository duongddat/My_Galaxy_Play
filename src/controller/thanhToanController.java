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
import bo.gioHangbo;

/**
 * Servlet implementation class thanhToanController
 */
@WebServlet("/thanhToanController")
public class thanhToanController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public thanhToanController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();
			
			khachHangbean kh = (khachHangbean)session.getAttribute("dn");
			if(kh == null) {
				RequestDispatcher rd = request.getRequestDispatcher("dangNhapController");
				rd.forward(request, response);
			}
			
			gioHangbo gh = new gioHangbo();
			if(session.getAttribute("gh") != null) {
				gh = (gioHangbo)session.getAttribute("gh");
				
				int count = gh.ds.size();
				long tong = gh.TongTien();
				
				request.setAttribute("count", (int)count);
				request.setAttribute("tong",tong);
				request.setAttribute("ds", gh.ds);
			}
			
			RequestDispatcher rd = request.getRequestDispatcher("xacnhan.jsp");
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
