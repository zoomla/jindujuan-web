<!--#include file="conn.asp" -->
<!--#include file="../function.asp" -->
<link href="../css.css" rel="stylesheet" type="text/css">
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
id=request("id")
'/**

'/*删除系统帐户信息
sql="select * from admin where id="&id
rs.open sql,conn,1,3
system_name=rs("system_name")'写日志时使用
power=rs("power")
if power<>3 then
   rs.delete
   rs.update
   '/*写入日志
       rs.close
	   sql="select * from system_log"
       rs.open sql,conn,1,3
	   rs.addnew
	   rs("log_state")="<font color=blue>删除</font>"'/*状态
	   rs("log_title")=session("adminname")&" 删除操作员帐户！"'/*标题
	   log_info=session("adminname")&" 删除操作员帐户<br>"
	   log_info=log_info+"被删除的操作员帐户:"&system_name&" <br>"
	   log_info=log_info+"删除操作时间:"&now()&"<br>"
	   rs("log_info")=log_info'/*信息
	   rs.update
   call close_rs(rs)
   call close_rs(conn)
   mess="系统帐户信息删除成功！\n"
   goto_url="user_manage.asp"
   call succeed(mess,goto_url)
else
   '/*写入日志
       rs.close
	   sql="select * from system_log"
       rs.open sql,conn,1,3
	   rs.addnew
	   rs("log_state")="<font color=red>删除</font>"'/*状态
	   rs("log_title")=session("adminname")&" 尝试删除管理员帐户！"'/*标题
	   log_info=session("adminname")&" 尝试删除管理员帐户<br>"
	   log_info=log_info+"被尝试删除的管理员帐户:"&system_name&" <br>"
	   log_info=log_info+"尝试删除操作时间:"&now()&"<br>"
	   log_info=log_info+"尝试删除失败原因:超级管理员无法删除！<br>"
	   rs("log_info")=log_info'/*信息
	   rs.update
   call close_rs(rs)
   call close_rs(conn)
   mess="系统帐户信息删除失败！原因 \n您要删除的系统帐户是超级管理员！\n"
   goto_url="user_manage.asp"
   call error(mess,goto_url)
end if
%><title>&#29992;&#25143;&#21024;&#38500;</title>