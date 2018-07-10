<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="java.sql.*"%>
<jsp:useBean id="con" class="com.news.DBconn" scope="request" />
<%
	ResultSet rs=con.executeQuery("select * from tb_newsType");
	while(rs.next()){
	int ID=rs.getInt("ID");
	String typeName=rs.getString("TypeName");
	%>
	<a href="insertNews.jsp?typeID=<%=ID%>"><%=typeName%></a>
	<%
	}
	con.close();
 %>