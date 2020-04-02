<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<!--#include file="conn.asp" -->
<!--#include file="../function.asp" -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户管理</title>
<link href="../css.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="js.js"></script>
<% 
'/====================================================================================================
'//=========================================[验证权限]=================================================
'/====================================================================================================
'/*检查通行证
call checkadmin("../index.asp")
'/*检查权限
call checkpower("3","<font color=red size='2'>您的权限不足！<br><br>该项必须拥有管理员权限才可使用!<br>或者您的操作已超时，请重新登陆！</font>")
'//====================================================================================================
'/====================================================================================================
'/====================================================================================================
%>
</head>

<body background="../images/master_bj.jpg" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="37" valign="bottom" bgcolor="#999999">&nbsp;&nbsp;&nbsp; <img src="../images/title2.gif" width="7" height="7"> 
      <font color="#990000">&nbsp;<b>系统帐户管理面板</b></font> <%'call compare_mess(int(language),0," [中文]"," [英文]") %> <hr size="1"> </td>
  </tr>
  <tr> 
    <td height="162" valign="top"> <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td height="12" colspan="2"> <div align="right"> </div></td>
        </tr>
        <tr> 
          <%
		'/*提取帐户信息
		sql="select * from admin where power<>4"
	   	rs.open sql,conn,1,1
		  %>
          <td height="20">共有系统帐户 <font color="#FF0000"><%=rs.recordcount %></font> 个</td>
          <td><div align="right">
              <input type="submit" name="Submit" value="  添加管理帐户  " onClick="document.location='user_add.asp'">
            </div></td>
        </tr>
        <tr> 
          <td height="12" colspan="2">&nbsp;</td>
        </tr>
      </table>
      <table width="95%" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#666666" bordercolordark="#FFFFFF" class="tablebk">
        <tr> 
          <td width="13%" height="16" bgcolor="#CCCCCC">
<div align="center">身份</div></td>
          <td width="27%" bgcolor="#CCCCCC">&nbsp;系统帐户名</td>
          <td width="35%" bgcolor="#CCCCCC">&nbsp;最近登陆系统时间</td>
          <td width="25%" bgcolor="#CCCCCC"> 
            <div align="center"> 操作</div></td>
        </tr>
        <% 
		  while not rs.eof
		  %>
        <tr> 
          <td height="20"> 
            <div align="center"><%call compare_mess(rs("power"),3,"<font color='#ff0000'> 超级管理员</font>","<font color='#0000FF'>普通操作员</font>") %></div></td>
          <td height="20"><img src="../images/ico1.gif" width="10" height="10"> 
            <font face="Arial, Helvetica, sans-serif"><%=rs("system_name") %></font></td>
          <td height="20"><font face="Arial, Helvetica, sans-serif"><b>&nbsp;</b><%=rs("login_Time") %></font></td>
          <td height="20" class="black"> 
            <div align="center">
              <a href="user_action.asp?id=<%=rs("id") %>"> <%call compare_mess(rs("lock"),true,"激活","停止")%></a> 
              | <a href="user_modify.asp?id=<%=rs("id") %>">编辑</a> 
              | <a href="javascript:confirm_mess('user_delete.asp?id=<%=rs("id") %>','您真的要删除帐户为 <%=rs("system_name")%> 吗？\n')">删除</a></div></td>
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
</table>
</body>
</html>
