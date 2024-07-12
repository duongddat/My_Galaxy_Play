package controller;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bo.gioHangbo;

/**
 * Servlet implementation class xoaCheckController
 */
@WebServlet("/xoaCheckController")
public class xoaCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public xoaCheckController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();
			
			Enumeration<String> d= request.getParameterNames();
			gioHangbo g=(gioHangbo)session.getAttribute("gh");
		
		  	while(d.hasMoreElements()) { //Duyệt qua các tên
		     	//out.println( d.nextElement()); //Hiện thị tên
		     	String name = d.nextElement();
		     	String val = request.getParameter(name);
		     	if(val !=  "" && name.contains("check")) {
		     		g.Xoa(val);
		    		if(g.ds.size() != 0) {	
		    			session.setAttribute("gh", g);
		    		} else {
		    			session.removeAttribute("gh");
		    		}
		     	}
		  	}
		  	
		  	RequestDispatcher rd = request.getRequestDispatcher("gioController");
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
