<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<!--#include file="conn.asp" -->
<!--#include file="../function.asp" -->
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="../css.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="js.js"></script>
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
language=request("language")
%>
</head>

<body background="../images/master_bj.jpg" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="37" valign="bottom" bgcolor="#999999">&nbsp;&nbsp;&nbsp; <img src="../images/title2.gif" width="7" height="7"> 
      <font color="#990000">&nbsp;<b>新闻信息面板</b></font> 
      <%call compare_mess(language,false," [中文]"," [英文]") %> <hr size="1"> </td>
  </tr>
  <tr> 
    <td height="162" valign="top"> <table width="93%" height="31" border="0" align="center" cellpadding="0" cellspacing="0">
        <%
	     '/*获取前页信息
		   type_id=request("type_id")
		   pages=request("pages")
		   '/*提取新闻类型信息
		   sql="select typename,language from news_type where id="&type_id
		   rs.open sql,conn,1,1
		   show_typename=rs("typename")
		   language=rs("language")
		   rs.close
		  '/*提取新闻信息
		  sql="select id,news_title,news_time,hot_count from news where type_id="&type_id&" order by news_time desc"
		  rs.open sql,conn,1,1
		  cp_hs=20
		  cp_ls=1
		  call pages_action(cp_hs,cp_ls,rdpages,pages)
		  %>
        <tr> 
          <td height="31">共有该类型新闻<font color="#FF0000"><%=rs.recordcount %></font>条，页数 <font color="#FF0000"><%=pages %></font>/<font color="#FF0000"><%=rdpages %></font>,类型：<font color="#FF0000"><%=show_typename %></font></td>
        </tr>
      </table>
      <table width="93%" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#666666" bordercolordark="#FFFFFF" class="tablebk">
        <tr bgcolor="#CCCCCC"> 
          <td width="4%" height="26"><div align="center"><img src="../images/wz1.gif" width="17" height="17"></div></td>
          <td width="57%">新闻标题</td>
          <td width="5%">&nbsp;次数</td>
          <td width="16%"><div align="center">发布时间</div></td>
          <td width="18%"> <div align="center"> 
              <input type="button" name="Submit" value="添加该类型信息" onClick="document.location='news_add.asp?type_id=<%=type_id %>&language=<%=language %>'">
            </div></td>
        </tr>
        <% 
		  i=cp_hs
		  while not rs.eof and i>0
		  %>
        <tr style="cursor: hand" onMouseOver="this.className='linkover'" onMouseOut="this.className='linkout'"> 
          <td height="23"> 
            <div align="center"><font color="#FF0000"><img src="../images/ico1.gif" width="10" height="10"> 
              </font></div></td>
          <td height="23" class="black"> <a href="news_read.asp?type_id=<%=type_id %>&pages=<%=pages %>&id=<%=rs("id") %>"><%=rs("news_title")%></a></td>
          <td height="23"><div align="center"><font color="#FF0000"><%=rs("hot_count")%></font></div></td>
          <td><div align="center"><%=rs("news_time")%></div></td>
          <td height="23" class="black"> 
            <div align="center"><a href="news_modify.asp?type_id=<%=type_id %>&pages=<%=pages%>&language=<%=language%>&id=<%=rs("id") %>"> 
              编辑</a> | <a href="javascript:confirm_mess('news_delete.asp?type_id=<%=type_id %>&pages=<%=pages%>&language=<%=language%>&id=<%=rs("id") %>','您真的要删除该信息吗？\n')">删除</a></div></td>
        </tr>
        <%
		i=i-1
		rs.movenext
		wend
		call close_rs(rs)
		call close_rs(conn)
		%>
      </table>
      <br> </td>
  </tr>
  <tr> 
    <td height="16" valign="top"><!--#include file="pages.asp" --></td>
  </tr>
</table>
</body>
</html>
