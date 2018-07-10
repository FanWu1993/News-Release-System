<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.List"%>
<%java.util.Date date=new java.util.Date();%>
<html>
<title>遊匈中</title>
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
.style11 {color: #990099; font-weight: bold; }
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
      <td height="73" colspan="2" valign="top" background="../images/banner_manager.jpg"><br>
      <span class="style11">　 　 　 　 　 　 　 　　 　 　 　 　 　 　 　　 　 　 　 　 　 　 　　 　 　 　 　 　 　 　　 　，</span><span class="style18">　      </td>
  </tr>
    <tr>
      <td width="373" height="25" background="../images/navigate.jpg"><table width="365" height="25"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td width="365" height="25" align="right" class="style17"><span class="STYLE20">書爺頁<%=date.getYear()+1900%>定<%=date.getMonth()+1%>埖<%=date.getDate()%>晩</span>　</td>
        </tr>
      </table></td>
      <td width="425" height="25" background="../images/navigate.jpg">&nbsp;</td>
    </tr>
</table>
</body>
</html>
