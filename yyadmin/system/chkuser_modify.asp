<!--#include file="conn.asp" -->
<!--#include file="../function.asp" -->
<body background="../images/master_bj.jpg">
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

'/*获取信息
id=request("id")'需要修改ID
'/**
system_Name=request("system_Name")'/帐户名
system_Password=request("system_Password")'/帐户密码
lock1=request("lock")'/状态
'/*初始化获得的信息
if lock1="" then
   lock1=True
end if
'/**
'//=================================================================================
'//=================================[修改信息开始]===================================
'//=================================================================================
'/*检测是否有同名的帐户
sql="select id from admin where id<>"&id&" and system_name='"&system_name&"'"
rs.open sql,conn,1,1
if rs.eof then
   set rs1=server.createobject("adodb.recordset")
   sql="select * from admin where id="&id
   rs1.open sql,conn,1,3
   rs1("system_Name")=system_Name
   rs1("system_Password")=system_Password
   rs1("lock")=lock1
   rs1.update
   call close_rs(rs1)
         '/*写入日志
       rs.close
	   sql="select * from system_log"
       rs.open sql,conn,1,3
	   rs.addnew
	   rs("log_state")="<font color=blue>编辑</font>"'/*状态
	   rs("log_title")=session("adminname")&" 修改操作员帐户！"'/*标题
	   log_info=session("adminname")&"  修改操作员帐户<br>"
	   log_info=log_info+"被修改的操作员帐户:"&system_name&" <br>"
	   log_info=log_info+"修改的操作时间:"&now()&"<br>"
	   rs("log_info")=log_info'/*信息
	   rs.update
   call close_rs(rs)
   call close_rs(conn)
   '/**
   '/*修改成功转回
   mess="系统帐户信息修改成功！\n"
   goto_url="user_manage.asp"
   call succeed(mess,goto_url)
else
   '/*修改失败转回
   mess="系统帐户修改失败！原因 \n 您所修改的系统帐户已经存在，请更改系统帐户名称！"
   goto_url="javascript:history.back();"
   call error(mess,goto_url)
end if
%>
