<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<!--#include file="conn.asp" -->
<!--#include file="../function.asp" -->
<!--#include file="../../inc/path.inc" -->

<html>
<head>
<% 
'/====================================================================================================
'//=========================================[验证权限]=================================================
'/====================================================================================================
'/*检查通行证
call checkadmin("../index.asp")
'/*检查权限
call checkpower("2","<font color=red size='2'>您的权限不足！<br><br>该项必须拥有操作员权限才可使用!<br>或者您的操作已超时，请重新登陆！</font>")
'//====================================================================================================
'/====================================================================================================
'/====================================================================================================

'/*获取前页信息
language=request("language")'显示模式
type_id=request("type_id")
'/**
%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="../css.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="js.js"></script>
<script language="JavaScript" src="../ubbjs.js"></script>
<script charset="utf-8" src="../Keditor/kindeditor.js"></script>
<script charset="utf-8" src="../Keditor/lang/zh_CN.js"></script>
<script charset="utf-8" src="../Keditor/editor.js"></script>
<script charset="utf-8" src="../Keditor/editor_en.js"></script>
</head>

<body background="../images/master_bj.jpg" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="37" valign="bottom" bgcolor="#999999">&nbsp;&nbsp;&nbsp; <img src="../images/title2.gif" width="7" height="7"> 
      <font color="#990000">&nbsp;<b>栏目信息添加面板</b></font> 
      <%call compare_mess(language,"False"," [中文]"," [英文]") %> <hr size="1"> </td>
  </tr>
  <tr> 
    <td height="162" valign="top"><br>
      <table width="85%" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#666666" bordercolordark="#FFFFFF" class="tablebk">
        <form action="save.asp" method="post" name="form1" onSubmit="return Checkform();">
          <tr> 
            <td height="21" colspan="3" bgcolor="#CCCCCC"> <div align="center">『 
                栏目文字信息 』</div></td>
          </tr>
          
          <tr> 
            <td width="14%" height="24"><div align="right">中文栏目名称：</div></td>
            <td width="86%" colspan="2"><input name="columns_name" type="text" id="columns_name" size="55"> 
              <font color="#FF0000">*</font></td>
          </tr>
          <tr> 
            <td height="24"><div align="right">英文栏目名称：</div></td>
            <td colspan="2"><input name="en_columns_name" type="text" id="en_columns_name" size="55">            </td>
          </tr>
          <tr> 
            <td height="23" colspan="3" bgcolor="#CCCCCC"> <div align="center">『 
                中文栏目描述 』</div></td>
          </tr>
          <tr> 
            <td colspan="3" align="center"> <table width="98%" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#666666" bordercolordark="#FFFFFF">
                <tr> 
                  <td height="12" align="center"><textarea name="columns_info" id="columns_info" style=" width:100%; height:400px; visibility:hidden;"></textarea>                 </td>
                </tr>
              </table></td>
          </tr>
          <tr>
            <td height="23" colspan="3" bgcolor="#CCCCCC"><div align="center">『 
            英文栏目描述 』</div></td>
          </tr>
          <tr>
            <td height="33" colspan="3"><table width="98%" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#666666" bordercolordark="#FFFFFF">
              <tr>
                <td height="12" align="center"><textarea name="en_columns_info" id="en_columns_info" style=" width:100%; height:400px; visibility:hidden;"></textarea></td>
              </tr>
            </table></td>
          </tr>
          <tr> 
            <td height="33" colspan="3"> <div align="center"> 
                <input type="submit" name="Submit" value="  添加  ">
                <input type="button" name="Submit2" value="  返回  " onClick="javascript:history.back();">
                <input name="language" type="hidden" id="language" value="<%=language %>">
                <input name="pro_simg" type="hidden" id="pro_simg">
                <input name="pro_bimg" type="hidden" id="pro_bimg">
              </div></td>
          </tr>
        </form>
      </table>
      <br> </td>
  </tr>
</table>
</body>
</html>
