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

'/*接受信息
language=request("language")
'/**
'/*提取所需信息
sql="select * from define where language="&language
rs.open sql,conn,1,1
   id=rs("id")
   web_title=rs("web_title")
   contact_email=rs("contact_email")
   web_url=rs("web_url")
   web_foot=rs("web_foot")
   bbs_mode=rs("bbs_mode")
   member_mode=rs("member_mode")'会员注册审核模式
   mess_info=rs("mess_info")
'/*关闭指针
call close_rs(rs)
call close_rs(conn)
'/**
%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="../css.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="js.js"></script>
</head>

<body background="../images/master_bj.jpg" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="37" valign="bottom" bgcolor="#999999">&nbsp;&nbsp;&nbsp; <img src="../images/title2.gif" width="7" height="7"> 
      <font color="#990000">&nbsp;<b>网站全局参数面板</b></font>
      <%call compare_mess(language,"false"," [中文]"," [英文]") %> <hr size="1"> </td>
  </tr>
  <tr> 
    <td height="162" valign="top"><br>
      <table width="95%" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#666666" bordercolordark="#FFFFFF" class="tablebk">
        <form name="form1" method="post" action="modify.asp" onSubmit="return Checkform();">
          <tr> 
            <td width="18%" height="29"> <div align="right"><b>网页标题：&nbsp; </b></div></td>
            <td width="82%"> <input name="web_title" type="text" id="web_title" value="<%=web_title %>" size="60"> 
              <font color="#FF0000">*</font> </td>
          </tr>
          <tr> 
            <td height="29"><div align="right"><b>网站地址：&nbsp; </b></div></td>
            <td><input name="web_url" type="text" id="web_url" value="<%=web_url %>" size="60"> 
              <font color="#FF0000">*</font></td>
          </tr>
          <tr> 
            <td height="29"><div align="right"><b>接信EMAIL：&nbsp; </b></div></td>
            <td><input name="contact_email" type="text" id="contact_email" value="<%=contact_email %>" size="60"> 
              <font color="#FF0000">*</font></td>
          </tr>
		  <tr> 
            <td height="29"> <div align="right"><b>客户留言模式：</b></div></td>
            <td><input name="bbs_mode" type="checkbox" id="bbs_mode" value="1" <%call compare_mess(bbs_mode,true,"checked","") %>>
              *选择该模式留言将需审核，才能生效。</td>
          </tr>
          <tr> 
            <td height="15" valign="top"> <div align="right"><b>关键字描述：</b></div></td>
            <td><textarea name="web_foot" cols="55" rows="10" id="web_foot"><%=web_foot %></textarea>
              *</td>
          </tr>
          <tr> 
            <td height="36" valign="top">&nbsp;</td>
            <td><input type="submit" name="Submit" value="  提交  "> <input type="button" name="Submit2" value="  返回  " onClick="javascript:history.back();"> 
              <input name="id" type="hidden" id="id" value="<%=id %>"> 
              <input name="language" type="hidden" id="language" value="<%=language %>"></td>
          </tr>
        </form>
      </table>
      <br> </td>
  </tr>
</table>
</body>
</html>
