//检测表单
function Checkform()
{
 if (document.form1.news_title.value == "")
  {
   alert("请填写新闻标题！ \n");
   document.form1.news_title.focus();
   return false;
  }
  return true;
}
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