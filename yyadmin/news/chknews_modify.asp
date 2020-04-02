<!--#include file="conn.asp" -->
<!--#include file="../function.asp" -->
<!--#include file="../fileup.asp" -->
<!--#include file="../../inc/path.inc" -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="../css.css" rel="stylesheet" type="text/css">
<body background="../images/master_bj.jpg">
<%
'/====================================================================================================
'//=========================================[验证权限]=================================================
'/====================================================================================================
'/*检查通行证
call checkadmin("../index.asp")
'/*检查权限
call checkpower("2","<font color=red>您的权限不足！<br><br>该项必须拥有操作员权限才可使用!<br>或者您的操作已超时，请重新登陆！</font>")
'//====================================================================================================
'/====================================================================================================
'/====================================================================================================

'/*获取信息
id=request("id")'需要修改ID
type_id=request("type_id")'
pages=request("pages")'
language=request("language")'
'/*
news_time=request("news_time")'/发布时间
news_title=request("news_title")'/新闻标题
news_content=request("news_content")'/新闻文本信息
'/*

'/**
'//=================================================================================
'//=================================[修改信息开始]===================================
'//=================================================================================
sql="select web_url from define"
rs.open sql,conn,1,1
web_url=rs("web_url")
rs.close
'/*提取栏目文本
sql="select * from news where id="&id
rs.open sql,conn,1,3
   '/*修改数据库中信息
    rs("type_id")=type_id
	rs("news_title")=news_title
	rs("news_content")=news_content
    rs.update
	
call close_rs(rs)
call close_rs(conn)
'/*修改成功转回
mess="修改信息成功！\n"
goto_url="list.asp?type_id="&type_id&"&pages="&pages&"&language="&language
call succeed(mess,goto_url)
%>
