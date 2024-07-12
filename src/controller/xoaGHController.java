package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bo.gioHangbo;

/**
 * Servlet implementation class xoaGHController
 */
@WebServlet("/xoaGHController")
public class xoaGHController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public xoaGHController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();
			
			gioHangbo g = (gioHangbo)session.getAttribute("gh");
			if(g != null) {
				String mp= request.getParameter("mp");
				System.out.println(mp);
				g.Xoa(mp);
				
				if(g.ds.size() != 0) {	
					session.setAttribute("gh", g);
				} else {
					session.removeAttribute("gh");
				}
				
				String mes = "Xóa phim khỏi giỏ thành công!!!";
				request.setAttribute("mes", mes);
			}
			RequestDispatcher rd = request.getRequestDispatcher("cartController");
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
