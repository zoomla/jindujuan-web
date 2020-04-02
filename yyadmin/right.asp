<meta name="description" content="白少庭作品">
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台管理</title>
<link href="css.css" rel="stylesheet" type="text/css">
</head>

<body background="images/master_bj.jpg">
<table width="83%" height="240" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="271"> <div align="center"> 
        <p>&nbsp;</p>
        <p><font color="#990000"><b><font face="Arial, Helvetica, sans-serif" size="+1">Website__后台管理系统 </font></b></font></p>
        <p>&nbsp; </p>
      </div>
      <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;在这里，你可以定义站点的众多属性及管理产品、图文、人才、留言等等所有信息。<br>
        <br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请选择页面左边相应的管理选项，然后在右边进行具体管理操作。</p>
      <p>&nbsp;</p>  </tr>
</table>
 <table width="83%" border="0" align="center" cellpadding="0" cellspacing="1" class="new">
  <tr >
    <td width="618" height="25" class="unnamed1"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;服务器类型：<font face="Verdana"><%=Request.ServerVariables("OS")%> （IP：</font><%=Request.ServerVariables("LOCAL_ADDR")%>）&nbsp;        </td>
  </tr>
  <tr >
    <td height="25" > &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;返回服务器的主机名、DNS别名或IP地址：<%=Request.ServerVariables("SERVER_NAME")%>&nbsp;        </td>
  </tr>
  <tr >
    <td height="25"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;脚本解释引擎：<%=ScriptEngine & "/"& ScriptEngineMajorVersion &"."&ScriptEngineMinorVersion&"."& ScriptEngineBuildVersion %>&nbsp;        </td>
  </tr>
  <tr >
    <td height="25" > &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;脚本超时时间：<%=Server.ScriptTimeout%> 秒&nbsp;        </td>
  </tr>
  <tr >
    <td height="25" > &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;服务器端口：<%=Request.ServerVariables("SERVER_PORT")%>&nbsp;        </td>
  </tr>
  <tr >
    <td height="25" > &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;站点物理路径：<%=server.mappath(Request.ServerVariables("SCRIPT_NAME"))%>&nbsp; </td>
  </tr>
  <tr >
    <td height="25"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;服务器IIS版本：<%=Request.ServerVariables("SERVER_SOFTWARE")%>&nbsp; </td>
  </tr>
  <tr >
    <td height="25" > &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;服务器CPU个数：<%=Request.ServerVariables("NUMBER_OF_PROCESSORS")%> 个&nbsp;        </td>
  </tr>
  <tr>
    <td height="25" > &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;服务器时间：<%=now%>&nbsp;    </td>
  </tr>
</table>
</body>
</html>
