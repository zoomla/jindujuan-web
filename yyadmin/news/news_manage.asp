<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<!--#include file="conn.asp" -->
<!--#include file="../function.asp" -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>新闻类型管理</title>
<STYLE type=text/css>
BODY {	FONT-SIZE: 12px; scrollbar-face-color:#F0F0E5; scrollbar-shadow-color:#000000; scrollbar-highlight-color:#000000; scrollbar-3dlight-color:#F0F0E5; scrollbar-darkshadow-color:#F0F0E5; scrollbar-track-color:#F0F0E5; scrollbar-arrow-color:#000000}
</style>
<link href="../css.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="js.js"></script>
</head>

<body bgcolor="#E3E3E3" background="../images/nav_bj.jpg" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="left_title">
  <tr>
    <td style="height:20px; padding-left:10px; padding-top:8px;"><img src="../images/ico1.gif" width="10" height="10"> <a href="news_type/list.asp" target="main"><font color="#990000">新闻类型管理</font></a></td>
  </tr>
  <tr>
    <td style="height:20px; padding-left:10px;"><img src="../images/ico1.gif" width="10" height="10"> <a href="####"onclick="javascript:showndv('cn',this)"><font color="#990000">新闻内容</font></a></td>
  </tr>
  <tr id="cn" style="display:none"> 
 
    <td> <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <%
  sql="select * from news_type where language="&false
  rs.open sql,conn,1,1
  while not rs.eof
  %>
        <tr>
          <td style="height:22px; padding-left:12px;"><img src="../images/title2.gif" width="7" height="7"> <a href="list.asp?type_id=<%=rs("id") %>" target="main"><font face="Arial, Helvetica, sans-serif"><%=rs("typename") %></font></a></td>
        </tr>
        <% 
  rs.movenext
  wend
  rs.close
  %>
      </table></td>
  </tr>
</table>
</body>
</html>
