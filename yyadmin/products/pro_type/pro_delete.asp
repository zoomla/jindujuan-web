﻿<!--#include file="conn.asp" -->
<!--#include file="../../function.asp" -->
<!--#include file="../../../inc/path.inc" -->
<link href="../../css.css" rel="stylesheet" type="text/css">
<title>产品删除</title><body background="../../images/master_bj.jpg">
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
id=request("id")
'/**

'/==================================================================================================
'//============================================[删除信息开始]===========================================
'/==================================================================================================
'/*检查该类型下是否有产品信息
sql="select * from product where type_id="&id
rs.open sql,conn,1,1
if rs.eof then
   '/*当没有产品信息时
   
   '/*删除数据库相关信息
    set rs1=server.createobject("adodb.recordset")
    sql="select * from pro_type where id="&id
    rs1.open sql,conn,1,3
	'img_name=rs1("img_name")'/*获得图片名称，以备删除时使用
	rs1.delete
	rs1.update
	
	
	call close_rs(rs1)
	call close_rs(rs)
	call close_rs(conn)
	'/**
	'/*成功转回
	mess="类型信息删除成功！\n"
    goto_url="list.asp"
    call error(mess,goto_url)
else
	'/*当有产品信息
	'/*失败转回
	call close_rs(rs)
	call close_rs(conn)
	mess="类型信息删除失败！ 原因 \n此类型名下有产品信息！\n请先删除或转移此类型下的产品信息！\n"
    goto_url="list.asp"
    call error(mess,goto_url)
end if
'/**

%>