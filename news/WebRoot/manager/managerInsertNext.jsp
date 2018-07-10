<%@ page contentType="text/html; charset=gb2312" %>
<html>
<head>
<title>managerCheckNameAction</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
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
</style>
</head>
<script language="JavaScript">
function RgTest(){
if(document.form.managerPassword.value==""){
window.alert("请输入管理员密码!");
document.form.managerPassword.focus();
return false;
}
if(document.form.managerRealName.value==""){
window.alert("请输入管理员真实姓名!");
document.form.managerRealName.focus();
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
  String newManagerName=(String)session.getAttribute("new_manager");
%>
<table width="568" height="419"  border="0" cellpadding="2" cellspacing="1" bgcolor="#052754">
  <tr>
    <td align="center" valign="top" bgcolor="#FFFFFF">
	 <br>
	    <br>
	    <br>
	    请继续填写管理员信息
	    <br>
 
   <form name="form" method="post" action="/news/servlet/ManagerInsert" onSubmit="return RgTest()" >
    <table width="269" border="0" cellpadding="2" cellspacing="1" bgcolor="#052754">
      <tr>
        <td width="83" height="24"align="center" bgcolor="#0099cc"> 帐号： </td>
        <td width="175" bgcolor="#ffffff"><%=newManagerName%><input name="managerName" type="hidden" value="<%=request.getParameter("name")%>"></td>
      </tr>
      <tr>
        <td align="center"height="24" bgcolor="#0099cc"> 密码： </td>
        <td bgcolor="#ffffff"><input type="password" name="managerPassword"></td>
      </tr>
  
      <tr>
        <td align="center"  height="24"bgcolor="#0099cc"> 真实姓名： </td>
        <td bgcolor="#ffffff"><input type="text" name="managerRealName"></td>
      </tr>
    </table>
    <br>
    <input type="submit" name="Submit" value="提交"  >
	&nbsp;&nbsp;&nbsp;
    <input type="reset" name="Submit2" value="清除">
  </form>	</td>
  </tr>
</table>
</body>
</html>
