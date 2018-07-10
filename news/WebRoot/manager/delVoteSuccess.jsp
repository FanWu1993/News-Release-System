<%@ page contentType="text/html; charset=GBK" %>
<html>
<head>
<title>跳转</title>
<style type="text/css">
<!--
body{
margin-left:0px;
margin-top:0px;
}
td{
font-size:9pt;
}
-->
</style>
<script Language="JavaScript">
function project(){
window.location="newsType.jsp";

}
</script>
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
	  <p>删除成功</p>
 <a href="vote.jsp" target="_self" onClick="javascript:project()" >
 <p><font style="font-size:9pt">请查看</font></p></a>
 </td>
  </tr>
    </table>
</body>
</html>

