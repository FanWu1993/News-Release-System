<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*"%>
<html>
<head>
<title>
main
</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"><style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
}
td{
font-size:9pt;
}
-->
</style>
</head>
<body bgcolor="#ffffff">
<jsp:useBean id="con" class="com.news.DBconn" scope="request" />
<table width="464" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#052754">
 <%
	String sql1=" select * from tb_newsType";
	ResultSet rs1=con.Querysimple(sql1);
	while(rs1.next()){
	     int id = rs1.getInt("ID");
         String typeName=rs1.getString("TypeName");
 %>
    <tr align="center" bgcolor="#0099cc">
      <td width="254" height="20"><%=typeName%></td>
	  <td width="100">详细类型</td>
      <td width="110"><a href="type.jsp?type=<%=typeName%>" target="main">进入专题</a></td>
    </tr>
     <%
	    String sql2=" select top 3 * from tb_news where Type='"+typeName+"'order by IssDate desc";
	    ResultSet rs2=con.Querysimple(sql2);
	    while(rs2.next()){
            int contentID=rs2.getInt("ID");
            String title=rs2.getString("Title");
            String content=rs2.getString("Content");
            String style=rs2.getString("Style");
		    String issDate=(String.valueOf(rs2.getString("IssDate"))).substring(0,16);
		   %>
		<tr bgcolor="#FFFFFF">
          <td height="24"><a href="newsContent.jsp?newsID=<%=contentID%>"><DIV STYLE="width: 230px; border: 0px solid blue;     overflow: hidden; text-overflow:ellipsis"> 
<NOBR><%=title%></NOBR> 
</DIV></a></td>
          <td width="80"><%=style%></a></td>
		  <td width="184" align="center"><%=issDate%></td>
         </tr>
     <%
         }
      }
     con.close();
%>
</table>
</body>
</html>
