<!--#include file="Conn.asp" -->
<!--#include file="../function.asp" -->
<link href="../css.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="js.js"></script>
<title>用户激活</title><body background="../images/master_bj.jpg" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<% 
'/====================================================================================================
'//=========================================[验证权限]=================================================
'/====================================================================================================
'/*检查通行证
call checkadmin("../index.asp")
'/*检查权限
call checkpower("3","<font color=red size='2'>您的权限不足！<br><br>该项必须拥有管理员权限才可使用!<br>或者您的操作已超时，请重新登陆！</font>")
'//====================================================================================================
'/====================================================================================================
'/====================================================================================================

'/*获取前页信息
id=request("id")'/*要停止或激活的ID
'/**
'/*
sql="select * from admin where id="&id
rs.open sql,conn,1,3
lock1=rs("lock")
if lock1=false then
   '/*当为锁定帐户时
    rs("lock")=true'/*将状态锁定
	rs.update
	call close_rs(rs)
	call close_rs(conn)
else
   '/*当为激活帐户时
    rs("lock")=false'/*将状态激活
	rs.update
	call close_rs(rs)
	call close_rs(conn)
end if
'/*成功转回
response.redirect"user_manage.asp"
%>