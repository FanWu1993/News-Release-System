<%@ page contentType="text/html; charset=GBK" %>
<html>
<head>
<title>�˶�����</title>
<link href="../CSS/style.css" rel="stylesheet">
</head>
<script language="JavaScript">
function RgTest(){
if(document.form.managerName.value==""){
window.alert("���������Ա�ʺţ�");
document.form.managerName.focus();
return false;
}

if(document.form.managerPassWord.value==""){
window.alert("���������Ա���룺");
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
        <td width="97" height="32" align="right">�˺ţ�</td>
        <td width="192"><input name="managerName" type="text" size="20"></td>
      </tr>
      <tr>
        <td height="32" align="right">���룺</td>
        <td><input name="managerPassWord" type="password" size="20"></td>
      </tr>
    </table>
    <input name="Submit2" type="submit" class="btn_grey" value="�ύ">	&nbsp;&nbsp;
    <input name="Submit" type="reset" class="btn_grey" value="����"></td>
        </tr>
      </table></td>
    </tr>
</table>
  </form>
  <p align="center"><a href="/news/index.jsp">����</a></p>
</body>
</html>
