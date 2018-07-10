<%@ page contentType="text/html; charset=GBK" %>
<meta http-equiv="refresh" content="2;URL=commonManger.jsp">
<html>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
}
td{
font-size:9pt;
}
-->
</style><head>
<title>输入的密码不正确</title>

</head>
<body>
<%
  if(session.getAttribute("admin_name")==null){
	  response.sendRedirect("managerCheck.jsp");
}
%>
<table width="568" height="419"  border="0" cellpadding="2" cellspacing="1" bgcolor="#052754">
  <tr>
    <td align="center" bgcolor="#FFFFFF">
	  <p>输入的密码不正确</p>
  <p>2秒后自动返回</p>	</td>
  </tr>
    </table>
</body>
</html>

