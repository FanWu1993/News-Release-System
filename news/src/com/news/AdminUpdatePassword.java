package com.news;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AdminUpdatePassword extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public AdminUpdatePassword() {
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
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession session=request.getSession(true);
	    out.println("<html>");
	    out.println("<head><title>adminUpdatePassword</title></head>");
	    out.println("<body bgcolor=\"#ffffff\">");
	    DBconn con=new DBconn();
	    StrConvert str=new StrConvert();
	    String password=str.chStr(request.getParameter("password"));
	    session.setAttribute("newPassword",password);
	    String admin_name=(String)session.getAttribute("admin_name");
	    String sql="update tb_manager set Password='"+password+"'where Name='"+admin_name+"'";
	    con.executeUpdate(sql);
	    response.sendRedirect("../manager/adminPasswordRight.jsp");
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
