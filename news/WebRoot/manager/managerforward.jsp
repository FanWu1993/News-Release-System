<%@ page contentType="text/html; charset=GBK" %>
<meta http-equiv="refresh" content="4;URL=commonManger.jsp">
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
<title>添加成功</title>

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
  <p>添加成功
  </p>
  <p>请牢记自己的帐号和密码！！
  </p>
  <p>4秒后请查看新添管理员是否存在</p>	</td>
  </tr>
    </table>
</body>
</html>
