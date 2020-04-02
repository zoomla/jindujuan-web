<!--#include file="conn.asp" -->
<!--#include file="../function.asp" -->
<!--#include file="../../inc/path.inc" -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="../css.css" rel="stylesheet" type="text/css">
<title>新闻删除</title><body background="../images/master_bj.jpg">
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

'/获取前页信息
id=request("id")
type_id=request("type_id")
pages=request("pages")
'/**

'/*提取要删除数据库相关信息
sql="select * from news where id="&id
rs.open sql,conn,1,3
'/*删除数据库相关信息
rs.delete
rs.update
call close_rs(rs)
call close_rs(conn)
if img_name<>"" then
'/*删除空间中的文件
   '/*获取物理路径
   FilePath = Server.MapPath("../../"&news_img)
   set fso=server.createobject("scripting.filesystemobject")
      '/*判断要删除的文件是否存在
      if fso.FileExists(FilePath&"/"&img_name) then
         fso.DeleteFile(FilePath&"/"&img_name)
      else
         response.write "<script>alert('您要删除的图片文件在您的空间之中没有找到! \n数据库中信息已经更新,本次操作不影响网站的正常运行! \n')</script>"
	     response.write "<script>document.location='list.asp?pages="&pages&"&type_id="&type_id&"'</script>"
	     response.end
      end if
end if
'/*成功转回
mess="信息删除成功！\n"
goto_url="list.asp?pages="&pages&"&type_id="&type_id
call succeed(mess,goto_url)
'/**

%>