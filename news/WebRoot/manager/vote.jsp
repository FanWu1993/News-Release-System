<%@ page contentType="text/html; charset=GB2312"%>
<%@ page import = "com.news.RowSetPage"%>
<%@ page import = "com.news.PagedStatement"%>
<%@ page import="java.sql.*" %>
<%
String sql="SELECT * FROM tb_Vote";
PagedStatement pst=new PagedStatement(sql,1,5);
RowSetPage news_list=null;
ResultSet news_rst=null;
int rowCount=0;
int pageCount=0;
int pageSize=0;
int avacount=1;
int currentPage=0;
try{
  news_list=pst.executeQuery();
  currentPage=news_list.getCurrentPageNo();
  news_rst=news_list.getRowSet();
  rowCount=news_list.getTotalSize();
  pageCount=news_list.getTotalPageCount();
  pageSize=news_list.getPageSize();
}catch(Exception e)
{
  e.printStackTrace();
}
%>
<html>
<head><title>�����˶�Աȫ����Ϣ</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
}
td{
font-size:9pt;
}
.style1 {
	color: #FF9900;
	font-weight: bold;
}
-->
</style>
<script src="page.js" type=""></script>
</head>
<body>
<form name="form" action="" method="POST">
  <table width="530" border="0" cellpadding="2" cellspacing="1" bgcolor="#052754">
    <tr align="center" bgcolor="#0099cc">
      <td width="30">ID</td>
      <td width="50">�˶�Ա</td>
      <td width="50">������</td>
      <td width="30">����</td>
      <td width="70">��Ŀ</td>
      <td width="250">���</td>
      <td width="30">Ʊ��</td>
      <td width="80">����</td>
    </tr>
    <%
     int i=1;
     do{
	 int id = news_rst.getInt("ID");
         String name = news_rst.getString("Name");
		 String address = news_rst.getString("Address");
		 String country = news_rst.getString("Country");
		 String job = news_rst.getString("Job");
		 String remark = news_rst.getString("Remark");
		 int number = news_rst.getInt("Number");
    %>
    <tr bgcolor="#ffffff" id="user_list_<%=i%>" <%if(i>5){%>style="DISPLAY: none"<%}%> >
	<td><%=id%></td>
       <td><%=name%></td>
      <td><%=address%></td>
       <td><%=country%></td>
      <td><%=job%></td>
      <td><%=remark%></td>
      <td><%=number%></td>
      <td align="center"><a href="updateNews.jsp?newsID=<%=id%>">�޸�</a>&nbsp;&nbsp;<a href="javascript:projectDelete('<%=id%>')">ɾ��</a>&nbsp;&nbsp;</td>
</tr>
    <%
      i++;}while(news_rst.next());
    %>
</table>
<table border="0">
 <tr>
   <td>ÿҳ��ʾ
       <select name="selectPageSize"  width=7 onChange= "changePageSize('user_list_',this,document.forms[0].selectCurrentPage)">
     	     <option value="5">5
     	     <option value="10">10
       	     <option value="15">15
             <option value="20">20
        </select>����¼
    </td>
     <td><div id="user_list_pageSize" style="DISPLAY: none" align="center">5</div></td>
    <td>����</td>
    <td><div id="user_list_rowCount"><%=rowCount%></div></td>
    <td>����¼</td>
    <td>����</td>
   <td><div id="user_list_pageCount"><%= pageCount%></div></td>
    <td>ҳ</td>
    <td>��</td>
    <td><div id="user_list_currentPage"><%=currentPage%></div></td>
    <td>ҳ</td>
    <td><a href="javascript:first('user_list_')">��ҳ</a></td>
    <td><a href="javascript:previse('user_list_')">ǰһҳ</a></td>
    <td><a href="javascript:next('user_list_')">��һҳ</a></td>
    <td><a href="javascript:last('user_list_')">βҳ</a></td>
    <td>��ת��
      <select name="selectCurrentPage" onChange="goPage('user_list_',this)">
        <%for(i = 1; i <= pageCount; i++) {   %>
        <option value="<%=i%>"><%=i%>
        <%}%>
      </select>ҳ
    </td>
  </tr>
</table>
</form>
</body>
</html>
