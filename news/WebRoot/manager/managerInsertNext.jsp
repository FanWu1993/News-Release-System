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
window.alert("���������Ա����!");
document.form.managerPassword.focus();
return false;
}
if(document.form.managerRealName.value==""){
window.alert("���������Ա��ʵ����!");
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
	    �������д����Ա��Ϣ
	    <br>
 
   <form name="form" method="post" action="/news/servlet/ManagerInsert" onSubmit="return RgTest()" >
    <table width="269" border="0" cellpadding="2" cellspacing="1" bgcolor="#052754">
      <tr>
        <td width="83" height="24"align="center" bgcolor="#0099cc"> �ʺţ� </td>
        <td width="175" bgcolor="#ffffff"><%=newManagerName%><input name="managerName" type="hidden" value="<%=request.getParameter("name")%>"></td>
      </tr>
      <tr>
        <td align="center"height="24" bgcolor="#0099cc"> ���룺 </td>
        <td bgcolor="#ffffff"><input type="password" name="managerPassword"></td>
      </tr>
  
      <tr>
        <td align="center"  height="24"bgcolor="#0099cc"> ��ʵ������ </td>
        <td bgcolor="#ffffff"><input type="text" name="managerRealName"></td>
      </tr>
    </table>
    <br>
    <input type="submit" name="Submit" value="�ύ"  >
	&nbsp;&nbsp;&nbsp;
    <input type="reset" name="Submit2" value="���">
  </form>	</td>
  </tr>
</table>
</body>
</html>
