<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<!--#include file="conn.asp" -->
<!--#include file="../function.asp" -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>nav</title>
<STYLE type=text/css>
BODY {	FONT-SIZE: 12px; scrollbar-face-color:#F0F0E5; scrollbar-shadow-color:#000000; scrollbar-highlight-color:#000000; scrollbar-3dlight-color:#F0F0E5; scrollbar-darkshadow-color:#F0F0E5; scrollbar-track-color:#F0F0E5; scrollbar-arrow-color:#000000}
</style>
<link href="../css.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="js.js"></script>
</head>

<body bgcolor="#E3E3E3" background="../images/nav_bj.jpg" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="left_title">
  <tr> 
    <td width="19" height="6"></td>
    <td></td>
  </tr>  
  <tr> 
    <td height="12" colspan="2"><table width="100%" height="18" border="0" cellpadding="0" cellspacing="0">
        <% 
  '/*提取一级类型信息
  sql="select * from columns order by id"
  rs.open sql,conn,1,1
  while not rs.eof
  %>
  <tr>
    <td style="height:22px; padding-left:12px;">
	<img src="../images/ico1.gif" width="10" height="10"> <a href="modify_info.asp?id=<%=rs("id") %>" target="main"><font face="Arial, Helvetica, sans-serif"><%=rs("columns_name") %></font></a>
</td>
  </tr>
  
    <% 
  rs.movenext
  wend
  rs.close
  %>
      </table></td>
  </tr>
  
  <tr id="en" style="display:none">
    <td height="20" colspan="2">&nbsp;</td>
  </tr>
</table>
</body>
</html>
