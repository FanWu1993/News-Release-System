<%@ page contentType="text/html; charset=GBK" %>
<%@page import="com.sun.corba.se.spi.orbutil.fsm.Guard.Result"%>
<%@page import="java.sql.*"%>
<jsp:useBean id="con" class="com.news.DBconn" scope="request" />
<html>
<head>
<title>修改新闻</title>
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

<body>
<%
	String newsID=request.getParameter("newsID");
	String s="select * from tb_news where ID="+newsID;
	ResultSet rs=con.executeQuery(s);
	if(rs==null)
	{
	out.print("1");
	}
	while(rs.next()){
	 %>
	 <form name="EditorForm" method="post" action="/news/upatanews?ID=<%=rs.getInt("ID") %>" onSubmit="return RgTest()">
	 <table width="453" border="0" cellpadding="2" cellspacing="1" bgcolor="#052754">
	 <tr>
	 	<td width="81" height="24" align="center" bgcolor="#0099cc">新闻标题</td>
	 	<td width="345" bgcolor="#ffffff"><input type="text" name="newTitle" value="<%=rs.getString("Title") %>"></td>
	 </tr>
	 <tr>
	 	<td height="185" align="center" bgcolor="#0099cc">新闻内容</td>
	 	<td align="left" valign="top" bgcolor="#ffffff"><textarea name="newContent" cols="50" rows="12"><%=rs.getString("Content")%></textarea>
	 	</td>
	 </tr>
	 <tr>
	 	<td width="81" height="24" align="center" bgcolor="#0099cc">类型</td>
	 	<td width="345" bgcolor="#ffffff"><input name="newsType" " value="<%=rs.getString("Type") %>"></td>
	 </tr>
	 <tr>
	 	<td align="center" height="24" bgcolor="#0099cc">详细类型</td>
	 	<td bgcolor="#fffffff"><input name="newsStyle" " value="<%=rs.getString("Style") %>"></td>
	 </tr>
	 </table>
	 <br>
<%}
	con.close();
	 %>
    <input type="submit" name="Submit2" value="提交">
	&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="reset" name="Submit" value="重置">
</form>
</body>
</html>
