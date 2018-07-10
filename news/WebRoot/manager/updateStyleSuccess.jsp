<%@ page contentType="text/html; charset=gb2312" %>
<html>
<head>
<title>修改新闻的详细类别成功
</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"></head>
<body leftmargin="0" topmargin="0">
<%
  if(session.getAttribute("admin_name")==null){
	  response.sendRedirect("managerCheck.jsp");
}
%>
<table width="568" height="419"  border="0" cellpadding="2" cellspacing="1" bgcolor="#052754">
  <tr>
    <td align="center" bgcolor="#FFFFFF" style="font-size:9pt">
	 <p>修改新闻的详细类别成功</p>
  <p><a href="newsDetailStyle.jsp"><font style="font-size:9pt">请查看</font></a></p>
</div>	</td>
  </tr>
</table>
</body>
</html>
