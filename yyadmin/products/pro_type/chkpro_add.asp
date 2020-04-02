<!--#include file="conn.asp" -->
<!--#include file="../../function.asp" -->
<!--#include file="../../../inc/path.inc" -->
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

'/获取前页信息 Trim去除前后空格
typename1=Checkin(request("typename"))
typename1_en=Checkin(request("typename_en"))
fb_id=request("fb_id")
filename=request("filename")
cp_hs=Checkin(request("cp_hs"))
cp_ls=Checkin(request("cp_ls"))
taxis=request("taxis")
language=request("language")
link_mode=request("link_mode")
cp_encrypt=request("cp_encrypt")
img_name=request("big_image")
if link_mode="" then
   link_mode=false
end if
if cp_encrypt="" then
   cp_encrypt=false
end if
'/**
'/==================================================================================================
'//============================================[添加信息开始]===========================================
'/==================================================================================================
'/*检查是否有同名文件夹
sql="select * from pro_type where fb_id="&fb_id&" and typename='"&typename1&"'"
rs.open sql,conn,1,3
if rs.eof then
   '/*写入数据库
	rs.addnew
	rs("typename")=typename1
	rs("typename_en")=typename1_en
	rs("img_name")=filename
	rs("cp_hs")=cp_hs
	rs("cp_ls")=cp_ls
	rs("fb_id")=fb_id
	rs("taxis")=taxis
	rs("language")=language
	rs("link_mode")=link_mode
	rs("cp_encrypt")=cp_encrypt
	rs("img_name")=img_name
	rs.update
	call close_rs(rs)
	call close_rs(conn)
	'/**
	'/*成功转回
	mess="类型信息添加成功！\n"
    goto_url="list.asp"
    call error(mess,goto_url)
else
	'/*当有同名文件夹时
	'/*失败转回
	call close_rs(rs)
	call close_rs(conn)
	mess="类型信息添加失败！ 原因 \n此类型名已经存在！请更换类型名称！\n"
    goto_url="javascript:history.back();"
    call error(mess,goto_url)
end if
'/**
%>

