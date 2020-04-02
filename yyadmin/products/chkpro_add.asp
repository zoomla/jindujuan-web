<!--#include file="conn.asp" -->
<!--#include file="../function.asp" -->
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
'/====================================================================================================
'/====================================================================================================
'/====================================================================================================



'/*获取前页信息
pro_name=Trim(Checkin(request("pro_name")))'/产品货号
pro_mode=Trim(Checkin(request("pro_mode")))'/产品货号
'
pro_info=request("pro_info")'/详细信息
pro_info_en=request("pro_info_en")'/详细信息
'
pro_simg=request("big_image")'/小图
pro_bimg=request("small_image")'/大图
pro_place=request("pro_place")'/产品位置
pro_comm=request("pro_comm")'/产品推荐
'
type_id=request("type_id")
language=request("language")
'/**
'/*辨别获取的信息
if pro_comm="" then
	pro_comm=false
end if


'//[添加信息开始]

sql="select * from product where language="&language
rs.open sql,conn,1,3
	'/*添加产品信息到数据库
	rs.addnew
	rs("pro_name")=pro_name'/产品名称
    rs("pro_mode")=pro_mode'/产品型号
	'
	rs("pro_info")=pro_info'/产品描述
	rs("pro_info_en")=pro_info_en'/英文产品描述
	'
	rs("pro_simg")=pro_simg'/产品小图名
	rs("pro_bimg")=pro_bimg'/产品大图名
	rs("pro_place")=pro_place'/产品文件
	rs("pro_comm")=pro_comm'/产品推荐
	'
	rs("type_id")=type_id'/类型ID
	rs("language")=language'/语言
   	rs.update
	'/*
	call close_rs(rs)
	call close_rs(conn)
	'/**
	'/*成功转回
	mess="产品信息添加成功！\n"
    goto_url="list.asp?language="&language&"&type_id="&type_id&"&search_key="&search_key
    call succeed(mess,goto_url)
'/**
%>

