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
pages=request("pages")'/页数
'/**
'/*====================================[提取产品类型]=============================
%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="../css.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="js.js"></script>
<script language="JavaScript" type="text/JavaScript">
<!--


function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);
//-->
</script>
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>

<body background="../images/master_bj.jpg" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td width="38%" height="23" valign="bottom" bgcolor="#999999">&nbsp;&nbsp;&nbsp; 
      <img src="../images/title2.gif" width="7" height="7"> <font color="#990000">&nbsp;<b>栏目信息面板</b></font></td>
    <td width="62%" bgcolor="#999999">&nbsp;</td>
  </tr>
  <tr> 
    <td height="13" colspan="2" valign="bottom" bgcolor="#999999">&nbsp;</td>
  </tr>
</table>
<div id="dht" style="display:none"> </div>
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
  <%
  sql="select * from columns order by id"
   rs.open sql,conn,1,1
   '/========================[分页信息处理]=============================
   	cp_hs=8
	cp_ls=1
	call pages_action(cp_hs,cp_ls,rdpages,pages)
%>
  <tr> 
    <td width="68%" height="38">&nbsp;</td>
    <td width="32%"><div align="center">
        <input type="submit" name="Submit2" value="  添加栏目  " onClick="document.location='save_info.asp'">
    </div></td>
  </tr>
</table>
<table width="95%" height="76" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="68" valign="top"> 
      <table width="100%" border="1" align="center" cellpadding="2" cellspacing="0" bordercolor="#666666" bordercolordark="#FFFFFF" class="tablebk">
        <form name="form2" method="post" action="delete.asp">
          <tr bgcolor="#CCCCCC">
            <td width="7%"><div align="center"><strong>编号</strong></div></td> 
            <td width="69%" height="23"><b>　栏目名称</b></td>
            <td width="9%"> <div align="center"><b>编辑</b></div></td>
            <td width="15%"> <div align="center"><b>删除</b> 
                <input name="allcheckbox" type="checkbox" id="allcheckbox" value="1" onClick="check(document.form2.c1);">
              </div></td>
          </tr>
          <% 
		  i=cp_hs
		  while not rs.eof and i>0
		  %>
          <tr >
            <td><div align="center" class="STYLE1"><%=rs("id") %></div></td> 
            <td height="23">　<%=rs("columns_name") %></td>
            <td width="9%" class="black"> <div align="center"><a href="modify_info.asp?id=<%=rs("id") %>">编辑</a> 
              </div></td>
            <td width="15%"> <div align="center"> 
                <input name="c1" type="checkbox" id="c1" value="<%=rs("id") %>">
              </div></td>
          </tr>
          <% 
		  i=i-1
		  rs.movenext
		  wend
		  %>
          <tr>
            <td>&nbsp;</td> 
            <td height="23">&nbsp;</td>
            <td colspan="2"><div align="center"> 
                <input type="submit" name="Submit3" value="删除所选">
                <input name="pages" type="hidden" id="pages" value="<%=pages %>">
              </div></td>
          </tr>
        </form>
      </table></td>
  </tr>
  <tr>
    <td height="8"><!--#include file="pages.asp" --></td>
  </tr>
</table>
</body>
</html>
