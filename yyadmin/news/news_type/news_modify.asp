<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<!--#include file="conn.asp" -->
<!--#include file="../../function.asp" -->
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>新闻修改</title>
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

'/*获取前页的信息
id=request("id")
'/*提取要修改的信息
sql="select * from news_type where id="&id
rs.open sql,conn,1,1
  typename1=rs("typename")
  language=rs("language")
rs.close
%>
</head>

<body background="../../images/master_bj.jpg" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="37" valign="bottom" bgcolor="#999999">&nbsp;&nbsp;&nbsp; <img src="../../images/title2.gif" width="7" height="7"> 
      <font color="#990000">&nbsp;<b>新闻类型信息修改面板</b></font> 
      <%'call compare_mess(int(language),0," [中文]"," [英文]") %> <hr size="1"> </td>
  </tr>
  <tr> 
    <td height="162" valign="top"><br>
      <table width="80%" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#666666" bordercolordark="#FFFFFF" class="tablebk">
        <form name="form1" method="post" action="chknews_modify.asp" onSubmit="return Checkform();">
		<tr> 
            <td width="19%" height="25"> 
              <div align="right"><b>语言：</b><font color="#FF0000"> </font></div></td>
            <td width="81%"><font color="#FF0000">
              <%call compare_mess(language,True,"英文","中文") %>
              </font></td>
          </tr>
          <tr> 
            <td width="19%" height="26"> <div align="right"><b>栏目名称：</b></div></td>
            <td width="81%"> <input name="typename" type="text" id="typename" value="<%=typename1 %>" size="55"> 
              <font color="#FF0000">*</font> </td>
          </tr>
          <tr> 
            <td height="33">&nbsp;</td>
            <td><input type="submit" name="Submit" value="  保存  "> <input type="button" name="Submit2" value="  返回  " onClick="javascript:history.back();"> 
              <input name="id" type="hidden" id="id" value="<%=id %>"></td>
          </tr>
        </form>
      </table>
      <br> </td>
  </tr>
</table>
</body>
</html>
