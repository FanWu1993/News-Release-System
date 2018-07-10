<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%java.util.Date date=new java.util.Date();%>
<html>
<title>头页面</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
td{
font-size:9pt;
}
.style11 {color: #990099}
.style15 {color: #FFFFCC}
.style17 {color: #FFFFFF}
.style18 {color: #FF9F2E}
.style19 {color: #FF00FF}
.STYLE20 {color: #FF0000}
-->
</style></head>
<body>
<jsp:useBean id="con" class="com.news.DBconn" scope="request" />
<table width="798" height="98"  border="0" cellpadding="0" cellspacing="0" align="center">
    <tr align="left">
      <td height="73" colspan="2" valign="top" background="images/banner.jpg"><br>
      <span class="style11">　 　 　 　 　 　 　 　　 　 　 　 　 　 　 　　 　 　 　 　 　 　 　　 　 　 　 　 　 　 　　 　·   <span><span class="style18"><a href="index.jsp"  target="_parent" class="style19" >返回首页</a></span></span></span><span class="style11">·</span><a href="manager/managerCheck.jsp" target="_parent" class="style19" onClick="alert('确定进入网页的后台吗！');   return true">进入后台</a>　　      </td>
  </tr>
    <tr>
      <td width="373" height="25" background="images/navigate.jpg"><table width="365" height="25"  border="0" cellpadding="0"    cellspacing="0">
        <tr>
          <td width="365" height="25" align="right" class="style17 STYLE20">今天是<%=date.getYear()+1900%>年<%=date.getMonth()+1%>月<%=date.getDate()%>日　</td>
        </tr>
      </table></td>
      <td width="425" height="25" background="images/navigate.jpg"><table border="0" cellpadding="0" cellspacing="0">
        <tr>
	<%
	  ResultSet rs = null;
      rs = con.Querysimple("select ID,TypeName from tb_newsType");
      while(rs.next()){
         int id = rs.getInt("ID");
         String typeName = rs.getString("TypeName");
      %>
		  <td align="center" width="68" height="25" background="images/diamonds.gif"><a href="type.jsp?type=<%=typeName%>" target="main"><font color="#6B3000"><%=typeName%></font></a>
		<%
		  }
		  con.close();
		%>
		</td>
	    </tr>
      </table>
	  </td>
    </tr>
</table>
</body>
</html>
