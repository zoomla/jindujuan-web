function showndv(id,ob_char)
{
  var ndvshow=document.all.item(id);
  if (ndvshow.style.display=="block") {
     ndvshow.style.display="none";
  }
  else {
     ndvshow.style.display="block";
  }
}

function look_img(id)
{
//showModalDialog(id, "", "dialogWidth:35em; dialogHeight:35em; status:0;help:0");
window.open(id,"","height=480,width=650,status=no,menubar=no,toolbar=no,scrollbars=yes,location=no");
}

//检测表单
function Checkform()
{
  if (document.form1.pro_name.value == "")
  {
   alert("产品名称不能为空！ \n如果没有参数请填入字符'-',谢谢！ \n");
   document.form1.pro_name.focus();
   return false;
  }
  return true;
}

//all_select()
var checkflag = "false";
function check(field) {
if (checkflag == "false") {
for (i = 0; i < field.length; i++) {
field[i].checked = true;}
checkflag = "true";
 }
else {
for (i = 0; i < field.length; i++) {
field[i].checked = false; }
checkflag = "false";
 }
}