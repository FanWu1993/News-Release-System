<%@ page contentType="text/html; charset=gb2312" %>
<html>
<head>
<title>转向</title>
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
</style></head>
<body>
<%
  if(session.getAttribute("admin_name")==null){
	  response.sendRedirect("managerCheck.jsp");
}
%>
<table width="568" height="419"  border="0" cellpadding="2" cellspacing="1" bgcolor="#052754">
  <tr>
    <td align="center" bgcolor="#FFFFFF">
  <p>成功添加新闻</p>
  <p><a href="news.jsp"><font style="font-size:9pt">请查看全部新闻</font></a></p>
  <%--<p><a href="insertNewsType.jsp"><font style="font-size:9pt">请填写其他类型新闻</font></a></p>
  <p><a href="insertNews.jsp%>"><font style="font-size:9pt">请继续填写(######)新闻类型</font></a></p>--%>	</td>
  </tr>
    </table>
</body>
</html>
