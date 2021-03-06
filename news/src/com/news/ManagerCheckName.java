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

public class ManagerCheckName extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ManagerCheckName() {
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
	    DBconn con=new DBconn();
	    StrConvert str=new StrConvert();

	    out.println("<html>");
	    out.println("<head><title>managerCheckName</title></head>");
	    out.println("<body bgcolor=\"#ffffff\">");
	    String name=str.chStr(request.getParameter("name"));
	    //out.print(name);
	    try{
	    ResultSet rs = con.executeQuery("select * from tb_manager where Name='"+name+"'");
	      if(rs.next()){
	            response.sendRedirect("/news/manager/managerInsertWrong.jsp");
	      }
	      else{
	          session.setAttribute("new_manager",name);
	          response.sendRedirect("/news/manager/managerInsertNext.jsp");
	      }
	       con.close();
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
