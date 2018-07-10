<%@ page contentType="text/html; charset=gbk" %>
<%@ page import="java.sql.*"%>
<jsp:useBean id="str" class="com.news.StrConvert" scope="request" />
<jsp:useBean id="con" class="com.news.DBconn" scope="request" />
<%
	String newsID=request.getParameter("ID");
	ResultSet rs=con.executeQuery("select * from tb_Link where ID="+newsID);
	while(rs.next()){
	int id=rs.getInt("ID");
	String name=rs.getString("Name");
	String address=rs.getString("Address");
	String IssDate=(String.valueOf(rs.getString("IssueDate"))).substring(0,16);
 %>
<form name="EditorForm" method="post" action="/news/servlet/updatelink?ID=<%=id %>" onSubmit="return RgTest()">
<table width"453" border="0" cellpadding="1" cellspacing="2" bgcoloar="#0552754">
<tr>
<td width="81" height="24" align="center" bgcolor="#0099cc">ID</td>
<td width="345" bgcolor="#ffffff"><%=id %></td>
</tr>

<tr>
<td height="185" align="center" bgcolor="#0099cc">链接网站名称</td>
<td align="left" valign="top" bgcolor="#ffffff">
<input name="newname" type="text" value="<%=name %>" />"
</td>
</tr>

<tr>
<td width="81" height="24" align="center" bgcolor="#0099cc">链接的地址</td>
<td width="345" bgcolor="#ffffff"><input name="newaddress" type="text" value="<%=address %>" /></td>
</tr>

<tr>
<td width="81" height="24" align="center" bgcolor="#0099cc">发布时间/td>
<td width="345" bgcolor="#ffffff"><%=IssDate %></td>
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