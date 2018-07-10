<%@ page contentType="text/html; charset=gb2312" %>
<html>
<head>
<title>
index
</title>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312"><style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
td{
font-size:9pt;
}
.style2 {
	font-size: 9pt;
	color: #FF9900;
	font-weight: bold;
}
-->
</style></head>
<script language="JavaScript">
function RgTest(){
if(document.form.password.value==""){
    window.alert("请输入新密码：");
    return false;
}
if(document.form.password.value==""){
    window.alert("请再次输入新密码：");
return false;
}
if(document.form.nextPassword.value != document.form.password.value){
    window.alert("密码不相同：");
return false;
}
return true;
}
</script>

<body>

<table width="568" height="419"  border="0" cellpadding="2" cellspacing="1" bgcolor="#052754">
  <tr>
    <td align="center" valign="top" bgcolor="#FFFFFF"> <span class="style2"><br>
      <br>
      <br>
      总管理员新密码</span><br>
   <form name="form" method="post" action="/news/servlet/AdminUpdatePassword">
    <table width="315" border="0" cellpadding="2" cellspacing="1" bgcolor="#052754">
      <tr>
        <td width="130" height="24"bgcolor="#0099CC">　请输入新密码：</td>
        <td width="174" bgcolor="#FFFFFF"><input name="password" type="password" ></td>
      </tr>
      <tr>
        <td bgcolor="#0099CC" height="24">　请再次输入新密码：</td>
        <td bgcolor="#FFFFFF"><input name="nextPassword" type="password"></td>
      </tr>
    </table>
    <br>
    <input type="submit" name="Submit2" value="提交" onClick="return RgTest()">  
	&nbsp;&nbsp;&nbsp;
    <input type="reset" name="Submit" value="重置">
  </form>
  <p>&nbsp;</p>
</div>	</td>
  </tr>
  <tr>
    <td align="center" bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
</table>


</body>
</html>
