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

public class ManagerCheckPassword extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ManagerCheckPassword() {
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
	    String managerPassword=str.chStr(request.getParameter("wordpass"));
	    String managerID=str.chStr(request.getParameter("ID"));
	    out.println("<html>");
	    out.println("<head><title>managerCheckPassword</title></head>");
	    out.println("<body bgcolor=\"#ffffff\">");
	    try{
	    ResultSet rs = con.executeQuery("select * from tb_manager where Password='"+managerPassword+"'and ID="+managerID);
	      if(rs.next()){
	            session.setAttribute("manager_id",managerID);
	            session.setAttribute("manager_password",managerPassword);
	            response.sendRedirect("/news/manager/updatepassword.jsp");
	      }
	      else{
	          response.sendRedirect("/news/manager/updatepasswordwrong.jsp");
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
