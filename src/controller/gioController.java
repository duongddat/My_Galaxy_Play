package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bo.gioHangbo;

/**
 * Servlet implementation class gioController
 */
@WebServlet("/gioController")
public class gioController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public gioController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();
			String mp = request.getParameter("mp");
			String tp = request.getParameter("tp");
			String img = request.getParameter("img"); 
			String gia = request.getParameter("gia");
			
			if(mp != null && tp != null && img != null && gia != null) {
				gioHangbo gh = null;
				
				if(session.getAttribute("gh") == null) {
					gh =new gioHangbo();
					session.setAttribute("gh", gh);
				}
				
				gh = (gioHangbo)session.getAttribute("gh");
				gh.Them(mp, tp, img, Long.parseLong(gia.trim()));
				
				session.setAttribute("gh", gh);
			}
			response.sendRedirect("cartController");
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
