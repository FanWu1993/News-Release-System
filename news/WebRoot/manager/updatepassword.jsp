<%@ page contentType="text/html; charset=gb2312" %>
<html>
<head>
<title>�޸�����</title>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312"><style type="text/css">
<!--
body {
	margin-left: 00px;
	margin-top: 0px;
}
.style1 {
	color: #FF9900;
	font-weight: bold;
}
td{
font-size:9pt;
}
-->
</style></head>
<script language="JavaScript">
function RgTest(){

if(document.form.password.value==""){
window.alert("�����������룺");

return false;
}

if(document.form.password.value==""){
window.alert("���ٴ����������룺");

return false;
}

if(document.form.nextPassword.value != document.form.password.value){
window.alert("���벻��ͬ��");

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
  String managerID=(String)session.getAttribute("manager_id");
%>
<table width="568" height="419"  border="0" cellpadding="2" cellspacing="1" bgcolor="#052754">
  <tr>
    <td align="center" valign="top" bgcolor="#FFFFFF">
	 <p><br>
	   <br>
	   <br>
       <span class="style1">������</span></p>
  <form name="form" method="get" action="/news/servlet/ManagerUpdatePassword?ID=<%=managerID%>" >
    <table width="312" border="0" cellpadding="2" cellspacing="1" bgcolor="#052754">
      <tr>
        <td width="120" bgcolor="#0099cc">�����������룺</td>
        <td width="181" bgcolor="#ffffff"><input name="password" type="password" ></td>
      </tr>
      <tr>
        <td bgcolor="#0099cc">���ٴ����������룺</td>
        <td bgcolor="#ffffff"><input name="nextPassword" type="password"></td>
      </tr>
    </table>
    <br>
    <input type="submit" name="Submit2" value="�ύ" onClick="return RgTest()">  
	&nbsp;&nbsp;&nbsp;
    <input type="reset" name="Submit" value="����">
  </form>	</td>
  </tr>
</table>
</body>
</html>
