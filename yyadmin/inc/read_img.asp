<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<!--#include file="../function.asp" -->
<html>
<head>
<% 
'/====================================================================================================
'//=========================================[验证权限]=================================================
'/====================================================================================================
'/*检查通行证
call checkadmin("../index.asp")
'/*检查权限
call checkpower("2","<font color=red size='2'>您的权限不足！<br><br>该项必须拥有操作员权限才可使用!<br>或者您的操作已超时，请重新登陆！</font>")
'//====================================================================================================
'/====================================================================================================
'/====================================================================================================

'/*获取前页信息
filename=request("filename")
path_name=request("path_name")
'/**
%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>查看图片</title>
<link href="../css.css" rel="stylesheet" type="text/css">
</head>
<body background="../images/pop_bj2.jpg" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" style="overflow-y:hidden">
<div align="center"><br>
  <img src="<%=path_name&"/"&filename %>"> 
  </div>
</body>
</html>
