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
<title>���μ�����������</title>
</head>
<body>
<%
  if(session.getAttribute("admin_name")==null){
	  response.sendRedirect("managerCheck.jsp");
  }
  String new_Password=(String)session.getAttribute("new_Password");
%>
<table width="568" height="419"  border="0" cellpadding="2" cellspacing="1" bgcolor="#052754">
  <tr>
    <td align="center" bgcolor="#FFFFFF">
	  <p>������Ϊ��<%=new_Password%></p>
  <p>���μ�����������</p>
  <p>2���鿴����Ա��Ϣ</p>	</td>
  </tr>
    </table>
</body>
</html>
