<%@ page contentType="text/html; charset=GBK" %>
<html>
<head>
<title>����������</title>
</head>
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

<script language="JavaScript">
function RgTest(){
if(document.form.typeName.value==""){
window.alert("���������������ƣ�");
document.form.typeName.focus();
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
%>
<table width="568" height="419"  border="0" cellpadding="2" cellspacing="1" bgcolor="#052754">
  <tr>
    <td align="center"bgcolor="#FFFFFF">
	<p><strong style="color:#FF9900">����������</strong></p>
  <form name="form" method="post" action="/news/servlet/InsertType" onSubmit="return RgTest()">
    <table width="256" border="0" cellspacing="1" cellpadding="2" bgcolor="#052754">
      <tr>
        <td width="70" align="center" height="24" bgcolor="#0099cc">���ƣ�</td>
        <td width="175" bgcolor="#ffffff"><input type="text" name="typeName"></td>
      </tr>
    </table>
    <br>
    <input type="submit" name="Submit2" value="�ύ">
	&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="reset" name="Submit" value="����">
  </form>
	</td>
  </tr>
    </table>
 </body>
</html>
