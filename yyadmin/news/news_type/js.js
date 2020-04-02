//检测表单
function Checkform()
{
  if (document.form1.typename.value == "")
  {
   alert("栏目名称不能为空！ \n");
   document.form1.typename.focus();
   return false;
  }
  return true;
}