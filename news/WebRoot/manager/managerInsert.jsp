<%@ page contentType="text/html; charset=gb2312" %>
<html>
<head>
<title>管理员注册</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"><style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
}
td{
font-size:9pt;
}
.style1 {
	color: #FF9900;
	font-weight: bold;
}
-->
</style></head>
<script language="JavaScript">
function RgTest(){
if(document.form.name.value==""){
window.alert("请输入帐号：");
document.form.name.focus();
return false;
}

return true;
}
</script>
<body>
<%
  if(session.getAttribute("admin_name")==null){
	  response.sendRedirect("managerCheck.jsp");
}
  if(session.getAttribute("mark").equals("总管理员"))
   {
%>
<table width="568" height="419"  border="0" cellpadding="2" cellspacing="1" bgcolor="#052754">
  <tr>
    <td align="center" valign="top" bgcolor="#FFFFFF">
	  <p><br>
	    <br>
	    <br>
	    <br>
        <span class="style1">管理员注册</span></p>
  <form name="form" method="get" action="/news/servlet/ManagerCheckName" onSubmit="return RgTest()">
    <table width="262" border="0" cellpadding="2" cellspacing="1" bgcolor="#052754">
      <tr>
        <td width="80"  height="24" align="center" bgcolor="#0099cc">请输入帐号：</td>
        <td width="171" bgcolor="#ffffff"><input type="text" name="name"></td>
      </tr>
    </table>
    <br>
    <input type="submit" name="Submit" value="提交">
	&nbsp;&nbsp;&nbsp;
    <input type="reset" name="Submit2" value="重置">
  </form>	</td>
  </tr>
</table>
<%
   }
   else
    out.println("普通管理员不具有本权限！");
%>
</body>
</html>
