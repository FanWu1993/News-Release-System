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

public class AdminCheck extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public AdminCheck() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
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
	    DBconn con=new DBconn();
	    StrConvert str=new StrConvert();
		out
				.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>后台登录验证</TITLE></HEAD>");
		out.println("  <BODY>");
		String name=str.chStr(request.getParameter("managerName"));
	    String password=str.chStr(request.getParameter("managerPassWord"));
	    try{
	    ResultSet rs = (ResultSet) con.executeQuery("select * from tb_manager where Name='"+name+"'and Password='"+password+"'");
	    if(rs.next()){
	         session.setAttribute("admin_name",name);
	         session.setAttribute("admin_password",password);
	         String mark=rs.getString("mark");
	         session.setAttribute("mark",mark);
	         response.sendRedirect("../manager/managerCheckSuccess.jsp");
	      }
	      else{
	          response.sendRedirect("../manager/managerCheckFail.jsp");
	      }
	    }
	    catch(SQLException e){}
		out.println("  </BODY>");
		out.println("</HTML>");
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
