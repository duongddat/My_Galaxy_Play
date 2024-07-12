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
 * Servlet implementation class suaGHController
 */
@WebServlet("/suaGHController")
public class suaGHController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public suaGHController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();
			
			gioHangbo g=(gioHangbo)session.getAttribute("gh");
			String mp= request.getParameter("mp");
			String sl= request.getParameter("txtsua");

			g.Sua(mp,Integer.parseInt(sl));
			session.setAttribute("gh", g);
			
			String mes = "Cập nhật thời lượng thuê phim thành công!!!";
			request.setAttribute("mes", mes);
			
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
