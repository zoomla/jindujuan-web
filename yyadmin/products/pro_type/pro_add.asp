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

'/*获取前页的信息
fb_id=request("fb_id")
language=request("language")
%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>产品类型添加</title>
<link href="../../css.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="js.js"></script>
</head>

<body background="../../images/master_bj.jpg" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="37" valign="bottom" bgcolor="#999999">&nbsp;&nbsp;&nbsp; <img src="../../images/title2.gif" width="7" height="7"> 
      <font color="#990000">&nbsp;<b>产品类型添加面板</b></font> 
      <%'call compare_mess(int(language),0," [中文]"," [英文]") %> <hr size="1"> </td>
  </tr>
  <tr> 
    <td height="162" valign="top"><br>
      <table width="80%" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#666666" bordercolordark="#FFFFFF" class="tablebk">
        <form name="form1" method="post" action="chkpro_add.asp" onSubmit="return Checkform();">
          <tr> 
            <td width="19%" height="21"> <div align="right"><b>语言：</b></div></td>
            <td colspan="2"><font color="#FF0000"> 
              <%call compare_mess(language,"true","英文","中文") %>
              </font></td>
          </tr>
          <tr> 
            <td height="27"> <div align="right"><b>中文类型名称：</b></div></td>
            <td colspan="2"><input name="typename" type="text" id="typename" size="55"> 
              <font color="#FF0000">*</font> </td>
          </tr>
		            <tr> 
            <td height="27"> <div align="right"><b>英文类型名称：</b></div></td>
            <td colspan="2"><input name="typename_en" type="text" id="typename_en" size="55"></td>
          </tr>
          <tr> 
            <td height="26"><div align="right"><b>类型图片：</b></div></td>
            <td width="45%"><iframe marginwidth=0 framespacing=0 marginheight=0 frameborder=0 width='300' height=28 srcolling=no src="../../inc/pro_type_upload_01.asp"></iframe> </td>
            <td width="36%"><input name="big_image" type="Text" id="big_image2" value='' size="30"></td>
          </tr>
          <tr> 
            <td height="26"> <div align="right"><b>所属类型：</b></div></td>
            <td colspan="2"><select name="fb_id" id="fb_id">
                <option value="0" <%call compare_mess(int(fb_id),0,"selected","") %>>顶级类型</option>
                <%
				'/*提取顶级类型信息
				sql="select id,typename,typename_en from pro_type where fb_id=0 order by taxis"
				rs.open sql,conn,1,1
				while not rs.eof
				%>
                <option value="<%=rs("id") %>" <%call compare_mess(int(fb_id),int(rs("id")),"selected","") %>><%=rs("typename") %>/<%=rs("typename_en") %></option>
                <% 
				rs.movenext
				wend
				call close_rs(rs)
				call close_rs(conn)
				%>
              </select> <font color="#FF0000">*</font> </td>
          </tr>
          <tr> 
            <td height="26"><div align="right"><b>产品展示数：</b></div></td>
            <td colspan="2"><input name="cp_hs" type="text" id="cp_hs" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" value="1" size="5">
              X 
              <input name="cp_ls" type="text" id="cp_ls" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" value="1" size="5"> 
              <font color="#FF0000">*产品行数 X 列数/每页,该选项只针对二级类型生效<b>。</b></font></td>
          </tr>
          <tr> 
            <td height="30"> <div align="right"><b>类型排序号：</b></div></td>
            <td colspan="2"><input name="taxis" type="text" id="taxis" size="5" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"> 
              <font color="#FF0000">*请填写 1~N 的整数，小者居前。</font></td>
          </tr>
          <tr> 
            <td height="25"><div align="right"><b>链接模式：</b></div></td>
            <td colspan="2"><input name="link_mode" type="checkbox" id="link_mode" value="true" <%call compare_mess(int(fb_id),0,"","checked") %>>
              选择该项该类型将直接连接到产品页（只针对顶级类型生效）</td>
          </tr>
          <tr> 
            <td height="33">&nbsp;</td>
            <td colspan="2"><input type="submit" name="Submit" value="  添加  "> 
              <input type="button" name="Submit2" value="  返回  " onClick="javascript:history.back();"> 
              <input name="language" type="hidden" id="language" value="<%=language %>"> 
              <input name="filename" type="hidden" id="filename"></td>
          </tr>
        </form>
      </table>
      <br> </td>
  </tr>
</table>
</body>
</html>
