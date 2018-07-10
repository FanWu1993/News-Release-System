<%@ page contentType="text/html; charset=GBK" %>
<html>
<head>
	<titel>logout</titel>
</head>
<body bgcolor="ffffff">
<%
	session.invalidate();
	 %>
	<script language="javaScript">
	if(window!=window.top){
	top.location.href=location.href;
	}
	window.close();
	</script>
</body>
</html>