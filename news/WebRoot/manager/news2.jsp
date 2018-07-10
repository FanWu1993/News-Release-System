<%@ page contentType="text/html; charset=gbk" %>
<%@ page import="java.sql.*"%>
<jsp:useBean id="str" class="com.news.StrConvert" scope="request" />
<jsp:useBean id="con" class="com.news.DBconn" scope="request" />
<%
	String newsID=request.getParameter("newsID");
	ResultSet rs=con.executeQuery("select * from tb_news where ID="+newsID);
	while(rs.next()){
 %>
<table width"453" border="0" cellpadding="2" cellspacing="1" bgcoloar="#0552754">
<tr>
<td width="81" height="24" align="center" bgcolor="#0099cc">新闻标题</td>
<td width="345" bgcolor="#ffffff"><%=rs.getString("Title") %></td>
</tr>

<tr>
<td height="185" align="center" bgcolor="#0099cc">新闻内容</td>
<td align="left" valign="top" bgcolor="#ffffff"><%=rs.getString("Content") %>
</td>
</tr>

<tr>
<td width="81" height="24" align="center" bgcolor="#0099cc">类型</td>
<td width="345" bgcolor="#ffffff"><%=rs.getString("Type") %></td>
</tr>

<tr>
<td width="81" height="24" align="center" bgcolor="#0099cc">详细类别</td>
<td width="345" bgcolor="#ffffff"><%=rs.getString("Style") %></td>
</tr>
</table>
<br/>
<%
}
con.close();
 %>
 
