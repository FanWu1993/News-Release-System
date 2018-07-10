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

public class insertNews extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public insertNews() {
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
	    out.println("<head><title>InsertNews</title></head>");
	    out.println("<body bgcolor=\"#ffffff\">");
	    DBconn con=new DBconn();
	    StrConvert str=new StrConvert();
	    Date d=new Date();
	    String newTitle=str.chStr(request.getParameter("newTitle"));
	    String newContent=str.chStr(request.getParameter("newContent"));
	    String newtype=str.chStr(request.getParameter("newtype"));
	    String styleName=str.chStr(request.getParameter("styleName"));
	    String dateTime=String.valueOf(new Date().toLocaleString());
	    //判断输入的类别是否已经存在
	    try{
	      ResultSet rs = con.executeQuery("select * from tb_news where Title='" + newTitle + "'");
	     if (rs.next()) {
	        out.println("您添加的类别已经存在，请输入其它类别！");
	        out.println("<a href=../news/manager/insertType.jsp>" + "添加" + "</a>");
	      }
	      else {
	          String sql = "insert into tb_news values('" + newTitle + "','" +newContent + "','" +newtype + "','" +styleName + "','" +dateTime+ "')";
	          con.executeUpdate(sql);
	          response.sendRedirect("/news/manager/insertNewsSuccess.jsp");
	      }
	    }
	    catch(SQLException e){e.printStackTrace();}

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
