package com.news;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class InsertStyle extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public InsertStyle() {
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
	    out.println("<html>");
	    out.println("<head><title>InsertType</title></head>");
	    out.println("<body bgcolor=\"#ffffff\">");
	    DBconn con=new DBconn();
	    StrConvert str=new StrConvert();
	    Date d=new Date();
	    String typeName=str.chStr(request.getParameter("typeName"));
	    String styleName=str.chStr(request.getParameter("styleName"));
	    String dateTime=String.valueOf(new Date().toLocaleString());
	    //判断输入的类别是否已经存在
	    try{
	      ResultSet rs = con.executeQuery("select * from tb_Style where StyleName='" + styleName + "' and STName='"+typeName+"'");
	     if (rs.next()) {
	        out.println("您添加的类别已经存在，请输入其它类别！");
	        out.println("<a href=../news/manager/insertStyle.jsp>" + "添加" + "</a>");
	      }
	      else {
	          String sql = "insert into tb_Style values('" + styleName + "','"+typeName+"','" +dateTime + "')";
	          con.executeUpdate(sql);
	          response.sendRedirect("/news/manager/insertStyleSuccess.jsp");
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
