
//检测表单
function Checkform()
{
  if (document.form1.system_name.value == "")
  {
   alert("请您填写登陆帐户！ \n");
   document.form1.system_name.focus();
   return false;
  }
  if (document.form1.system_password.value == "")
  {
   alert("请您填写登陆密码！ \n");
   document.form1.system_password.focus();
   return false;
  }
  if (document.form1.system_password.value != document.form1.system_password2.value)
  {
   alert("登陆密码和密码确认不一致！ \n");
   document.form1.system_password2.focus();
   return false;
  }
  return true;
}