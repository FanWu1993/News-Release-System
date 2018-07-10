<%@ page contentType="text/html; charset=gbk" %>
<%@ page import="java.sql.*"%>
<jsp:useBean id="str" class="com.news.StrConvert" scope="request" />
<jsp:useBean id="con" class="com.news.DBconn" scope="request" />
<%
	String newsID=request.getParameter("ID");
	ResultSet rs=con.executeQuery("select * from tb_news where ID="+newsID);
	while(rs.next()){
 %>
<form name="EditorForm" method="post" action="/news/servlet/updatenews?ID=<%=rs.getInt("ID") %>" onSubmit="return RgTest()">
<table width"453" border="0" cellpadding="2" cellspacing="1" bgcoloar="#0552754">
<tr>
<td width="81" height="24" align="center" bgcolor="#0099cc">新闻标题</td>
<td width="345" bgcolor="#ffffff"><input type="text" name="newTitle" value="<%=rs.getString("Title") %>"/></td>
</tr>

<tr>
<td height="185" align="center" bgcolor="#0099cc">新闻内容</td>
<td align="left" valign="top" bgcolor="#ffffff"><textarea name="newContent" cols="50" rows="12"><%=rs.getString("Content") %></textarea>
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
 <input type="submit" name="Submit2" value="提交">
 <input type="reset" name="Submit" value="重置">
 
</form>