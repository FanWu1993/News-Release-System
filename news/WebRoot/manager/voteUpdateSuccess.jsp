<%@ page contentType="text/html; charset=GBK" %>
<html>
<head>

<title>�޸�����ɹ�</title>
<style type="text/css">
<!--
body {
	margin-left:0px;
	margin-top:0px;
}
td{font-size:9pt;}
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
    <td  align="center"bgcolor="#FFFFFF">
	  <p>�޸�����ɹ�</p>
  <p><a href="vote.jsp"><font style="font-size:9pt;">��鿴</font></a></p>
	</td>
  </tr>
    </table>
</body>
</html>

