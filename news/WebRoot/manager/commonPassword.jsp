<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="java.sql.*"%>

<html>
<head>
<title>普通管理员修改密码</title>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312"><style type="text/css">
<!--
body {
	margin-left: 00px;
	margin-top: 0px;
}
td{
font-size:9pt;
}
.style1 {
	color: #FF9900;
	font-weight: bold;
}
-->
</style></head>
<script language="JavaScript">
function RgTest(){

if(document.form.wordpass.value==""){
window.alert("请输入原来的密码：");
document.form.wordpass.focus();
return false;
}

return true;
}
</script>
<%
  if(session.getAttribute("admin_name")==null){
	  response.sendRedirect("managerCheck.jsp");
  }
  String commonID=request.getParameter("ID");
%>

<body>
<table width="568" height="419"  border="0" cellpadding="2" cellspacing="1" bgcolor="#052754">
  <tr>
    <td align="center" valign="top" bgcolor="#FFFFFF">
	  <p><br>
	    <br>
	    <br>
        <span class="style1">普通管理员修改密码</span></p>
  <form name="form" method="get" action="/news/servlet/ManagerCheckPassword"  onSubmit="return RgTest()">
    <table width="308" border="0" cellpadding="2" cellspacing="1" bgcolor="#052754">
   <input name="ID" type="hidden" value="<%=commonID%>">
   <%--<input name="password" type="hidden" value="<%=manager.getManagerPassword()%>">--%>
  
      <tr>
        <td width="123" align="center" bgcolor="#0099cc"><span >请输入原来的密码：</span></td>
        <td width="174" bgcolor="#FFFFFF"><input type="password" name="wordpass"></td>
      </tr>
    </table>
    <p>
      <input type="submit" name="Submit2" value="提交">
	  &nbsp;&nbsp;&nbsp;
      <input type="reset" name="Submit" value="重置">
    </p>
  </form>	</td>
  </tr>
</table>
</body>
</html>