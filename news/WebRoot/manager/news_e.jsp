<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="java.sql.*"%>
<html>
<head>
<title>新闻发布系统 - 发布新闻</title>

<script>
  function mysubmit(){
    document.all.content.value=editor.content.value;
	EditorForm.submit()
  }
</script>
</head>
<body>
<form action="newsContent_e.jsp" name="EditorForm">
<table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#FFCCFF">
  <tr>
    <td><span class="STYLE1">请选择栏目：</span>      <select name="channel" id="channel" >
      <option value="体育新闻">体育新闻</option>
      <option value="娱乐新闻">娱乐新闻</option>
      <option value="社会新闻">社会新闻</option>

      </select>    </td>
  </tr>
  <tr>
    <td>请输入新闻标题：
      <input name="title" type="text" id="title"></td>
  </tr>
  <tr>
    <td>
      <input type=hidden id=content name=content>
      <iframe src="editor/Editor.htm" name="editor" id="editor" width="440" height="200" scrolling="No" frameborder="0"></iframe>
    </td>
  </tr>
  <tr>
    <td>
      <input type="button" name="Submit" value="提交内容" onClick="mysubmit()">
    </td>
  </tr>
</table>
<p>&nbsp;</p>
</form>

</body>
</html>
