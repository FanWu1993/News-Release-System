<%@ page contentType="text/html; charset=GBK" %>
<html>
<head>
<title>��ת</title>
</head>
<style type="text/css">
<!--
body{
margin-top:0px;
margin-left:0px;
}
td{
font-size:9pt;
}
-->

</style>
<script Language="JavaScript">
function project(){
window.location="vote.jsp";

}
</script>
<body>
<%
  if(session.getAttribute("admin_name")==null){
	  response.sendRedirect("managerCheck.jsp");
}
%>
<table width="568" height="419"  border="0" cellpadding="2" cellspacing="1" bgcolor="#052754">
  <tr>
    <td  align="center"bgcolor="#FFFFFF">
	  <p>�޸ĳɹ�</p>
  <a href="vote.jsp" target="_self" onClick="javascript:project()" >
  <p><font style="font-size:9pt">��鿴</font></p></a>
	</td>
  </tr>
    </table>
</body>
</html>

