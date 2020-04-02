<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<!--#include file="conn.asp" -->
<!--#include file="../function.asp" -->
<!--#include file="../../inc/path.inc" -->

<html>
<script charset="utf-8" src="../Keditor/kindeditor.js"></script>
<script charset="utf-8" src="../Keditor/lang/zh_CN.js"></script>
<script charset="utf-8" src="../Keditor/editor3.js"></script>
<script charset="utf-8" src="../Keditor/editor3_en.js"></script>
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
<title>产品添加</title>
<link href="../css.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="js.js"></script>

</head>

<body background="../images/master_bj.jpg" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="37" valign="bottom" bgcolor="#999999">&nbsp;&nbsp;&nbsp; <img src="../images/title2.gif" width="7" height="7"> 
      <font color="#990000">&nbsp;<b>产品信息添加面板</b></font> 
      <%call compare_mess(language,"False"," [中文]"," [英文]") %> <hr size="1"> </td>
  </tr>
  <tr> 
    <td height="162" valign="top"><br>
      <table width="85%" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#666666" bordercolordark="#FFFFFF" class="tablebk">
        <form action="chkpro_add.asp" method="post" name="form1" onSubmit="return Checkform();">
          <tr> 
            <td height="21" colspan="3" bgcolor="#CCCCCC"> <div align="center">『 
                产品文字信息 』</div></td>
          </tr>
          <tr> 
            <td width="19%" height="25"> <div align="right">语言：<font color="#FF0000"> 
                </font></div></td>
            <td colspan="2"><font color="#FF0000"> 
              <%call compare_mess(language,"True","英文","中文") %>
              </font></td>
          </tr>
          <tr> 
            <td height="24"><div align="right">所属类型：</div></td>
            <td colspan="2"> <font color="#FF0000"> 
              <select name="type_id" id="type_id">
                <%
			  sql="select id,typename from pro_type where fb_id=0 and language="&language&" order by taxis"
			  rs.open sql,conn,1,1
			  while not rs.eof
			   %>
                <option value="<%=rs("id") %>" <%call compare_mess(int(type_id),rs("id"),"selected","") %>><%=rs("typename") %></option>
                <%
				fb_id=rs("id")
				set rs1=server.createobject("adodb.recordset")
				sql="select id,typename from pro_type where fb_id="&fb_id&" order by taxis"
			    rs1.open sql,conn,1,1
				while not rs1.eof
				%>
                <option value="<%=rs1("id") %>" <%call compare_mess(int(type_id),rs1("id"),"selected","") %>>---<%=rs1("typename") %></option>
                <% 
				rs1.movenext
				wend
				rs1.close
				rs.movenext
				wend
				rs.close
				%>
              </select>
              *</font></td>
          </tr>
          <tr> 
            <td height="24"><div align="right">中文产品名称：</div></td>
            <td colspan="2"><input name="pro_name" type="text" id="pro_name" size="55"> 
              <font color="#FF0000">*</font></td>
          </tr>
		            <tr> 
            <td height="24"><div align="right">英文产品名称：</div></td>
            <td colspan="2"><input name="pro_mode" type="text" id="pro_mode" size="55">              </td>
          </tr>
          <tr> 
            <td height="20" colspan="3" bgcolor="#CCCCCC"> <div align="center">『 
                产品图片信息 』</div></td>
          </tr>
          <tr> 
            <td height="27"> <div align="right">产品缩略图：</div></td>
            <td width="39%"><iframe marginwidth=0 framespacing=0 marginheight=0 frameborder=0 width='300' height=28 srcolling=no src="../inc/pro_upload_x_01.asp"></iframe>            </td>
            <td width="42%"><input name="big_image" type="Text" id="big_image2" value='' size="30"></td>
          </tr>
          <!--<tr> 
            <td height="30"> <div align="right">产品放大图：</div></td>
            <td><iframe marginwidth=0 framespacing=0 marginheight=0 frameborder=0 width='300' height=28 srcolling=no src="../inc/pro_upload_d_01.asp"></iframe>            </td>
            <td><input name="small_image" type="Text" id="small_image2" value='' size="30"></td>
          </tr>-->
          <tr> 
            <td height="27"> <div align="right">产品排序号：</div></td>
            <td colspan="2"><input name="pro_place" type="text" id="pro_place"onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" value="0" size="10"> 
              <font color="#FF0000">*请填写产品的位置号，数值小者居前。</font></td>
          </tr>
          <tr>
            <td height="27"><div align="right">条件选择：</div></td>
            <td colspan="2"><input name="pro_comm" type="checkbox" id="pro_comm" value="true">
              推荐产品</td>
          </tr>
	
         <tr> 
            <td height="23" colspan="3" bgcolor="#CCCCCC"> <div align="center">『 
                中文产品描述 』</div></td>
          </tr>
          <tr> 
            <td colspan="3" align="center"> <table width="98%" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#666666" bordercolordark="#FFFFFF">
                <tr> 
                  <td height="12" align="center"> <textarea name="pro_info" id="pro_info" style="width:100%; height:400px; visibility:hidden;"></textarea>                </td>
                </tr>
              </table></td>
          </tr>
		  <tr> 
            <td height="23" colspan="3" bgcolor="#CCCCCC"> <div align="center">『 
                英文产品描述 』</div></td>
          </tr>
          <tr> 
            <td colspan="3" align="center"> <table width="98%" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#666666" bordercolordark="#FFFFFF">
                <tr> 
                  <td height="12" align="center"> <textarea name="pro_info_en" id="pro_info_en" style="width:100%; height:400px; visibility:hidden;"></textarea>                  </td>
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
