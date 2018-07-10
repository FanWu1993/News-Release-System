package com.news;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AdminCheckPassword extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public AdminCheckPassword() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		//super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		 HttpSession session=request.getSession(true);
		    out.println("<html>");
		    out.println("<head><title>adminCheckPasswordAction</title></head>");
		    out.println("<body bgcolor=\"#ffffff\">");
		    DBconn con=new DBconn();
		    StrConvert str=new StrConvert();
		    String adminpassword=(String)session.getAttribute("admin_password");
		    String password=str.chStr(request.getParameter("password"));
		    if(password.equals(adminpassword)){
		        response.sendRedirect("../manager/changerPassword.jsp");
		    }
		    else{
		       response.sendRedirect("../manager/adminChangerPasswordWrong.jsp");
		    }
		      out.println("</body></html>");
		out.flush();
		out.close();
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
