<%@ page contentType="text/html; charset=GBK" %>
<meta http-equiv="refresh" content="3;URL=right_main.jsp">
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
.style1 {
	font-size: 10pt;
	font-weight: bold;
	color: #FF9900;
}
-->
</style><head>
<title>
index
</title>
</head>
<body>
<%
  if(session.getAttribute("admin_name")==null){
	  response.sendRedirect("managerCheck.jsp");
}
String newPassword=(String)session.getAttribute("newPassword");
%>
<table width="568" height="419"  border="0" cellpadding="2" cellspacing="1" bgcolor="#052754">
  <tr>
    <td align="center" valign="top" bgcolor="#FFFFFF"><span class="style1"><br>
      <br>
      <br>
      �޸�����ɹ�</span><br>
      <br>
  <table width="258" border="0" cellpadding="2" cellspacing="1" bgcolor="#052754">
    <tr>
      <td width="106" align="center" bgcolor="#0099cc">����������Ϊ��</td>
      <td width="141" bgcolor="#FFFFFF"><%=newPassword%></td>
    </tr>
  </table>
  <p>���μ��Լ��������롣</p>
  <p>3��󷵻�</p> 	</td>
  </tr>
</table>
</body>
</html>
