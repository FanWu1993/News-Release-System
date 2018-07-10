<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<jsp:useBean id="con" class="com.news.DBconn" scope="request" />
<%@ page contentType="text/html; charset=GBK" %>
<html>
<head>
<title>添加二级类别名称</title>
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

<script language="JavaScript">
function RgTest(){
if(document.form.styleName.value==""){
window.alert("请输入添加二级类别名称：");
document.form.styleName.focus();
return false;
}
if(document.form.styleName.value==""){
	window.alert("请输入添加一级类别名称：");
	document.form.styleName.focus();
	return false;
	}

return true;
}
</script>
<body>
<%
  if(session.getAttribute("admin_name")==null){
	  response.sendRedirect("managerCheck.jsp");
}
%>
<table width="568" height="419"  border="0" cellpadding="2" cellspacing="1" bgcolor="#052754">
  <tr>
    <td align="center"bgcolor="#FFFFFF">
	<p><strong style="color:#FF9900">添加详细类别名称</strong></p>
  <form name="form" method="post" action="/news/servlet/InsertStyle" onSubmit="return RgTest()">
    <table width="256" border="0" cellspacing="1" cellpadding="2" bgcolor="#052754">
      <tr>
        <td width="70" align="center" height="24" bgcolor="#0099cc">详细类别名称：</td>
        <td width="175" bgcolor="#ffffff"><input type="text" name="styleName"></td>
      </tr>
      <tr>
        <td width="70" align="center" height="24" bgcolor="#0099cc">新闻类别名称：</td>
        <td width="175" bgcolor="#ffffff"><select name="typeName" VALUE="">
        <option value ="">请选择新闻类型</option>
        <%
        ResultSet rs = null;
        rs = con.executeQuery("select * from tb_newsType");
        while(rs.next()){
        	String T=rs.getString("TypeName");
         %>
        <option value ="<%=T %>"><%=T %></option>
        <%
        }%>
        
        </select></td>
      </tr>
    </table>
    <br>
    <input type="submit" name="Submit2" value="提交">
	&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="reset" name="Submit" value="重置">
  </form>
	</td>
  </tr>
    </table>
 </body>
</html>
