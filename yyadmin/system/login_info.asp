<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>管理员信息</title>
<STYLE type=text/css>
BODY {	FONT-SIZE: 12px; scrollbar-face-color:#F0F0E5; scrollbar-shadow-color:#000000; scrollbar-highlight-color:#000000; scrollbar-3dlight-color:#F0F0E5; scrollbar-darkshadow-color:#F0F0E5; scrollbar-track-color:#F0F0E5; scrollbar-arrow-color:#000000}
</style>
<link href="../css.css" rel="stylesheet" type="text/css">
</head>

<body bgcolor="#E3E3E3" background="../images/nav_bj.jpg" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="left_title">
  <tr> 
    <td width="19" height="6"></td>
    <td></td>
  </tr>
  <tr> 
    <td height="16"> 
      <div align="center"><img src="../images/ico1.gif" width="10" height="10"></div></td>
    <td><font color="#FF0000" face="Arial, Helvetica, sans-serif"><%=session("adminname") %></font> 您好！</td>
  </tr>
  <tr> 
    <td height="18">
<div align="center"><img src="../images/ico1.gif" width="10" height="10"></div></td>
    <td>权限为： <font color="#FF0000">
      <%
	select case session("power")
	       case 1
		     response.write "未知的"
		   case 2
		     response.write "操作员"
		   case 3
		     response.write "管理员"
		   case 4
		     response.write "制作员"
	end select
	 %>
      </font></td>
  </tr>
  <tr> 
    <td height="17"> 
      <div align="center"><img src="../images/ico1.gif" width="10" height="10"></div></td>
    <td>上次登陆：</td>
  </tr>
  <tr>
    <td height="12">
<div align="center"></div></td>
    <td><font color="#FF0000"><%=session("Login_Time") %></font></td>
  </tr>
  <tr> 
    <td height="15"> 
      <div align="center"><img src="../images/ico1.gif" width="10" height="10"></div></td>
    <td>本次登陆IP：</td>
  </tr>
  <tr> 
    <td height="12">&nbsp;</td>
    <td><font color="#FF0000"><%=session("Login_IP") %></font></td>
  </tr>
</table>
</body>
</html>
