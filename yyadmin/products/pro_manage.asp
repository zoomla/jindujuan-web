<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<!--#include file="conn.asp" -->
<!--#include file="../function.asp" -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>产品管理</title>
<STYLE type=text/css>
BODY {	FONT-SIZE: 12px; scrollbar-face-color:#F0F0E5; scrollbar-shadow-color:#000000; scrollbar-highlight-color:#000000; scrollbar-3dlight-color:#F0F0E5; scrollbar-darkshadow-color:#F0F0E5; scrollbar-track-color:#F0F0E5; scrollbar-arrow-color:#000000}
</style>
<link href="../css.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="js.js"></script>
</head>

<body bgcolor="#E3E3E3" background="../images/nav_bj.jpg" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="left_title">
  <tr>
    <td style="height:20px; padding-left:10px; padding-top:8px;"><img src="../images/ico1.gif" width="10" height="10"> <a href="pro_type/list.asp" target="main"><font color="#990000">产品类型管理</font></a></td>
  </tr>
  <tr>
    <td style="height:20px; padding-left:10px;"><img src="../images/ico1.gif" width="10" height="10"> <a href="####" onClick="javascript:showndv('cn',this)">产品管理</a></td>
  </tr>
  <tr id="cn" style="display:none"> 
    <td height="12" colspan="2"><table width="100%" height="18" border="0" cellpadding="0" cellspacing="0">
        <% 
  '/*提取一级类型信息
  sql="select id,typename,link_mode from pro_type where fb_id=0 and language="&false&" order by taxis"
  rs.open sql,conn,1,1
  while not rs.eof
  fbtype_id=rs("id")
  %>
  <tr>
    <td style="height:22px; padding-left:10px;">
	<img src="../images/title2.gif" width="7" height="7"> <%if rs("link_mode") then%>
	<a href="list.asp?type_id=<%=rs("id") %>" target="main"><font face="Arial, Helvetica, sans-serif"><%=rs("typename") %></font></a>
	<%else %>
	<a href="####" onClick="javascript:showndv('<%=fbtype_id %>',this)"><b><font face="Arial, Helvetica, sans-serif"><%=rs("typename") %></font></b></a>
	<%end if %>	</td>
  </tr>
  <tr id="<%=fbtype_id %>">
    <td> <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <% 
	   '/*提取二级类型信息
	   set rs1=server.createobject("adodb.recordset")
	   sql="select id,typename from pro_type where fb_id="&fbtype_id&" order by taxis"
	   rs1.open sql,conn,1,1
	   while not rs1.eof
	   %>
        <tr> 
                <td style="height:22px; padding-left:10px;"><font color="#990000">·</font><a href="list.asp?type_id=<%=rs1("id") %>" target="main"><font face="Arial, Helvetica, sans-serif"><%=rs1("typename") %></font> </a></td>
        </tr>
        <% 
		rs1.movenext
		wend
		call close_rs(rs1)
		%>
      </table></td>
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
