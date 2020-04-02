<!--#include file="conn.asp" -->
<!--#include file="../../function.asp" -->
<!--#include file="../../../inc/path.inc" -->
<link href="../../css.css" rel="stylesheet" type="text/css"> 
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" background="../../images/master_bj.jpg">
<%
'/====================================================================================================
'//=========================================[验证权限]=================================================
'/====================================================================================================
'/*检查通行证
call checkadmin("../../index.asp")
'/*检查权限
call checkpower("2","<font color=red size='2'>您的权限不足！<br><br>该项必须拥有操作员权限才可使用!<br>或者您的操作已超时，请重新登陆！</font>")
'//====================================================================================================
'/====================================================================================================
'/====================================================================================================
 
'/*获取前页信息
id=request("id")'/产品的ID
pages=request("pages")
language=request("language")
'/**
'/*=======================================[开始删除]==========================================
sql="select img_name from pro_type where id="&id
rs.open sql,conn,1,3
	
	'/*删除数据库中的信息
    image_name=rs("img_name")'/获取要删除的图片名称
	rs("img_name")=""'/删除该图片在数据库中的信息
	rs.update
	call close_rs(rs)
	call close_rs(conn)
	
   '/*删除空间中的图片
   set fso=server.createobject("scripting.filesystemobject")
   FilePath=server.MapPath("../../../"&protype_img)'/*获取物理路径
   '/*判断要删除的文件是否存在
   if fso.FileExists(FilePath&"/"&image_name) then
      fso.DeleteFile(FilePath&"/"&image_name)'/*执行删除
	  '/*成功转回
	  response.write "<script>document.location='pro_modify.asp?id="&id&"&language="&language&"&pages="&pages&"'</script>"
   else
      response.write "<script>alert('您要删除的图片文件在您的空间之中没有找到! \n数据库中信息已经更新,本次操作不影响网站的正常远行! \n')</script>"
	  response.write "<script>document.location='pro_modify.asp?id="&id&"&language="&language&"&pages="&pages&"'</script>"
	  response.end
   end if
%>