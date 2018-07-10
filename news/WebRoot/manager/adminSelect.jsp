<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="java.sql.*"%>
<%@ page import="com.news.StrConvert"%>
<html>
<head>
<title>查看全部信息</title>
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
if(confirm("是否删除流水号为["+date+"]的一组数据吗？"))
window.location="/news/servlet/DeleteManager?managerID="+date;
}
</script>
<body>
<jsp:useBean id="con" class="com.news.DBconn" scope="request" />
<%
  if(session.getAttribute("admin_name")==null){
	  response.sendRedirect("managerCheck.jsp");
  }
  if(session.getAttribute("mark").equals("总管理员")){
      StrConvert str=new StrConvert();
      String type=str.chStr(request.getParameter("type"));
%>
<table width="568" height="419"  border="0" cellpadding="2" cellspacing="1" bgcolor="#052754">
  <tr>
    <td align="center" valign="top" bgcolor="#FFFFFF">
	<p class="style1 style2"><br>
	  <br>
	  <br>
	  普通管理员信息</p>
  <table width="547" border="0" cellpadding="2" cellspacing="1" bgcolor="#052754">
    <tr align="center" bgcolor="#0099cc">
      <td width="71" height=24">数据库ID</td>
      <td width="88">帐号</td>
      <td width="68">真实姓名</td>
      <td width="121">注册时间</td>
      <td width="82">管理员类别</td>
      <td width="97">操作</td>
    </tr>
  <%
	ResultSet rs = con.executeQuery("select * from tb_manager where mark='普通管理员'");
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
      <td align="center"><a href="adminUpdate.jsp?ID=<%=id%>">修改</a>&nbsp;
	  <a href="javascript:projectDelete('<%=id%>')">删除</a></td>
	</tr>
<%}%>
  </table>	</td>
  </tr>
</table>
<%
   }
   else
    out.println("普通管理员不具有本权限！");
%>
</body>
</html>
