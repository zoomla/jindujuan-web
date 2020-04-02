<!--#include file="conn.asp" -->
<!--#include file="../function.asp" -->
<!--#include file="../../inc/path.inc" -->
<link href="../css.css" rel="stylesheet" type="text/css">
<body background="../images/master_bj.jpg">
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
'/**
'/获取前页信息
language=request("language")
type_id=request("type_id")
search_key=request("search_key")'/搜索关键字
pages=request("pages")'/页数
'/*
if Request.Form("c1").Count =0 then
   '/*成功转回
	mess="类型信息删除失败！原因\n您没有选择要删除的产品！"
	goto_url="javascript:history.back()"
	call error(mess,goto_url)
	response.end
	'/**
end if
'/**
for i=1 to Request.Form("c1").Count 
	id=request("c1")(i)
	'/*获取要删除的物理路径及图片信息
	sql="select * from product where id="&id
	rs.open sql,conn,1,3
	pro_simg=rs("pro_simg")'/缩略图
	pro_bimg=rs("pro_bimg")'/大图
	'/*获取物理路径
	FilePath = Server.MapPath("../../"&product_img)

	'/==================================================================================================
	'//================================[删除信息开始]===========================================
	'/==============================================================
	'/*删除数据库相关信息
	rs.delete
	rs.update
	rs.close
	'/**
	'/*删除空间中的图片文件
	set fso=server.createobject("scripting.filesystemobject")
	if fso.FileExists(FilePath&"/"&pro_simg) then
   		fso.DeleteFile(FilePath&"/"&pro_simg)
	end if
	if fso.FileExists(FilePath&"/"&pro_bimg) then
   		fso.DeleteFile(FilePath&"/"&pro_bimg)
	end if
	'/**
next
    call close_rs(rs)
	call close_rs(conn)
	'/*成功转回
	mess="信息删除成功！\n"
	goto_url="list.asp?language="&language&"&type_id="&type_id&"&search_key="&search_key&"&pages="&pages
	call succeed(mess,goto_url)
	'/**

%>