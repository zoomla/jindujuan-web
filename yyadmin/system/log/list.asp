<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<!--#include file="conn.asp" -->
<!--#include file="../../function.asp" -->
<html>
<head>
<% 
'/====================================================================================================
'//=========================================[验证权限]=================================================
'/====================================================================================================
'/*检查通行证
call checkadmin("../../index.asp")
'/*检查权限
call checkpower("３","<font color=red size='2'>您的权限不足！<br><br>该项必须拥有管理员权限才可使用!<br>或者您的操作已超时，请重新登陆！</font>")
'//====================================================================================================
'/====================================================================================================
'/====================================================================================================
%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="../../css.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="js.js"></script>
</head>

<body background="../../images/master_bj.jpg" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="37" valign="bottom" bgcolor="#999999">&nbsp;&nbsp;&nbsp; <img src="../../images/title2.gif" width="7" height="7"> 
      <font color="#990000">&nbsp;<b>系统日志信息面板</b></font> <%'call compare_mess(int(language),0," [中文]"," [英文]") %> <hr size="1"> </td>
  </tr>
  <tr> 
    <td height="162" valign="top"><br>
      <form name="form1" method="post" action="delete.asp">
        <table width="80%" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#666666" bordercolordark="#FFFFFF" class="tablebk">
          <tr bgcolor="#CCCCCC"> 
            <td width="8%" height="21"> <div align="center">&nbsp;状态</div></td>
            <td width="76%">&nbsp;系统信息</td>
            <td width="16%"> <div align="center">删除 
                <input name="allcheckbox" type="checkbox" id="allcheckbox3" value="1" onClick="check(document.all.item('c1'));">
              </div></td>
          </tr>
          <% 
		   pages=request("pages")
		  '/*提取日志信息
		  sql="select * from system_log order by id desc"
		  rs.open sql,conn,1,1
		    '/========================[分页信息处理]=============================
          cp_ls=1
          cp_hs=25
          page_size=cp_ls*cp_hs
          rs.pagesize=page_size
          rdpages=rs.pagecount
          if pages="" then
             pages=0
          end if
          if rs.eof=false then
             if pages=0 then
                pages=1
             end if
              rs.AbsolutePage=pages
          end if
		  i=cp_hs
		  while not rs.eof and i>0
		  %>
          <tr> 
            <td height="20"> <div align="center"><font color="#FF0000"><%=rs("log_state") %></font></div></td>
            <td height="20" class="black"><img src="../../images/ico1.gif" width="10" height="10"> 
              <font face="Arial, Helvetica, sans-serif"><a href="#" tips="<%=rs("log_info") %>" onmousemove=show(this.tips,1) onmouseout=show(this.tips,0)><%=rs("log_title") %></a></font></td>
            <td height="20" class="black"> <div align="center"> 
                <input name="c1" type="checkbox" id="c13" value="<%=rs("id") %>">
              </div></td>
          </tr>
          <%
		i=i-1
		rs.movenext
		wend
		call close_rs(rs)
		call close_rs(conn)
		%>
          <tr> 
            <td height="21">&nbsp;</td>
            <td height="21" class="black">&nbsp;</td>
            <td height="21" class="black"><div align="center"> 
                <input type="submit" name="Submit3" value="删除所选">
              </div></td>
          </tr>
        </table>
      </form>
      <br> </td>
  </tr>
  <tr> 
    <td height="27"><!--#include file="pages.asp" --></td>
  </tr>
</table>
<div id=mytips style="position:absolute;width:350;height:80;border:1 gray solid;font-size:9pt;background-color:#eeeeee;display:none;filter: progid; WORD-WRAP: break-word"> 
</div>
</body>
</html>
