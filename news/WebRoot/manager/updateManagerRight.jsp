<%@ page contentType="text/html; charset=gb2312" %>
<html>
<head>
<title>�޸Ĺ���Ա���Գɹ�</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"><style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
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
	�޸Ĺ���Ա��Ϣ�ɹ�<br>	<br>
<a href="adminSelect.jsp"><font style="font-size:9pt">��鿴</font></a>	</td>
  </tr>
    </table>
</body>
</html>

