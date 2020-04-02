<!--#include file="conn.asp" -->
<!--#include file="../fileup.asp" -->
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


'/*获取前页信息
pro_name=Trim(Checkin(request("pro_name")))'/产品货号
pro_mode=Trim(Checkin(request("pro_mode")))'/产品货号
'
pro_info=request("pro_info")'/详细信息
pro_info_en=request("pro_info_en")'/英文详细信息
'
pro_simg=request("big_image")'/小图
pro_bimg=request("small_image")'/大图
pro_place=request("pro_place")'/产品位置
pro_comm=request("pro_comm")'/产品推荐
'
type_id=request("type_id")
id=request("id")'/要修改的产品ID
search_key=request("search_key")'/搜索关键字
pages=request("pages")'/页数
language=request("language")'/页数
'/**

'/*辨别获取的信息
if pro_comm="" then
	pro_comm=false
end if

'//[修改信息开始]

    set rs1=server.createobject("adodb.recordset")
    sql="select * from product where id="&id
	rs1.open sql,conn,1,3
		rs1("pro_name")=pro_name'/产品名称
		rs1("pro_mode")=pro_mode'/产品型号
		'
		rs1("pro_info")=pro_info'/产品描述
		rs1("pro_info_en")=pro_info_en'/产品描述
		'
		rs1("pro_simg")=pro_simg'/产品小图名
		rs1("pro_bimg")=pro_bimg'/产品大图名
		rs1("pro_place")=pro_place'/产品文件
		rs1("pro_comm")=pro_comm'/产品推荐
		'
		rs1("type_id")=type_id'/类型ID
		rs1("language")=language'/语言
	rs1.update
	'*
	call close_rs(rs1)
	call close_rs(conn)
	'/**
	'/*成功转回
	mess="产品信息修改成功！\n"
    goto_url="list.asp?language="&language&"&type_id="&type_id&"&search_key="&search_key&"&pages="&pages
    call succeed(mess,goto_url)
'/**
%>

