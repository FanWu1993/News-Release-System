<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'jsp2.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <%
    String id=request.getParameter("ID");
	//String typeName=str.chStr(request.getParameter("type"));
	//String typeName=new String((request.getParameter("type").getBytes("ISO-8859-1")));
	//String typeName=new String((request.getParameter("type").getBytes("ISO-8859-1")));
	String typeName=request.getParameter("type");
	out.println("ºÅÂë"+id);
	out.println("Ãû³Æ"+typeName);
%>
  </body>
</html>
