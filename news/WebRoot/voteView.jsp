<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="con" class="com.news.DBconn" scope="request" />
<%!
int tot_num=0;
int tmp_num=0;
%>
<div class="grid_17">
<p class="page-header"><strong>�鿴�˶�ԱƱ��</strong></p>
<table class="table">
<%
ResultSet rs = null;
String[] color={"info","warning","success"};
int c=0;
ResultSet tmpRs=con.executeQuery("select sum(Number) As totalnum from tb_Vote");
tmpRs.next();
tot_num=tmpRs.getInt("totalnum");
tmpRs.close();
rs=con.executeQuery("select * from tb_Vote");
int i=1;
while(rs.next()){
	%>
	<tr class="<%=color[c] %>">
	<td colspan="3" style="text-align:left;">ѡ��<%=i %>:<%=rs.getString("Name") %></td>
	</tr>
	<tr>
	<td>ͶƱ�ʣ�</td>
	<td width="280px;">
	<%tmp_num=rs.getInt("Number"); %>
	<div class="progress progress-<%=color[c] %>" style="background-color:#E4E4E4;height:20px;">
	<div class="bar" style="background-color:blue;height:20px;width:<%=Math.floor(tmp_num*200/tot_num) %>"></div>
	</div>
	</td>
	<td><%=Math.floor(tmp_num*100/tot_num) %>%[��:<%=tmp_num %>Ʊ ����<%=tot_num %>Ʊ]</td>
	</tr>
	<%
	i++;
	c++;
	if(c==3)
		c=0;
		}
	%>

</table>
<%
con.close();
%>
</div>
</div>