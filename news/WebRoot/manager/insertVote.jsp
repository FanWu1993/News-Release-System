<%@ page contentType="text/html; charset=GBK" %>
<%@page import="com.sun.corba.se.spi.orbutil.fsm.Guard.Result"%>
<%@page import="java.sql.*"%>
<jsp:useBean id="con" class="com.news.DBconn" scope="request" />
<html>
<head>
<title>添加运动员信息</title>
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
window.alert("请添加人物名称：");
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
	<p><strong style="color:#FF9900">添加运动员信息</strong></p>
  <form name="form" method="post" action="/news/servlet/InsertLink" onSubmit="return RgTest()">
<table width="256" border="0" cellspacing="1" cellpadding="2" bgcolor="#052754">
  <tr>
    <td width="70" align="center" height="24" bgcolor="#0099cc">人物名称：</td>
    <td width="175" bgcolor="#ffffff"><input type="text" name="Name"></td>
  </tr>
</table>
<table width="256" border="0" cellspacing="1" cellpadding="2" bgcolor="#052754">
  <tr>
    <td width="70" align="center" height="24" bgcolor="#0099cc">人物籍贯：</td>
    <td width="175" bgcolor="#ffffff"><input type="text" name="Address"></td>
  </tr>
</table><table width="256" border="0" cellspacing="1" cellpadding="2" bgcolor="#052754">
  <tr>
    <td width="70" align="center" height="24" bgcolor="#0099cc">人物年龄：</td>
    <td width="175" bgcolor="#ffffff"><input type="text" name="Name"></td>
  </tr>
</table>
<table width="256" border="0" cellspacing="1" cellpadding="2" bgcolor="#052754">
  <tr>
    <td width="70" align="center" height="24" bgcolor="#0099cc">人物工作：</td>
    <td width="175" bgcolor="#ffffff"><input type="text" name="Address"></td>
  </tr>
</table>
<table width="256" border="0" cellspacing="1" cellpadding="2" bgcolor="#052754">
  <tr>
  	 	<td width="70" align="center" height="24" bgcolor="#0099cc">简单介绍：</td>
	 	<td width="175" bgcolor="#ffffff"><textarea name="Remark" ></textarea>
  </tr>
</table>
    <br>
    <input type="submit" name="Submit2" value="提交">
	&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="reset" name="Submit" value="重置">
  </form>
	</td>
  </tr>
    </table>
 </body>
</html>
