<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="java.sql.*"%>
<%@ page import="com.news.StrConvert"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<html>
<head>
<title>�鿴����Ա��Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"><style type="text/css">
<!--
body {
	margin-left: 0px;
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
<body>
<jsp:useBean id="con" class="com.news.DBconn" scope="request" />
<%
  if(session.getAttribute("admin_name")==null){
	  response.sendRedirect("managerCheck.jsp");
  }
if(session.getAttribute("mark").equals("�ܹ���Ա"))
   {
StrConvert str=new StrConvert();
String type=str.chStr(request.getParameter("type"));
%>
<table width="568" height="419"  border="0" cellpadding="2" cellspacing="1" bgcolor="#052754">
  <tr>
    <td align="center" valign="top" bgcolor="#FFFFFF">
	<p><br>
	  <br>
	  <br>
	  <span class="style1">�鿴����Ա��Ϣ</span></p>
  <table width="514" border="0" cellpadding="2" cellspacing="1" bgcolor="#052754">
    <tr align="center" bgcolor="#0099cc">
      <td width="66" height="24">�ʺ�</td>
      <td width="103">��ʵ����</td>
      <td width="111">ע��ʱ��</td>
      <td width="102">����Ա���</td>
     <td width="106">����</td>
	</tr>
    <%
	ResultSet rs = null;
        rs = con.executeQuery("select * from tb_manager where mark='��ͨ����Ա'order by IssueDate");
        while(rs.next()){
          int id = rs.getInt("ID");
          String name = rs.getString("Name");
      	  String realName = rs.getString("RealName");
		  //String issueDate = new SimpleDateFormat("yyyy-MM-dd").format(rs.getDate("IssueDate"));
		  String issueDate = (String.valueOf(rs.getString("IssueDate"))).substring(0,16);
		  String mark = rs.getString("mark"); 
   %>
 <tr bgcolor="#ffffff">
      <td height="24"><%=name%></td>
      <td><%=realName%></td>
      <td><%=issueDate%></td>
      <td><%=mark%></td>
      <td align="center"><a href="commonPassword.jsp?ID=<%=id%>">�޸�����</a></td>
    </tr>
<%}
 con.close();
%>
  </table>	</td>
  </tr>
</table>
<%
   }
   else
    out.println("��ͨ����Ա�����б�Ȩ�ޣ�");
%>
</body>
</html>
