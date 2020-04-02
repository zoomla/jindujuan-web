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


id=request("id")

sql="select id from news where type_id="&id
rs.open sql,conn,1,1
if rs.eof then 
   
   set rs1=server.createobject("adodb.recordset")
   sql="select * from news_type where id="&id
   rs1.open sql,conn,1,3
   if rs1.eof=false then
	   rs1.delete
	   rs1.update
   end if
   call close_rs(rs1)
   call close_rs(rs)
   call close_rs(conn)
   '/*3é1|×a??
   mess="类型信息删除成功！\n"
   goto_url="list.asp"
   call succeed(mess,goto_url)
'/**
else
   call close_rs(rs)
   call close_rs(conn)
   '/*3é1|×a??
   mess="类型信息删除失败！ 原因 \n此类型名下有产品信息！\n请先删除或转移此类型下的产品信息！\n"
   goto_url="list.asp"
   call succeed(mess,goto_url)
'/**
end if

%>