<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="java.util.List"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<title>���Ĺ���Ա������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"><style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
}
td{
font-size:9pt;
}
.style1 {font-size: 9pt}
.style3 {
	font-size: 9pt;
	font-weight: bold;
	color: #FF9900;
}
-->
</style></head>
<script language="JavaScript">
function RgTest(){
if(document.form.managerName.value==""){
window.alert("���������Ա�ʺţ�");
document.form.managerName.focus();
return false;
}

if(document.form.managerRealName.value==""){
window.alert("���������Ա��ʵ������");
document.form.managerRealName.focus();
return false;
}
return true;
}
</script>
<body>
<jsp:useBean id="con" class="com.news.DBconn" scope="request" />
 <%
  if(session.getAttribute("admin_name")==null){
	  response.sendRedirect("managerCheck.jsp");
}
    String id=request.getParameter("ID");
	ResultSet rs = con.executeQuery("select * from tb_manager where ID="+id);
    while(rs.next()){
	    int managerID = rs.getInt("ID");
        String name = rs.getString("Name");
		String password = rs.getString("Password");
      	String realName = rs.getString("RealName");
		String mark = rs.getString("mark");
   %>
<table width="568" height="419"  border="0" cellpadding="2" cellspacing="1" bgcolor="#052754">
  <tr>
    <td align="center" valign="top" bgcolor="#FFFFFF">
	<span class="style3 style1"><br>
	<br>
	<br>
	���¹���Ա����Ϣ</span><br>
<form name="form" method="post" action="/news/servlet/UpdateManager?managerID=<%=managerID%>" onSubmit="return RgTest()">
  <table width="319" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#052754">
    <tr>
      <td width="90"  height="24"bgcolor="#0099cc" class="style1">���ʺţ�</td>
      <td width="218" bgcolor="#ffffff"><input type="text" name="managerName" value="<%=name%>"></td>
    </tr>
    <tr>
      <td  height="24"bgcolor="#0099cc">�����룺</td>
      <td bgcolor="#ffffff"><input type="hidden" name="managerPassword" value="<%=password%>"></td>
    </tr>

    <tr>
      <td  height="24"bgcolor="#0099cc">����ʵ������</td>
      <td bgcolor="#ffffff"><input type="text" name="managerRealName" value="<%=realName%>"></td>
    </tr>
    <tr>
      <td  height="24"bgcolor="#0099cc">������Ա���</td>
      <td bgcolor="#ffffff"><%=mark%><input type="hidden" name="managerMark" value="<%=mark%>"></td>
    </tr>
  </table>
  <br>
  <%}
  con.close();
  %>
     <input type="submit" name="Submit2" value="�ύ">
	&nbsp;&nbsp;&nbsp;
    <input type="reset" name="Submit" value="����">
</form>	</td>
  </tr>
</table>
</body>
</html>
