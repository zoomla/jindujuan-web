<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<!--#include file="conn.asp" -->
<!--#include file="../../function.asp" -->
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>新闻管理</title>
<link href="../../css.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="js.js"></script>
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
%>
</head>

<body background="../../images/master_bj.jpg" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="37" valign="bottom" bgcolor="#999999">&nbsp;&nbsp;&nbsp; <img src="../../images/title2.gif" width="7" height="7"> 
      <font color="#990000">&nbsp;<b>新闻类型信息面板</b></font> 
      <%'call compare_mess(int(language),0," [中文]"," [英文]") %>
      <hr size="1"> </td>
  </tr>
  <tr> 
    <td height="162" valign="top"> <table width="80%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td height="28"><font color="#FF0000">*警告！您在此栏的操作属于网站制作人员的权限，可能导致网站无法正常运行！建议非网站制作人员请勿在此操作！</font></td>
        </tr>
        <tr>
          <td height="28">新闻类型</td>
        </tr>
      </table>
      <table width="80%" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#666666" bordercolordark="#FFFFFF" class="tablebk">
        <tr bgcolor="#CCCCCC"> 
          <td width="6%" height="26"><div align="center">ID</div></td>
          <td width="53%">&nbsp;新闻类型名称</td>
          <td width="41%"> <div align="center"> 
              <input type="button" name="Submit" value="  添加新闻类型  " onClick="document.location='news_add.asp?language=false'">
            </div></td>
        </tr>
        <% 
		  '/*提取信息
		  sql="select * from news_type where language="&false
		  rs.open sql,conn,1,1
		  while not rs.eof
		  %>
        <tr> 
          <td height="20"> <div align="center"><font color="#FF0000"><%=rs("id") %></font></div></td>
          <td height="20"><img src="../../images/ico1.gif" width="10" height="10"> 
            <font face="Arial, Helvetica, sans-serif"><b><%=rs("typename") %></b></font></td>
          <td height="20" class="black"> <div align="center"><a href="javascript:confirm_mess('news_modify.asp?id=<%=rs("id") %>','警告！您的操作属于网站制作人员的权限，可能导致网站无法正常运行！\n您真的要编辑类型为 <%=rs("typename")%> 吗？\n')">编辑</a> 
              | <a href="javascript:confirm_mess('news_delete.asp?id=<%=rs("id") %>','警告！您的操作属于网站制作人员的权限，可能导致网站无法正常运行！\n您真的要删除类型为 <%=rs("typename")%> 吗？\n')">删除</a></div></td>
        </tr>
        <%
		rs.movenext
		wend
		rs.close
		%>
      </table>
      <br></td>
  </tr>
</table>
</body>
</html>
