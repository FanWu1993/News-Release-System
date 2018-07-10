<jsp:useBean id="con" class="com.news.DBconn" scope="request" />
<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="str" class="com.news.Chinese" />
<%
String type = request.getParameter("type");
String key =request.getParameter("key");
key=str.str(key);
type=str.str(type);

%>
<jsp:useBean id="bb" class="Convert.strCut" />
<div class="container_24">
	<div class="grid_17">
		<p class="page-header"><strong>新闻查询结果</strong></p>
		<table class="table">
			<%
			ResultSet rs = null;
				rs=con.Querysimple("select * from tb_news where Title like '%"+key+"%'and Type like '%"+type+"%'");
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

