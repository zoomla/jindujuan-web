﻿<!--#include file="conn.asp" -->
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
id=request("id")
columns_name=Trim(Checkin(request("columns_name")))
en_columns_name=request("en_columns_name")
columns_info=request("columns_info")
en_columns_info=request("en_columns_info")

'//[修改信息开始]

    set rs1=server.createobject("adodb.recordset")
    sql="select * from columns where id="&id
	rs1.open sql,conn,1,3
		rs1("columns_name")=columns_name
		rs1("en_columns_name")=en_columns_name
		rs1("columns_info")=columns_info
		rs1("en_columns_info")=en_columns_info
	rs1.update
	'*
	call close_rs(rs1)
	call close_rs(conn)
	'/**
	'/*成功转回
	mess="信息修改成功！\n"
    goto_url="list.asp"
    call succeed(mess,goto_url)
'/**
%>

