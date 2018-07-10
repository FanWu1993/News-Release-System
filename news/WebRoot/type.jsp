<jsp:useBean id="con" class="com.news.DBconn" scope="request" />
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%
String type = request.getParameter("type");

%>
<jsp:useBean id="bb" class="Convert.strCut" />
<div class="container_24">
	<div class="grid_17">
		<p class="page-header"><strong><%=type %>新闻</strong></p>
		<table class="table">
			<%
			ResultSet rs = null;
				rs=con.Querysimple("select * from tb_news where Type='"+type+"'order by IssDate desc");
				while(rs.next()){
					int contentID=rs.getInt("ID");
					String title=rs.getString("Title");
					String style=rs.getString("Style");
					String issDate=(String.valueOf(rs.getString("IssDate"))).substring(0,16);
					%>
					<tr>
						<td style="width:500px;text-align:left;">
						<a href="newsContent.jsp?newsID=<%=contentID %>">
						<%=bb.strcut('['+style+']'+title,30) %>
						</a>
						</td>
							<td><%=issDate %></td>
					</tr>
					<%
				}
				con.close();
					%>
					
		</table>
	</div>
</div>

