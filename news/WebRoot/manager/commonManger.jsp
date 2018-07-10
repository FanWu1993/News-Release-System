<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="java.sql.*"%>
<%@ page import="com.news.StrConvert"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<html>
<head>
<title>查看管理员信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"><style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
}
td{
font-size:9pt;
}
.style1 {
	color: #FF9900;
	font-weight: bold;
}
-->
</style></head>
<body>
<jsp:useBean id="con" class="com.news.DBconn" scope="request" />
<%
  if(session.getAttribute("admin_name")==null){
	  response.sendRedirect("managerCheck.jsp");
  }
if(session.getAttribute("mark").equals("总管理员"))
   {
StrConvert str=new StrConvert();
String type=str.chStr(request.getParameter("type"));
%>
<table width="568" height="419"  border="0" cellpadding="2" cellspacing="1" bgcolor="#052754">
  <tr>
    <td align="center" valign="top" bgcolor="#FFFFFF">
	<p><br>
	  <br>
	  <br>
	  <span class="style1">查看管理员信息</span></p>
  <table width="514" border="0" cellpadding="2" cellspacing="1" bgcolor="#052754">
    <tr align="center" bgcolor="#0099cc">
      <td width="66" height="24">帐号</td>
      <td width="103">真实姓名</td>
      <td width="111">注册时间</td>
      <td width="102">管理员类别</td>
     <td width="106">操作</td>
	</tr>
    <%
	ResultSet rs = null;
        rs = con.executeQuery("select * from tb_manager where mark='普通管理员'order by IssueDate");
        while(rs.next()){
          int id = rs.getInt("ID");
          String name = rs.getString("Name");
      	  String realName = rs.getString("RealName");
		  //String issueDate = new SimpleDateFormat("yyyy-MM-dd").format(rs.getDate("IssueDate"));
		  String issueDate = (String.valueOf(rs.getString("IssueDate"))).substring(0,16);
		  String mark = rs.getString("mark"); 
   %>
 <tr bgcolor="#ffffff">
      <td height="24"><%=name%></td>
      <td><%=realName%></td>
      <td><%=issueDate%></td>
      <td><%=mark%></td>
      <td align="center"><a href="commonPassword.jsp?ID=<%=id%>">修改密码</a></td>
    </tr>
<%}
 con.close();
%>
  </table>	</td>
  </tr>
</table>
<%
   }
   else
    out.println("普通管理员不具有本权限！");
%>
</body>
</html>
