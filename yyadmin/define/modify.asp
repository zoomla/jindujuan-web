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
id=request("id")
language=request("language")
web_title=request("web_title")
contact_email=request("contact_email")
web_url=request("web_url")
mess_info=request("mess_info")
member_mode=request("member_mode")
bbs_mode=request("bbs_mode")
web_foot=request("web_foot")
'/*初始化获得的信息
if member_mode="" then
   member_mode=0
end if
if bbs_mode="" then
   bbs_mode=0
end if
'/**
'//=================================================================================
'//=================================[修改信息开始]===================================
'//=================================================================================
sql="select * from define where id="&id
rs.open sql,conn,1,3
   rs("web_title")=web_title
   rs("contact_email")=contact_email
   rs("web_url")=web_url
   rs("mess_info")=mess_info
   rs("member_mode")=member_mode
   rs("bbs_mode")=bbs_mode
   rs("web_foot")=web_foot
   rs.update
call close_rs(rs)
call close_rs(conn)
'/**
'/*修改成功转回
mess="参数修改成功！\n"
goto_url="list.asp?language="&language
call succeed(mess,goto_url)
%>
