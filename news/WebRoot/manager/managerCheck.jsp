<%@ page contentType="text/html; charset=GBK" %>
<html>
<head>
<title>核对密码</title>
<link href="../CSS/style.css" rel="stylesheet">
</head>
<script language="JavaScript">
function RgTest(){
if(document.form.managerName.value==""){
window.alert("请输入管理员帐号：");
document.form.managerName.focus();
return false;
}

if(document.form.managerPassWord.value==""){
window.alert("请输入管理员密码：");
document.form.managerPassWord.focus();
return false;
}

return true;
}
</script>
<body>

  <form name="form" method="get" action="/news/servlet/AdminCheck" onSubmit="return RgTest()">
  <table width="298" height="253"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="159" valign="top" background="../images/managerCheck.gif"><table width="100%" height="199"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td height="95">&nbsp;</td>
        </tr>
        <tr>
          <td align="center">
    <table width="289" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="97" height="32" align="right">账号：</td>
        <td width="192"><input name="managerName" type="text" size="20"></td>
      </tr>
      <tr>
        <td height="32" align="right">密码：</td>
        <td><input name="managerPassWord" type="password" size="20"></td>
      </tr>
    </table>
    <input name="Submit2" type="submit" class="btn_grey" value="提交">	&nbsp;&nbsp;
    <input name="Submit" type="reset" class="btn_grey" value="重置"></td>
        </tr>
      </table></td>
    </tr>
</table>
  </form>
  <p align="center"><a href="/news/index.jsp">返回</a></p>
</body>
</html>
