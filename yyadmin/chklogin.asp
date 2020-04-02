<!--#include file="conn.asp" -->
<!--#include file="function.asp" -->
<%
'/*获取信息
system_name=checkin(request.form("system_name"))
system_password=checkin(request.form("system_password"))

'/*提取用户信息
sql="select id,power,system_name,system_password,login_Time,Login_IP from admin where system_name='"&system_name&"' and lock="&false
rs.open sql,conn,1,3
if rs.eof=false then
    '/*通过帐户验证
    if rs("system_password")=system_password then
	   '/*通过密码验证
	   '/*登陆成功初始信息
	   session.timeout=60
	   session("admin_id")=rs("id")'/*赋给登陆者名
	   session("adminname")=rs("system_name")'/*赋给登陆者名
	   session("Login_Time")=rs("Login_Time")'/*赋给上次登陆时间
	   session("power")=rs("power")'/*赋给权限
	   session("Login_IP")=Request.ServerVariables("REMOTE_ADDR")'/*赋给登陆IP
	   session("checkadmin")=true'/*通行证
	   '/**
	   '/*写入登陆信息
	   rs("Login_Time")=now() '/*登陆时间
	   rs("Login_IP")=Request.ServerVariables("REMOTE_ADDR")'/*登陆者的IP
	   rs.Update
	   '/**
	   rs.close
	   '/*写入日志
	   sql="select * from system_log"
	   rs.open sql,conn,1,3
	   rs.addnew
	   rs("log_state")="<font color=blue>登陆</font>"'/*状态
	   rs("log_title")=system_name&" 登陆系统"'/*标题
	   log_info=session("adminname")&" 登陆系统<br>"
	   log_info=log_info+"登陆时间:"&now()&"<br>"
	   log_info=log_info+"登陆IP"&Request.ServerVariables("REMOTE_ADDR")
	   rs("log_info")=log_info'/*信息
	   rs.update
	   '/*关闭指针及数据库
	   call close_rs(rs)
	   call close_rs(conn)
	   '/**
	   '/*跳转到管理页面
	   response.redirect"main.asp"
	   response.end
	   '/**
	else
	   '/*没有通过密码验证
	   '/*写入日志
	   rs.close
	   sql="select * from system_log"
       rs.open sql,conn,1,3
	   rs.addnew
	   rs("log_state")="<font color=red>登陆</font>"'/*状态
	   rs("log_title")=system_name&" 尝试登陆系统"'/*标题
	   log_info=system_name&" 尝试登陆系统<br>"
	   log_info=log_info+"登陆失败原因:登陆密码有误！<br>"
	   log_info=log_info+"尝试登陆用户名:"&system_name&"  密码:"&system_password&"<br>"
	   log_info=log_info+"尝试登陆时间:"&now()&"<br>"
	   log_info=log_info+"尝试登陆IP"&Request.ServerVariables("REMOTE_ADDR")
	   rs("log_info")=log_info'/*信息
	   rs.update
	   errorstr="管理登陆失败！原因\n\n您的登陆密码有误!\n请您重新登陆!"
       goto_url="index.asp"
	   call close_rs(rs)
	   call close_rs(conn)
       call error(errorstr,goto_url)
	   '/**
	end if
else
   '/*没有通过帐户检测
   '/*写入日志
       rs.close
	   sql="select * from system_log"
       rs.open sql,conn,1,3
	   rs.addnew
	   rs("log_state")="<font color=red>登陆</font>"'/*状态
	   rs("log_title")=system_name&" 尝试登陆系统"'/*标题
	   log_info=system_name&" 尝试登陆系统<br>"
	   log_info=log_info+"登陆失败原因:您的登陆帐户不存在或还没有开通！<br>"
	   log_info=log_info+"尝试登陆用户名:"&system_name&"  密码:"&system_password&"<br>"
	   log_info=log_info+"尝试登陆时间:"&now()&"<br>"
	   log_info=log_info+"尝试登陆IP"&Request.ServerVariables("REMOTE_ADDR")
	   rs("log_info")=log_info'/*信息
	   rs.update
   call close_rs(rs)
   call close_rs(conn)
   errorstr="管理登陆失败！原因\n\n您的登陆帐户不存在\n或者您的帐户还没有开通,请联系管理员!\n"
   goto_url="index.asp"
   call error(errorstr,goto_url)
end if
%>