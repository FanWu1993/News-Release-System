<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html; charset=GBK"%>
<%@page import="com.sun.corba.se.spi.orbutil.fsm.Guard.Result"%>
<%@page import="java.sql.*"%>
<jsp:useBean id="con" class="com.news.DBconn" scope="request" />
<jsp:useBean id="str" class="com.news.StrConvert" scope="request" />
<html>
	<head>
		<title>添加新闻</title>

		<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
}

td {
	font-size: 9pt;
}

.style {
	color: #FF9900;
	font-weight: bold;
}
-->
</style>
	</head>


	<script language="JavaScript">
function mysubmit(){
if(document.form.newTitle.value==""){
window.alert("请输入新闻标题：");
document.form.newTitle.focus();
return false;
}
document.all.content.value=editor.content.value;
if(document.form.newContent.value==""){
	window.alert("请输入新闻内容");
	editor.fouus();
	return false;
	}
if(document.form.newsStyle.value==""){
	window.alert("请选择新闻类型");
	document.form.newsStyle.focus();
	return false;
	}

return true;
}
</script>
	<body>
		<%
			String type = str.chStr(request.getParameter("type"));
			System.out.println(type+"-------");
			session.setAttribute("insertNewsType", type);
		%>
		<select>
		<%
			ResultSet rs = null;
			rs = con.executeQuery("select * from tb_newsType");
			while (rs.next()) {
				String T = rs.getString("TypeName");
		%>

		<option value="<%=T%>"><%=T%></option>
		<%
			}
		%>
		</select>
		<table width="568" height="419" border="0" cellpadding="2"
			cellspacing="1" bgcolor="#052754">
			<tr>
				<td align="center" bgcolor="#FFFFFF">
					<p class="style1">
						<br>
						<br>
						<br>
						添加新闻
					</p>
					<form name="form" method="post" action="/news/insertNews"
						onSubmit="return mysubmit()">
						<table width="500" border="0" cellspacing="1" cellpadding="2"
							bgcolor="#052754">
							<tr>
								<td width="84" align="center" height="24" bgcolor="#0099cc">
									新闻标题
								</td>
								<td width="350" bgcolor="#ffffff">
									<input type="text" name="newTitle" size="30">
								</td>
							</tr>
							<tr>
								<td align="center" height="85" bgcolor="#0099cc">
									新闻内容
								</td>
								<td width="350" bgcolor="#ffffff">
									<input type="hidden" id== "content" name="newContent">
									<iframe src="editor/Editor.htm" name="editor" id="editor"
										width="403" height="200" scrolling="No" frameborder="0"></iframe>
								</td>
							</tr>
							<tr>
								<tr>
									<td width="84" align="center" height="24" bgcolor="#0099cc">
										类型
									</td>
									<td width="400" bgcolor="#ffffff">
										<input type="hidden" name="newsType"
											value="<%=type%><%=type%>">
									</td>
								</tr>
								<tr>
									<td align="center" height="24" bgcolor="#0099cc">
										详细类别
									</td>
									<td bgcolor="#ffffff">
										<select name="newsStyle" id="newsStyle">

											<option value="">
												请选择
											</option>
											<%
												ResultSet id = con
														.executeQuery("select * from tb_Style where STName='"
																+ type + "'");
												while (id.next()) {
													String StyleName = rs.getString("StyleName");
											%>
											<option value="<%=StyleName%>"><%=StyleName%></option>
											<%
												}
												con.close();
											%>
										</select>
										</label>
									</td>
								</tr>
						</table>
						<br>
						<input type="submit" name="Submit2" value="提交内容">
						&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="reset" name="Submit" value="重置">
					</form>
				</td>
			</tr>
		</table>
	</body>
</html>
