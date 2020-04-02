<!--#include file="conn.asp" -->
<!--#include file="../../function.asp" -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
id=request("id")
typename1=Checkin(request("typename"))
'/**

'/*检查是否有同名栏目
sql="select id from news_type where id<>"&id&" and typename='"&typename1&"'"
rs.open sql,conn,1,1
'/*当没有同名栏目时
if rs.eof then
   '/*修改栏目信息
    set rs1=server.createobject("adodb.recordset")
    sql="select * from news_type where id="&id
    rs1.open sql,conn,1,3
	rs1("typename")=typename1
	rs1.update
	call close_rs(rs1)
	call close_rs(rs)
	call close_rs(conn)
	'/*成功转回
	mess="类型信息修改成功！\n"
    goto_url="list.asp"
    call succeed(mess,goto_url)
	response.end
else
'/*当有同名栏目时
	  '/*失败转回
	  call close_rs(rs)
	  call close_rs(conn)
	  mess="类型信息修改失败！ 原因 \n修改的类型名称已经存在！请更换类型名称！\n"
      goto_url="javascript:history.back();"
      call error(mess,goto_url)
	  response.end
end if


%>
