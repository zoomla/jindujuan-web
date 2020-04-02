<!--#include file="conn.asp" -->
<!--#include file="function.asp" -->
<%
'/*写入用户信息
if session("admin_id")<>"" then
	sql="select logout_Time from admin where id="&session("admin_id")
	rs.open sql,conn,1,3
	rs("logout_Time")=now()
	rs.update
		  '/*写入日志
		   rs.close
		   sql="select * from system_log"
		   rs.open sql,conn,1,3
		   rs.addnew
		   rs("log_state")="<font color=blue>退出</font>"'/*状态
		   rs("log_title")=session("adminname")&" 退出系统！"'/*标题
		   log_info=session("adminname")&"  退出系统<br>"
		   log_info=log_info+"退出系统时间:"&now()&"<br>"
		   rs("log_info")=log_info'/*信息
		   rs.update
end if
response.write "<br><div align='center'>正在退出网站管理系统....</div>"
session.abandon
%>
<meta http-equiv="refresh" content="2;url=index.asp">