package com.news;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ManagerInsert extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ManagerInsert() {
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
	    String newManagerName=(String)session.getAttribute("new_manager");
	    String managerPassword=str.chStr(request.getParameter("managerPassword"));
	    String managerRealName=str.chStr(request.getParameter("managerRealName"));
	    String nowtime=String.valueOf(new Date().toLocaleString());
	    out.println("<html>");
	    out.println("<head><title>ManagerInsert</title></head>");
	    out.println("<body bgcolor=\"#ffffff\">");
	    String sql="insert into tb_manager values('"+newManagerName+"','"+managerPassword+"','"+managerRealName+"','"+nowtime+"','普通管理员')";
	    con.executeUpdate(sql);
	    response.sendRedirect("/news/manager/managerforward.jsp");
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
