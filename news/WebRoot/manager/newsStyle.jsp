
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
<title>查看全部二级类别的名称</title>
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
window.location="/news/servlet/DelStyle?ID="+date;

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
 <p><strong style="color:#FF9900">查看全部类别的名称</strong></p>
  <table width="497" border="0" cellspacing="1" cellpadding="2" bgcolor="#052754">
    <tr align="center" bgcolor="#0099cc">
      <td width="60" height="24">ID</td>
      <td width="126">详细类别的名称</td>
      <td width="80">类型</td>
      <td width="145">添加的时间</td>
      <td width="145" align="center">操作</td>
    </tr>
<%
	ResultSet rs = null;
        rs = con.executeQuery("select * from tb_Style");
        while(rs.next()){
          int id = rs.getInt("ID");
          String styleName = rs.getString("StyleName");
          String STName=rs.getString("STName");
      	  //String dateTime = rs.getString("DateTime");
		  String dateTime = (String.valueOf(rs.getString("DateTime"))).substring(0,16);
		  //String issueDate = new SimpleDateFormat("yyyy-MM-dd").format(rs.getDate("IssueDate"));
		 
   %>
    <tr bgcolor="#FFFFFF">
      <td height="24"><%=id%></td>
      <td><%=styleName%></td>
      <td><%=STName%></td>
      <td><%=dateTime%></td>
      <td><div align="center"><a href="styleUpdate.jsp?ID=<%=id%>&style=<%=styleName%>">修改</a>&nbsp;&nbsp;&nbsp;<a href="javascript:projectDelete('<%=id%>')">删除</a></div></td>
    </tr>
<%}
 con.close();
%>
  </table>
  <%--<a href="typeUpdate.jsp?iidd=1&test=你好">测试一下</a>--%>
  <p><a href="insertStyle.jsp"><font style="font-size:9pt">添加二级类别名称</font></a></p>
	</td>
  </tr>
    </table>
 </body>
</html>
