<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="java.sql.*"%>
<html>
<head>
<title>左页面</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"><style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
}
td{
font-size:9pt;
}
.style2 {color: #052754}
-->
</style></head>
<script language="JavaScript">
function RgTest(){
if(document.form.key.value==""){
window.alert("请输入新闻关键字：");
document.form.key.focus();
return false;
}

if(document.form.type.value==""){
window.alert("请选择新闻类型：");
document.form.type.focus();
return false;
}

return true;
}
</script>
<body>
<jsp:useBean id="con" class="com.news.DBconn" scope="request" />
<table width="226" height="580"  border="0" align="right" cellpadding="0" cellspacing="0">
  <tr>
    <td width="226" height="122" valign="top" background="images/login.jpg">
	<form name="form" method="post" action="keySeach.jsp" target="main" onSubmit="return RgTest()">
 <table width="225" height="96"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="22" ></td>
        </tr>
      <tr>
        <td height="28" colspan="2" align="center"><span class="style2">新闻关键字：</span>    <input name="key" type="text" id="key" size="16"style="border-style:solid;border-width:1;"onFocus="this.select();"onMouseOver="this.style.background='#ccffff';"onMouseOut="this.style.background='#ffffff'"" ></td>
        </tr>
      <tr>
        <td width="138" align="center"><select name="type">
          <option value="">请选择新闻类型</option>
          <%
		     ResultSet rs = con.executeQuery("select * from tb_newsType");
             while(rs.next()){
		  %>
          <option value="<%=rs.getString("TypeName")%>"><%=rs.getString("TypeName")%></option>
          <%
		  }
		  con.close();
		  %>
        </select></td>
        <td width="87" align="center"><input name="Submit" type="submit" id="Submit"style="border:1px solid:border-color:#A4B077;padding:2px;background-color:#0099cc " value="确认查询"></td>
      </tr>
      <tr>
        <td colspan="2">&nbsp;</td>
        </tr>
    </table> 
	</form>
	</td>
  </tr>
  <tr>
    <td height="16" align="center" valign="middle" bgcolor="#0099CC">&nbsp;</td>
  </tr>
  <tr>
    <td height="84" align="center" valign="middle" bgcolor="#eeeeee"><table width="142" border="0" cellpadding="2" cellspacing="1" bgcolor="#052754">
      <tr>
        <td width="136" bgcolor="#FFFFFF"><div align="center"><a href="voteSelect.jsp" target="main">中国奥运金牌运动员</a></div></td>
      </tr>
      <tr>
        <td width="136" bgcolor="#FFFFFF"><div align="center"><a href="voteView.jsp" target="main">金牌员动员票选结果</a></div></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="16" align="center" valign="top" bgcolor="#0099CC">&nbsp;</td>
  </tr>
  <tr>
    <td height="344" align="center" valign="top" bgcolor="#eeeeee"><br>
      <br>
      <table width="142" border="0" cellpadding="2" cellspacing="1" bgcolor="#052754">
      <tr>
        <td colspan="2" bgcolor="#0099CC"><div align="center">友情链接</div></td>
      </tr>
      <%
		     ResultSet rs2 = con.executeQuery("select * from tb_Link");
             while(rs2.next()){
			 String UName=rs2.getString("Name");
			 String UAddress=rs2.getString("Address");
		  %>  
      <tr>
      <td width="141" bgcolor="#ffffff"><div align="center"><a href="http://<%=UAddress%>" target="_blank"><%=UName%></a></div></td>
      </tr>
<%
		  }
		  con.close();
		  %>
    </table></td>
  </tr>
</table>
<div align="right" height="15"></div>
</body>
