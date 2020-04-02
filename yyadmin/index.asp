<HTML>
<HEAD><TITLE>网站后台管理系统</TITLE>
<% session("checkadmin")=false %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<STYLE language=javascript>BODY {
	BACKGROUND-POSITION: 50% top; BACKGROUND-IMAGE: url(images/bg_white.gif); BACKGROUND-REPEAT: repeat-x
}
</STYLE>
 <script language="JavaScript">
							  <!--
							  function checklogin()
							  {
								   if (document.form1.system_name.value == "")
								   {
									   alert("用户名不能为空！\n");
									   document.form1.system_name.focus();
									   return false;
									}
								   if (document.form1.system_password.value == "")
								   {
									   alert("密码不能为空！\n");
									   document.form1.system_password.focus();
									   return false;
									}
							
									return true;
							  }
							  //-->
							  </script>
<META content="MSHTML 6.00.2900.2838" name=GENERATOR>
<link href="css.css" rel="stylesheet" type="text/css">
</HEAD>
<BODY bgColor=#2250b8 leftMargin=0 topMargin=0>
<TABLE cellSpacing=0 cellPadding=0 width=530 align=center border=0>
  <TBODY>
  <TR>
    <TD height=190 align="center" valign="bottom">&nbsp;</TD>
  </TR>
  <TR>
    <TD vAlign=top background="images/bg_login.jpg" 
      height=220><TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR>
          <TD colSpan=2 height=105></TD></TR>
        <TR>
          <TD width=261></TD>
          <TD><FORM action="chklogin.asp" method="post" name="form1" id="form1" onSubmit="return checklogin();">
            <TABLE cellSpacing=0 cellPadding=0 width=240 border=0>
              <TBODY>
              <TR>
                <TD>
                  <TABLE width="97%" border=0 align="center" cellPadding=1 cellSpacing=0>
                    <TBODY>
                    <TR>
                      <TD width=110><IMG 
                        src="images/bul_03.gif"> 用户名：</TD>
                      <TD style="PADDING-LEFT: 5px"><INPUT type="text" maxLength=30 size=15 class="Member_input" name="system_name" id="system_name"></TD></TR>
                    <TR>
                      <TD><IMG src="images/bul_03.gif"> 
密 码：</TD>
                      <TD style="PADDING-LEFT: 5px"><INPUT type=password  name="system_password" id="system_password" maxLength=30 size=15 class="Member_input"></TD></TR></TBODY></TABLE></TD>
                <TD style="PADDING-LEFT: 5px"><INPUT 
                        type=image src="images/btn_login.gif" name=imageField align=absMiddle 
                  border=0></TD></TR></TBODY></TABLE></FORM>
            <TABLE cellSpacing=0 cellPadding=0 width=230 border=0>
              <TBODY>
              <TR>
                <TD height=10></TD></TR>
              <TR>
                <TD align=right></TD>
              </TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR>
  <TR>
    <TD align=center style="font-size:14px; color:#FFFFFF; padding:12px; line-height:22px; letter-spacing:1px;"></TD>
  </TR></TBODY></TABLE></BODY></HTML>
