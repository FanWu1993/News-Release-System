<%@ page contentType="text/html; charset=gb2312" %>
<html>
<head>
<title>���Ĺ���Ա����</title>

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
.style1 {
	font-size: 9pt;
	font-weight: bold;
	color: #FF9900;
}
-->
</style></head>
<script language="JavaScript">
function RgTest(){
  if(document.form.password.value==""){
     window.alert("������ԭ��������");
     document.form.password.focus();
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
   if(session.getAttribute("mark").equals("�ܹ���Ա")){
      String adminpassword=(String)session.getAttribute("admin_password");
 %>
<table width="568" height="419"  border="0" cellpadding="2" cellspacing="1" bgcolor="#052754">
  <tr>
    <td align="center" valign="top" bgcolor="#FFFFFF">
		<span class="style1"><br>
	<br>
	<br>
	�����ܹ���Ա����</span><br>
  <form name="form" method="get" action="/news/servlet/AdminCheckPassword" onSubmit="return RgTest()">
    <table width="302" border="0" cellpadding="2" cellspacing="1" bgcolor="#052754">
	   <input name="adminpassword" type="hidden" value="<%=adminpassword%>">
      <tr>
        <td width="119" height="24" align="center"bgcolor="#0099cc">������ԭ�������룺</td>
        <td width="172" bgcolor="#FFFFFF"><input type="password" name="password"></td>
      </tr>
    </table>
    <br>
    <input type="submit" name="Submit2" value="�ύ">
	&nbsp;&nbsp;&nbsp;
    <input type="reset" name="Submit" value="����">
  </form>	</td>
  </tr>
</table>
<%
   }
   else
    out.println("��ͨ����Ա�����б�Ȩ�ޣ�");
%>
</body>
</html>
