package com.news;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ManagerCheck extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ManagerCheck() {
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
	    DBconn con=new DBconn();
	    StrConvert str=new StrConvert();
	    out.println("<html>");
	    out.println("<head><title>ManagerCheck</title></head>");
	    out.println("<body bgcolor=\"#ffffff\">");
	    String name=str.chStr(request.getParameter("Name"));
	    String password=str.chStr(request.getParameter("adminPassWord"));
	    try{
	    ResultSet rs = con.executeQuery("select * from tb_manager where Name='"+name+"'and Password='"+password+"'");
	    if(rs.next()){
	            session.setAttribute("admin_name",name);
	            response.sendRedirect("/news/manager/adminSelect.jsp");
	      }
	      else{
	          response.sendRedirect("/news/manager/adminPasswordFail.jsp");
	      }
	    }
	    catch(SQLException e){}
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
