<%@ page contentType="text/html; charset=GBK" %>
<html>
<head>
<title>
test
</title>
</head>
<body bgcolor="#ffffff">
<%
   // String voteID=request.getParameter("voteID");
    String voteName=request.getParameter("voteName");
    String address=request.getParameter("address");
    String country=request.getParameter("country");
    String job=request.getParameter("job");
    String remark=request.getParameter("remark");
%>
<%=voteName%>
<%=address%>
<%=country%>
<%=job%>
<%=remark%>
</body>
</html>
