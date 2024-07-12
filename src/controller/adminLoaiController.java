package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.loaibean;
import bo.loaibo;

/**
 * Servlet implementation class adminLoaiController
 */
@WebServlet("/adminLoaiController")
public class adminLoaiController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminLoaiController() {
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
			
			loaibo lbo = new loaibo();
			String tab = request.getParameter("tab");
			String ml = request.getParameter("maloai");
			String tenloai = request.getParameter("tenloai");
			ArrayList<loaibean> ds = lbo.getloai();
			String alert = null;
			String mes = null;

			if(request.getParameter("them") != null) {
				int check = lbo.Them(ml, tenloai);
				if(check == 0) {
					mes = "Mã loại phim đã tồn tại!!!";
					alert = "alert-danger";
				} else {
					mes = "Thêm loại phim thành công!!!";
					alert = "alert-success";
				}
			} else if(request.getParameter("sua") != null) {
					lbo.Sua(ml, tenloai);
					mes = "Cập nhật loại phim thành công!!!";
					alert = "alert-success";
			} else {
				ml = request.getParameter("ml");
				tenloai = request.getParameter("tl");
				if(tab != null && tab.equals("xoa")) {
					lbo.Xoa(ml);
					mes = "Xóa loại phim thành công!!!";
					alert = "alert-success";
				}
				else 
					if(tab != null &&  tab.equals("chon")) {
						request.setAttribute("maloai", ml);
						request.setAttribute("tenloai", tenloai);
					}
			}
			
			ArrayList<loaibean> dsloai = lbo.getloai();
			request.setAttribute("dsloai", dsloai);
			request.setAttribute("mes", mes);
			request.setAttribute("alert", alert);
			
			RequestDispatcher rd = request.getRequestDispatcher("adminLoaiPhim.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.print(e);
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
