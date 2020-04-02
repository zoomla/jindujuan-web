<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<!--#include file="conn.asp" -->
<!--#include file="../function.asp" -->
<html>
<head>
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

'/*获取前页信息
id=request("id")'需要修改ID
'/**
'/*获取修改信息
sql="select * from admin where id="&id
rs.open sql,conn,1,1
system_name=rs("system_name")'/系统帐户
system_password=rs("system_password")'/系统密码
lock1=rs("lock")'/状态
'/*
call close_rs(rs)
call close_rs(conn)
'/**
%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户修改</title>
<link href="../css.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="js.js"></script>
</head>

<body background="../images/master_bj.jpg" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="37" valign="bottom" bgcolor="#999999">&nbsp;&nbsp;&nbsp; <img src="../images/title2.gif" width="7" height="7"> 
      <font color="#990000">&nbsp;<b>系统帐户信息修改面板</b></font> 
      <%'call compare_mess(int(language),0," [中文]"," [英文]") %> <hr size="1"> </td>
  </tr>
  <tr> 
    <td height="162" valign="top"><br>
      <table width="80%" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#666666" bordercolordark="#FFFFFF" class="tablebk">
        <form action="chkuser_modify.asp" method="post" name="form1" onSubmit="return Checkform();">
          <tr> 
            <td width="19%" height="27"><div align="right">登陆帐户：</div></td>
            <td width="81%"><input name="system_name" type="text" id="system_name" value="<%=system_name %>" size="55"> 
              <font color="#FF0000">*</font></td>
          </tr>
          <tr> 
            <td height="27"> <div align="right">登陆密码：</div></td>
            <td> <font color="#FF0000"> 
              <input name="system_password" type="password" id="system_password" value="<%=system_password %>" size="55">
              *</font> </td>
          </tr>
          <tr> 
            <td height="27"><div align="right">密码确认：</div></td>
            <td><font color="#FF0000"> 
              <input name="system_password2" type="password" id="system_password2" value="<%=system_password %>" size="55">
              </font></td>
          </tr>
          <tr bgcolor="#CCCCCC"> 
            <td height="27"> <div align="right">帐户状态：</div></td>
            <td> <input name="lock" type="checkbox" id="lock" value="False" <%call compare_mess(lock1,false,"checked","") %>>
              *激活该帐户</td>
          </tr>
          <tr> 
            <td height="33">&nbsp;</td>
            <td><input type="submit" name="Submit" value="  保存  "> <input type="button" name="Submit2" value="  返回  " onClick="javascript:history.back();"> 
              <input name="id" type="hidden" id="id" value="<%=id %>"> 
            </td>
          </tr>
        </form>
      </table>
      <br> </td>
  </tr>
</table>
</body>
</html>
