<%@ page contentType="text/html; charset=gbk" %>
<%@ page import="java.sql.*"%>
<jsp:useBean id="str" class="com.news.StrConvert" scope="request" />
<html>
<head>
<title>�޸��������</title>
</head>
<style type="text/css">
<!--
body{
margin-left:0px;
margin-top:0px;
}
td{font-size:9pt;}
-->
</style>
<script language="JavaScript">
function RgTest(){
if(document.form.typeName.value==""){
window.alert("���������ű��⣺");
document.form.typeName.focus();
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
    String id=str.chStr(request.getParameter("ID"));
	//String typeName=str.chStr(request.getParameter("type"));
	String typeName=request.getParameter("type");
	
	String iidd=str.chStr(request.getParameter("iidd"));
	//String test=str.chStr(request.getParameter("test"));
		String test=request.getParameter("test");
	
	//out.println("����"+id+"###");
	//out.println("����"+typeName+"###");
	//out.println("iidd"+iidd+"###");
	//out.println("����"+test);
%>

<table width="568" height="419"  border="0" cellpadding="2" cellspacing="1" bgcolor="#052754">
  <tr>
    <td bgcolor="#FFFFFF" valign="top" align="center">
	 <p><strong style="color:#FF9900"><br>
	   <br>
	   <br>
      �޸��������</strong></p>
   <form name="form" method="post" action="/news/servlet/UpdateType?ID=<%=id%>" onSubmit="return RgTest()">
    <table width="379" border="0" cellspacing="1" cellpadding="2">
      <tr>
        <td width="84" style="color:#099cc">���ƣ�</td>
        <td width="264"><input type="text" name="typeName" value="<%=typeName%>"></td>
      </tr>
    </table><br>
    <input type="submit" name="Submit2" value="�ύ">
	&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="reset" name="Submit" value="����">
  </form>	</td>
  </tr>
    </table>
 </body>
</html>
