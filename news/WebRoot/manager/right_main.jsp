<%@ page contentType="text/html; charset=gb2312" %>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<html>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.style1 {font-size: 18px}
.style3 {color: #FFFFFF}
-->
</style><head>

<title>manager_right</title>

</head>
<body>
<table width="568" height="419"  border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#052754">
  <tr>
    <td bgcolor="#FFFFFF"><div align="center" class="style1">
<span id="theText" style="width:100%">
<h1 class="style3">欢迎光临新闻中心后台管理</h1>
</span>

<script>
<!--
var from = 1;
var to = 4;
var delay = 50; //闪的速度
var glowColor = "#3C83B9";//颜色
var i = to;
var j = 0;
textPulseDown();

function textPulseUp()
{
if (!document.all)
return
if (i < to)
{
theText.style.filter = "Glow(Color=" + glowColor + ", Strength=" + i + ")";
i++;
theTimeout = setTimeout('textPulseUp()',delay);
return 0;
}

if (i = to)
{
theTimeout = setTimeout('textPulseDown()',delay);
return 0;
}


}

function textPulseDown()
{
if (!document.all)
return
if (i > from)
{
theText.style.filter = "Glow(Color=" + glowColor + ", Strength=" + i + ")";
i--;
theTimeout = setTimeout('textPulseDown()',delay);
return 0;
}

if (i = from)
{
theTimeout = setTimeout('textPulseUp()',delay);
return 0;
}
}

//-->
</script>
	</div></td>
  </tr>
</table>
</body>
</html>
