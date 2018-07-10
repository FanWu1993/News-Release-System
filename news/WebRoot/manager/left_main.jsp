<%@ page contentType="text/html; charset=gb2312" %>
<html>
<head>
<title>manager_left</title>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312"><style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.style1 {color: #FFFFFF}
td{
font-size:9pt;
}
-->
</style></head>

<body>
<%
  if(session.getAttribute("admin_name")==null){
	  response.sendRedirect("managerCheck.jsp");
}
%>
<div align="right">
  <table width="227" height="405"  border="0" cellpadding="1" cellspacing="1" bgcolor="#006699">
    <tr>
      <td height="396" bgcolor="#FFFFFF"><table width="227"  border="0" align="right" cellpadding="0" cellspacing="0">
          <tr>
            <td width="227" height="10" background="../images/htline1.jpg">&nbsp;</td>
          </tr>
          <tr>
            <td width="227" height="22" background="../images/htline2.jpg">　　　　　<a href="adminPassword.jsp" target="mainFrame" class="style1">总管理员设置</a></td>
          </tr>
          <tr>
            <td width="227" height="6" background="../images/htline3.jpg">&nbsp;</td>
          </tr>
          <tr>
            <td width="227" height="22" background="../images/htline2.jpg">　　　　　<a href="adminChangerPassword.jsp" target="mainFrame" class="style1">更改总管理员密码</a></td>
          </tr>
          <tr>
            <td width="227" height="6" background="../images/htline3.jpg">&nbsp;</td>
          </tr>
          <tr>
            <td width="227" height="22" background="../images/htline2.jpg">　　　　　<a href="commonManger.jsp" target="mainFrame" class="style1">普通管理员设置</a></td>
          </tr>
          <tr>
            <td width="227" height="6" background="../images/htline3.jpg">&nbsp;</td>
          </tr>
          <tr>
            <td width="227" height="22" background="../images/htline2.jpg">　　　　　<a href="managerInsert.jsp" target="mainFrame" class="style1">添加新的管理员</a></td>
          </tr>
          <tr>
            <td width="227" height="6" background="../images/htline3.jpg">&nbsp;</td>
          </tr>
          <tr>
            <td width="227" height="22" background="../images/htline2.jpg">　　　　　<a href="newsType.jsp" target="mainFrame" class="style1">新闻类型管理</a></td>
          </tr>
          <tr>
            <td width="227" height="6" background="../images/htline3.jpg">&nbsp;</td>
          </tr>
          <tr>
            <td width="227" height="22" background="../images/htline2.jpg">　　　　　<a href="newsDetailStyle.jsp" target="mainFrame" class="style1">新闻详细类型管理</a></td>
          </tr>
          <tr>
            <td width="227" height="6" background="../images/htline3.jpg">&nbsp;</td>
          </tr>
          <tr>
            <td width="227" height="22" background="../images/htline2.jpg">　　　　　<a href="news.jsp" target="mainFrame" class="style1">新闻信息管理</a></td>
          </tr>
          <tr>
            <td width="227" height="6" background="../images/htline3.jpg">&nbsp;</td>
          </tr>
          <tr>
            <td width="227" height="22" background="../images/htline2.jpg">　　　　　<a href="link.jsp" target="mainFrame" class="style1">链接管理</a></td>
          </tr>
          <tr>
            <td width="227" height="6" background="../images/htline3.jpg">&nbsp;</td>
          </tr>
          <tr>
            <td width="227" height="22" background="../images/htline2.jpg">　　　　　<a href="vote.jsp" target="mainFrame" class="style1">查看新闻人物</a></td>
          </tr>
          <tr>
            <td width="227" height="6" background="../images/htline3.jpg">&nbsp;</td>
          </tr>
          <tr>
            <td width="227" height="22" background="../images/htline2.jpg">　　　　<span class="style1">　<a href="/news/news/index.jsp" target="_parent"class="style1">退出后台</a></span></td>
          </tr>
          <tr>
            <td width="227" height="55" background="../images/htline3.jpg">&nbsp;</td>
          </tr>
      </table></td>
    </tr>
  </table>
</div>
</body>
</html>
