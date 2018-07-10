
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setDateHeader("Expires",0);
response.setHeader("Pragma","no-cache");
%>
<html>
<head>
<title>链接信息</title>
<style type="text/css">
body{
margin-left:0px;
margin-top:0px;
}
td{ font-size:9pt;}
</style>
</head>
<script Language="JavaScript">
function projectDelete(date){
if(confirm("是否删除流水号为["+date+"]的一组数据吗？"))
window.location="/news/servlet/delnews?ID="+date;

}
</script>
<body>
<%
  if(session.getAttribute("admin_name")==null){
	  response.sendRedirect("managerCheck.jsp");
}
%>
<jsp:useBean id="con" class="com.news.DBconn" scope="request" />
<table width="568" height="419"  border="0" cellpadding="2" cellspacing="1" bgcolor="#052754">
  <tr>
    <td bgcolor="#FFFFFF" align="center" valign="top"><br>
<br>
<br>
 <p><strong style="color:#FF9900">链接信息</strong></p>
  <table width="497" border="0" cellspacing="1" cellpadding="2" bgcolor="#052754">
    <tr align="center" bgcolor="#0099cc">
      <td width="60" height="24">ID</td>
      <td width="126">链接网站名称</td>
      <td width="80">链接的地址</td>
      <td width="145">发布时间</td>
      <td width="145" align="center">操作</td>
    </tr>
<%
	ResultSet rs = null;
        rs = con.executeQuery("select * from tb_Link");
        while(rs.next()){
          int id = rs.getInt("ID");
          String Name = rs.getString("Name");       
          String Address=rs.getString("Address");
          String IssDate=(String.valueOf(rs.getString("IssueDate"))).substring(0,16);
		 
   %>
    <tr bgcolor="#FFFFFF">
      <td height="24"><%=id%></td>
      <td><%=Name%></td>
      <td><%=Address%></td>
      <td><%=IssDate%></td>
      <td><div align="center"><a href="linkUpdate.jsp?ID=<%=id%>">修改</a>&nbsp;&nbsp;&nbsp;<a href="javascript:projectDelete('<%=id%>')">删除</a></div></td>
    </tr>
<%}
 con.close();
%>
  </table>
  <%--<a href="typeUpdate.jsp?iidd=1&test=你好">测试一下</a>--%>
  <p><a href="insertLink.jsp"><font style="font-size:9pt">添加链接</font></a></p>
	</td>
  </tr>
    </table>
 </body>
</html>
