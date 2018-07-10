<%@ page contentType="text/html; charset=gb2312" %>
<html>
<head>
<title>请输入总管理员密码</title>

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
	font-size: 9pt;
	font-weight: bold;
	color: #FF9900;
}
-->
</style></head>
<script language="JavaScript">
function RgTest(){
if(document.form.Name.value==""){
window.alert("请输入总管理员帐户：");
document.form.Name.focus();
return false;
}
if(document.form.adminPassWord.value==""){
window.alert("请输入总管理员密码：");
document.form.adminPassWord.focus();
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
	<span class="style1"><br>
	<br>
	<br>
	总管理员帐户和密码</span><br>

  <form name="form" method="post" action="/news/servlet/ManagerCheck" onSubmit="return RgTest()">
    <table width="268" border="0" cellpadding="2" cellspacing="1" bgcolor="#052754">
	<tr>
        <td width="87" height="24"" align="center" bgcolor="#0099cc">请输入帐户：</td>
        <td width="170" bgcolor="#FFFFFF"><input type="text" name="Name"></td>
      </tr>
      <tr>
        <td width="87" height="24" align="center" bgcolor="#0099cc">请输入密码：</td>
        <td width="170" bgcolor="#FFFFFF"><input type="password" name="adminPassWord"></td>
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
