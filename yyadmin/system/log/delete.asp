<!--#include file="conn.asp" -->
<!--#include file="../../function.asp" -->
<link href="../../css.css" rel="stylesheet" type="text/css">
<body background="../../images/master_bj.jpg">
<% 
'/====================================================================================================
'//=========================================[验证权限]=================================================
'/====================================================================================================
'/*检查通行证
call checkadmin("../../index.asp")
'/*检查权限
call checkpower("3","<font color=red size='2'>您的权限不足！<br><br>该项必须拥有管理员权限才可使用!<br>或者您的操作已超时，请重新登陆！</font>")
'//====================================================================================================
'/====================================================================================================
'/====================================================================================================

'/获取前页信息
if Request.Form("c1").Count =0 then
   '/*成功转回
	mess="日志信息删除失败！原因\n您没有选择要删除的日志信息！"
	goto_url="javascript:history.back()"
	call error(mess,goto_url)
	response.end
	'/**
end if
'/**
for i=1 to Request.Form("c1").Count 
	id=request("c1")(i)
	sql="select * from system_log where id="&id
	rs.open sql,conn,1,3
	'/*删除数据库相关信息
	rs.delete
	rs.update
	rs.close
	'/**
next
    call close_rs(rs)
	call close_rs(conn)
	'/*成功转回
	mess="日志信息删除成功！\n"
	goto_url="list.asp"
	call succeed(mess,goto_url)
	'/**
%>