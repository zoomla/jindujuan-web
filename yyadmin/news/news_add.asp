<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<!--#include file="conn.asp" -->
<!--#include file="../function.asp" -->
<!--#include file="../../inc/path.inc" -->

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

'/*获取前页信息
type_id=request("type_id")'需要类型ID
'/**
'/*获取栏目信息
sql="select typename,language from news_type where id="&type_id
rs.open sql,conn,1,1
show_typename=rs("typename")'/栏目名称
language=rs("language")
rs.close
'/**
%>
<script charset="utf-8" src="../Keditor/kindeditor.js"></script>
<script charset="utf-8" src="../Keditor/lang/zh_CN.js"></script>
<script charset="utf-8" src="../Keditor/editor2.js"></script>
</head>

<body background="../images/master_bj.jpg" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="37" valign="bottom" bgcolor="#999999">&nbsp;&nbsp;&nbsp; <img src="../images/title2.gif" width="7" height="7"> 
      <font color="#990000">&nbsp;<b>新闻文本内容添加面板</b></font> 
      <%call compare_mess(language,false," [中文]"," [英文]") %> <hr size="1"> </td>
  </tr>
  <tr> 
    <td height="162" valign="top"><br>
      <table width="85%" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#666666" bordercolordark="#FFFFFF" class="tablebk">
        <form action="chknews_add.asp" method="post" name="form1" onSubmit="return Checkform();">
          <tr> 
            <td height="27" colspan="2" bgcolor="#CCCCCC"> <div align="center">新闻信息[<font color="#FF0000" face="Arial, Helvetica, sans-serif"><b><%=show_typename %></b></font><font face="Arial, Helvetica, sans-serif">]</font></div></td>
          </tr>
          <tr> 
            <td width="19%" height="25"> <div align="right">语言：<font color="#FF0000"> 
                </font></div></td>
            <td width="85%"><font color="#FF0000"> 
              <%call compare_mess(language,true,"英文","中文") %>
              </font></td>
          </tr>
          <tr> 
            <td height="12"> <div align="right">所属类型：</div></td>
            <td height="12"><select name="type_id" id="type_id">
                <%
			sql="select id,typename from news_type"
			rs.open sql,conn,1,1
			while not rs.eof
			%>
                <option value="<%=rs("id") %>" <%call compare_mess(rs("id"),int(type_id),"selected","") %>><%=rs("typename") %></option>
                <% 
			rs.movenext
			wend
			rs.close
			%>
              </select></td>
          </tr>
          <tr> 
            <td height="24"> <div align="right">发布时间：</div></td>
            <td height="24"> <input name="news_time" type="text" id="news_time" value="<%=date() %>" size="60" readonly> 
              <font color="#FF0000">*</font></td>
          </tr>
          <tr> 
            <td height="24"><div align="right">新闻标题：</div></td>
            <td height="24"><input name="news_title" type="text" id="news_title" size="60"> 
              <font color="#FF0000">*</font></td>
          </tr>
          <tr> 
            <td height="26" colspan="2" bgcolor="#CCCCCC"> <div align="center">新闻内容界面</div></td>
          </tr>
          <tr> 
            <td colspan="2" align="center"> 
              <table width="98%" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#666666" bordercolordark="#FFFFFF">
                <tr> 
                  <td height="12"><textarea name="news_content" id="news_content" style="width:100%; height:400px; visibility:hidden;"></textarea></td>

                </tr>
              </table></td>
          </tr>
          <tr> 
            <td height="33" colspan="2"><div align="center"> 
                <input type="submit" name="Submit" value="  保存  ">
                <input type="button" name="Submit2" value="  返回  " onClick="javascript:history.back();">
                <input name="language" type="hidden" id="language" value="<%=language %>">
              </div></td>
          </tr>
        </form>
      </table>
      <br> </td>
  </tr>
</table>
</body>
</html>
