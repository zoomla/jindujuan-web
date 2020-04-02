//检测表单
function Checkform()
{
  if (document.form1.typename.value == "")
  {
   alert("产品类型的名称不能为空！ \n");
   document.form1.typename.focus();
   return false;
  }
  if (document.form1.cp_hs.value == "")
  {
   alert("请填写该类型的产品每页显示的行数！ \n");
   document.form1.cp_hs.focus();
   return false;
  }
  if (document.form1.cp_ls.value == "")
  {
   alert("请填写该类型的产品每页每行显示的个数！ \n");
   document.form1.cp_ls.focus();
   return false;
  }
  if (document.form1.taxis.value == "")
  {
   alert("请填写排列次序，以便类型进行排序！ \n");
   document.form1.taxis.focus();
   return false;
  }
  //document.form1.filename.value=upfilemess.document.formup.upfilename.value;
  return true;
}
function look_img(id)
{
//showModalDialog(id, "", "dialogWidth:35em; dialogHeight:35em; status:0;help:0");
window.open(id,"","height=480,width=650,status=no,menubar=no,toolbar=no,scrollbars=yes,location=no");
}