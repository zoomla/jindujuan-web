<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<!--#include file="conn.asp" -->
<!--#include file="../../function.asp" -->
<!--#include file="../../../inc/path.inc" -->

<html>
<head>
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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>产品类型管理</title>
<link href="../../css.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="js.js"></script>
</head>

<body background="../../images/master_bj.jpg" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="37" valign="bottom" bgcolor="#999999">&nbsp;&nbsp;&nbsp; <img src="../../images/title2.gif" width="7" height="7"> 
      <font color="#990000">&nbsp;<b>产品类型信息面板</b></font> 
      <%'call compare_mess(int(language),0," [中文]"," [英文]") %> <hr size="1"> </td>
  </tr>
  <tr> 
    <td height="162" valign="top"><br>
      <table width="93%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td height="22"><b>类型列表</b></td>
        </tr>
      </table>
      <table width="93%" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#666666" bordercolordark="#FFFFFF" class="tablebk">
        <tr> 
          <td width="23%" height="26">&nbsp;产品类型名称</td>
          <td width="12%"><div align="center">行数 X 列数</div></td>
          <td width="12%"><div align="center">状态</div></td>
          <td width="25%"> <div align="center"> 
              <input type="button" name="Submit" value="  添加顶级类型  " onClick="document.location='pro_add.asp?fb_id=0&language=false'">
            </div></td>
        </tr>
        <% 
		  '/*提取产品主类型信息
		  sql="select id,typename,typename_en,cp_encrypt,taxis,link_mode,cp_hs,cp_ls from pro_type where fb_id=0 and language="&false&" order by taxis"
		  rs.open sql,conn,1,1
		  while not rs.eof
		  fbtype_id=rs("id")
		  %>
        <tr> 
          <td height="23"><img src="../../images/ico1.gif" width="10" height="10"> 
            <font face="Arial, Helvetica, sans-serif"><b><%=rs("typename") %></b>/<b><%=rs("typename_en") %></b></font></td>
          <td height="23"><div align="center"><font color="#FF0000"><%=rs("cp_hs") %></font> X <font color="#FF0000"><%=rs("cp_ls") %></font></div></td>
          <td height="23"><div align="center"><%call compare_mess(rs("cp_encrypt"),true,"<font color='#FF0000'>加密</font>","<font color='#0000FF'>普通</font>") %></div></td>
          <td class="black"> <div align="center"> 
              <%call compare_mess(rs("link_mode"),true,"<font color='#666666'>添加次类型</font>","<a href='pro_add.asp?fb_id="&fbtype_id&"&language=false'>添加次类型</a>")%>
              | <a href="pro_modify.asp?id=<%=rs("id") %>">编辑</a> 
              | <a href="javascript:confirm_mess('pro_delete.asp?id=<%=rs("id") %>','您真的要删除 <%=rs("typename")%> 吗？\n')">删除</a></div></td>
        </tr>
        <% 
		if rs("link_mode")=false then
		  '/*提取二级类型信息
	       set rs1=server.createobject("adodb.recordset")
	       sql="select id,typename,typename_en,cp_encrypt,cp_hs,cp_ls,taxis from pro_type where fb_id="&fbtype_id&" order by taxis"
		   rs1.open sql,conn,1,1
	       while not rs1.eof
		  %>
        <tr> 
          <td height="21">&nbsp;&nbsp;&nbsp; <img src="../../images/title2.gif" width="7" height="7"> 
            <font face="Arial, Helvetica, sans-serif"><%=rs1("typename") %>/<%=rs1("typename_en") %></font></td>
          <td height="21"><div align="center"><font color="#FF0000"><%=rs1("cp_hs") %></font> X <font color="#FF0000"><%=rs1("cp_ls") %></font></div></td>
          <td height="21"><div align="center"><%call compare_mess(rs1("cp_encrypt"),true,"<font color='#FF0000'>加密</font>","<font color='#0000FF'>普通</font>") %></div></td>
          <td class="black"> <div align="center"><a href="pro_modify.asp?id=<%=rs1("id") %>">编辑</a> 
              | <a href="javascript:confirm_mess('pro_delete.asp?id=<%=rs1("id") %>','您真的要删除 <%=rs1("typename")%> 吗？\n')">删除</a></div></td>
        </tr>
        <% 
		   rs1.movenext
		   wend
		   call close_rs(rs1)
		end if
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
