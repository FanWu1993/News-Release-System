<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="java.sql.*"%>
<%@ page import="com.news.StrConvert"%>
<html>
<head>
<title>�鿴ȫ����Ϣ</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
}
td{
font-size:9pt;
}
.style1 {
	font-size: 11pt;
	font-weight: bold;
	color: #FF9900;
}
.style2 {font-size: 9pt}
-->
</style></head>
<script Language="JavaScript">
function projectDelete(date){
if(confirm("�Ƿ�ɾ����ˮ��Ϊ["+date+"]��һ��������"))
window.location="/news/servlet/DeleteManager?managerID="+date;
}
</script>
<body>
<jsp:useBean id="con" class="com.news.DBconn" scope="request" />
<%
  if(session.getAttribute("admin_name")==null){
	  response.sendRedirect("managerCheck.jsp");
  }
  if(session.getAttribute("mark").equals("�ܹ���Ա")){
      StrConvert str=new StrConvert();
      String type=str.chStr(request.getParameter("type"));
%>
<table width="568" height="419"  border="0" cellpadding="2" cellspacing="1" bgcolor="#052754">
  <tr>
    <td align="center" valign="top" bgcolor="#FFFFFF">
	<p class="style1 style2"><br>
	  <br>
	  <br>
	  ��ͨ����Ա��Ϣ</p>
  <table width="547" border="0" cellpadding="2" cellspacing="1" bgcolor="#052754">
    <tr align="center" bgcolor="#0099cc">
      <td width="71" height=24">���ݿ�ID</td>
      <td width="88">�ʺ�</td>
      <td width="68">��ʵ����</td>
      <td width="121">ע��ʱ��</td>
      <td width="82">����Ա���</td>
      <td width="97">����</td>
    </tr>
  <%
	ResultSet rs = con.executeQuery("select * from tb_manager where mark='��ͨ����Ա'");
    while(rs.next()){
        int id = rs.getInt("ID");
        String name = rs.getString("Name");
      	String realName = rs.getString("RealName");
		String issueDate = (String.valueOf(rs.getString("IssueDate"))).substring(0,16);
        String mark = rs.getString("mark");
   %>
    <tr bgcolor="#FFFFFF">
      <td height="24"><%=id%></td>
      <td><%=name%></td>
      <td><%=realName%></td>
      <td><%=issueDate%></td>
      <td><%=mark%></td>
      <td align="center"><a href="adminUpdate.jsp?ID=<%=id%>">�޸�</a>&nbsp;
	  <a href="javascript:projectDelete('<%=id%>')">ɾ��</a></td>
	</tr>
<%}%>
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
