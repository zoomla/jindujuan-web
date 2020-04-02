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
type_id=request("type_id")'产品类型
search_key=request("search_key")'显示参数
pages=request("pages")'/页数
'/**
'/*====================================[提取产品类型]=============================
sql="select typename,language from pro_type where id="&type_id
rs.open sql,conn,1,1
show_typename=rs("typename")
language=rs("language")
'/*关闭RS
rs.close
'/**
%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>产品管理</title>
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
</head>

<body background="../images/master_bj.jpg" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td width="38%" height="23" valign="bottom" bgcolor="#999999">&nbsp;&nbsp;&nbsp; 
      <img src="../images/title2.gif" width="7" height="7"> <font color="#990000">&nbsp;<b>产品列表信息面板</b></font> 
      [中英文]</td>
    <td width="62%" bgcolor="#999999"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <form name="form1" method="post" action="list.asp">
          <tr valign="bottom"> 
            <td width="15%" height="24"><div align="right">产品搜索</div></td>
            <td width="36%"> <div align="center"> 
                <input name="search_key" type="text" class="input" id="search_key">
              </div></td>
            <td width="49%"> <input name="Submit" type="submit" class="anniu" value="  搜索  ">
              <input name="type_id" type="hidden" id="type_id" value="<%=type_id %>">
              <input name="language" type="hidden" id="language" value="<%=language %>">
            </td>
          </tr>
        </form>
      </table></td>
  </tr>
  <tr> 
    <td height="13" colspan="2" valign="bottom" bgcolor="#999999">&nbsp;</td>
  </tr>
</table>
<div id="dht" style="display:none"> </div>
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
  <%
'/*当不为搜索时
if search_key="" then
  '/*========================================[判断,提取产品信息]======================================
  '/当显示全部时
  sql="select * from product where language="&language&" and type_id="&type_id&" order by pro_place desc"
else
'/*当为搜索时
    sql="select * from product where (pro_info_en like '%"&search_key&"%' or pro_info like '%"&search_key&"%' or pro_name like '%"&search_key&"%' or pro_mode like '%"&search_key&"%') and language="&language&" order by pro_place desc"
end if
   rs.open sql,conn,1,1
   '/========================[分页信息处理]=============================
   	cp_hs=8
	cp_ls=1
	call pages_action(cp_hs,cp_ls,rdpages,pages)
%>
  <tr> 
    <td height="38">共有该类型<font color="#FF0000"><%=rs.recordcount %></font>个产品，页数 <font color="#FF0000"><%=pages %></font>/<font color="#FF0000"><%=rdpages %><font color="#000000">,类型：</font><%=show_typename %></font></td>
    <td><div align="center">
        <input type="submit" name="Submit2" value="  添加该类型的产品  " onClick="document.location='pro_add.asp?type_id=<%=type_id%>&language=<%=language %>'">
      </div></td>
  </tr>
</table>
<table width="95%" height="76" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="68" valign="top"> 
      <table width="100%" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#666666" bordercolordark="#FFFFFF" class="tablebk">
        <form name="form2" method="post" action="pro_delete.asp">
          <tr bgcolor="#CCCCCC"> 
            <td width="29%" height="23"><b>缩略图</b></td>
            <td width="40%"><b>产品名称</b></td>
            <td width="10%"><div align="center">位置号</div></td>
            <td width="10%"> <div align="center"><b>编辑</b></div></td>
            <td width="11%"> <div align="center"><b>删除</b> 
                <input name="allcheckbox" type="checkbox" id="allcheckbox" value="1" onClick="check(document.form2.c1);">
              </div></td>
          </tr>
          <% 
		  i=cp_hs
		  while not rs.eof and i>0
		  %>
          <tr style="cursor: hand" onMouseOver="this.className='linkover'" onMouseOut="this.className='linkout'"> 
            <td width="29%" height="23"><img src="<%="../../"&product_img&"/"&rs("pro_simg")%>" width="185" height="170" border="0" ></td>
            <td><%=rs("pro_name") %>/<%=rs("pro_mode") %></td>
            <td><div align="center"><font color="#FF0000"><%=rs("pro_place") %></font></div></td>
            <td width="10%" class="black"> <div align="center"><a href="pro_modify.asp?language=<%=language %>&search_key=<%=search_key%>&type_id=<%=type_id%>&id=<%=rs("id") %>">编辑</a> 
              </div></td>
            <td width="11%"> <div align="center"> 
                <input name="c1" type="checkbox" id="c1" value="<%=rs("id") %>">
              </div></td>
          </tr>
          <% 
		  i=i-1
		  rs.movenext
		  wend
		  %>
          <tr> 
            <td height="23">&nbsp;</td>
            <td colspan="2">&nbsp;</td>
            <td colspan="2"><div align="center"> 
                <input type="submit" name="Submit3" value="删除所选">
                <input name="language" type="hidden" id="language" value="<%=language %>">
                <input name="search_key" type="hidden" id="search_key" value="<%=search_key %>">
                <input name="pages" type="hidden" id="pages" value="<%=pages %>">
                <input name="type_id" type="hidden" id="type_id" value="<%=type_id %>">
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
