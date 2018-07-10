<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="java.sql.*"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
<style type="text/css">
<!--
.STYLE1 {
	font-size: 24px;
	font-weight: bold;
}
.STYLE2 {
	font-size: 16px;
	font-weight: bold;
}
-->
</style>
</head>
<jsp:useBean id="con" class="com.news.DBconn" scope="request" />
<%
	String newsID=request.getParameter("newsID");
	ResultSet rs= con.executeQuery("select * from tb_news where ID="+newsID);
	rs.next();
	String Title=rs.getString("Title");
	String Content=rs.getString("Content");
	String Type=rs.getString("Type");
	String Style=rs.getString("Style");
	String IssDate=(String.valueOf(rs.getString("IssDate"))).substring(0,16); %>

<body>
<p class="STYLE1"><%=Type %>新闻</p>
<form id="form1" name="form1" method="post" action="">
  <p align="center" class="STYLE2"><%=Title %></p>
  <p align="center">发布时间：<%=IssDate %> 类别：<%=Style %> </p>
</form>
<form id="form2" name="form2" method="post" action="">
           <%=Content %>
</form>
<p>&nbsp; </p>
</body>


</html>
