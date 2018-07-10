<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<jsp:useBean id="con" class="com.news.DBconn" scope="request" />
<%
String id=request.getParameter("ID");
String voteSQL="Update tb_Vote set Number=Number+1 where ID="+id;
con.executeUpdate(voteSQL);
session.setAttribute("s1",session.getId());
session.setMaxInactiveInterval(3600);
%>
<h4>Í¶Æ±³É¹¦£¡</h4>
