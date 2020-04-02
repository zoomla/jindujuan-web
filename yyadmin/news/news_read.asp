<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<!--#include file="conn.asp" -->
<!--#include file="../function.asp" -->
<!--#include file="../../inc/path.inc" -->
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="../css.css" rel="stylesheet" type="text/css">
<% 
'/*检查通行证
call checkadmin("../index.asp")
'/*检查权限
call checkpower("2","<font color=red>您的权限不足！<br><br>该项必须拥有操作员权限才可使用!<br>或者您的操作已超时，请重新登陆！</font>")

'/*前页信息
id=request("id")
type_id=request("type_id")
pages=request("pages")
'/*
sql="select * from news where id="&id
rs.open sql,conn,1,1
news_title=rs("news_title")
news_content=rs("news_content")
hot_count=rs("hot_count")
news_time=rs("news_time")
'/*
call close_rs(rs)
call close_rs(conn)
%>
</head>

<body background="../images/master_bj.jpg" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="20"> &nbsp;&nbsp;&nbsp;<img src="../images/title2.gif" width="7" height="7"> 
      &nbsp; <b><font color="#990000">新闻信息查看</font></b></td>
  </tr>
  <tr>
    <td height="300" valign="top"><br>
      <table width="89%" height="299" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td height="34"> <div align="center"><font size="3"><b><%=news_title %></b></font>
              <hr size="1">
            </div></td>
        </tr>
        <tr> 
          <td height="211" valign="top"> 
            <%=news_content%>
          </td>
        </tr>
        <tr> 
          <td height="27"> <div align="right">浏览次数：<font color="#FF0000"><%=hot_count %></font> 
              发布时间：<font color="#FF0000"><%=news_time %></font></div></td>
        </tr>
        <tr>
          <td height="27"><div align="center">
              <input type="submit" name="Submit" value="  返回  " onClick="history.back();">
              <input type="submit" name="Submit2" value="  编辑  " onClick="document.location='news_modify.asp?type_id=<%=type_id %>&pages=<%=pages %>&id=<%=id %>'">
            </div></td>
        </tr>
      </table></td>
  </tr>
</table>
</body>
</html>
