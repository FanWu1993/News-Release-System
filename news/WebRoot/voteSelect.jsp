<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.List"%>
<%@ page import="com.news.SessionLib"%>
<html>
<head>
<title>�鿴��������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"><style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
}
td{
font-size:9pt;
}
.style1 {font-size: 11pt}
.style2 {	color: #FF9900;
	font-weight: bold;
	font-style: italic;
}
-->
</style></head>
<body>
<jsp:useBean id="con" class="com.news.DBconn" scope="request" />
<table  border="0" align="left" cellpadding="2" cellspacing="1" bgcolor="#052754">
  <tr>
    <td align="center" valign="top" bgcolor="#FFFFFF">
		<table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="35">&nbsp;</td>
      </tr>
      <tr>
        <td background="jsp/images/line.jpg"><span class="style2">�鿴�˶�Ա����</span></td>
      </tr>
    </table>
	  <br>	  <font style="font-size:11pt; ">
 <div align="center">
<% 
  String s1=(String)session.getAttribute("s1");
  s1=null;
  if(s1==null){
%>
  <table width="540" border="0" cellpadding="2" cellspacing="1" bgcolor="#052754">
    <tr align="center" bgcolor="#0099cc">
      <td width="50">�˶�Ա</td>
      <td width="50">������</td>
	   <td width="50">����</td>
	    <td width="60">��Ŀ</td>
		 <td width="280">���</td>
         <td width="50">����</td>
    </tr>
<%
 ResultSet rs = con.Querysimple("select * from tb_Vote");
 while(rs.next()){
    int id=rs.getInt("ID");
%>
    <tr bgcolor="#FFFFFF">
      <td><%=rs.getString("Name")%></td>
      <td><%=rs.getString("Address")%></td>
      <td><%=rs.getString("Country")%></td>
      <td><%=rs.getString("Job")%></td>
      <td><%=rs.getString("Remark")%></td>
      <td align="center"><form name="form" method="post" action="voteAdd.jsp?ID=<%=id%>" >
        <input type="submit" name="Submit" value="ͶƱ">
      </form></td>
    </tr>
 <%
  }
  con.close();
 %>
<%}else{
  out.println("�Ѿ�ͶƱ����");
}
%>
  </table>
  </td>
  </tr>
</table>
</body>
</html>