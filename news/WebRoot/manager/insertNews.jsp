<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="java.sql.*"%>
<jsp:useBean id="str" class="com.news.StrConvert" scope="request" />
<jsp:useBean id="con" class="com.news.DBconn" scope="request" />
<jsp:useBean id="chi" class="com.news.Chinese" />
<%
String typeID=request.getParameter("typeID");
String typeName=null;
ResultSet rs=con.executeQuery("select a.*,b.* from tb_Style a,tb_newsType b where b.ID="+typeID+" and a.STName=b.TypeName");
if(rs.next())typeName=rs.getString("TypeName");
%>
<form name="EditorForm" method="post" action="/news/servlet/insertNews" >
<table width"453" border="0" cellpadding="2" cellspacing="1" bgcoloar="#0552754">
<tr>
<td width="81" height="24" align="center" bgcolor="#0099cc">���ű���</td>
<td width="345" bgcolor="#ffffff"><input type="text" name="newTitle" /></td>
</tr>

<tr>
<td height="185" align="center" bgcolor="#0099cc">��������</td>
<td align="left" valign="top" bgcolor="#ffffff"><textarea name="newContent" cols="50" rows="12"></textarea>
</td>
</tr>

<tr>
<td width="81" height="24" align="center" bgcolor="#0099cc">����</td>
<td width="345" bgcolor="#ffffff"><input type="hidden" name="newtype"  value="<%=typeName %>" /><%=typeName %></td>
</tr>

<tr>
<td width="81" height="24" align="center" bgcolor="#0099cc">��ϸ���</td>
<td width="345" bgcolor="#ffffff">
<select name="styleName" VALUE="">
        <option value ="">��ѡ����������</option>
        <%
        rs=con.executeQuery("select a.*,b.* from tb_Style a,tb_newsType b where b.ID="+typeID+" and a.STName=b.TypeName");
        while(rs.next()){
        	String T=rs.getString("StyleName");
         %>
        <option value ="<%=T %>"><%=T %></option>
        <%
        }%>
        
        </select>
</td>
</tr>
</table>
<br/>
<%

con.close();
 %>
 <input type="submit" name="Submit2" value="�ύ">
 <input type="reset" name="Submit" value="����">
 
</form>