//检测表单
function Checkform()
{
  if (document.form1.web_title.value == "")
  {
   alert("请您填写网页标题！ \n");
   document.form1.web_title.focus();
   return false;
  }
  if (document.form1.contact_email.value == "")
  {
   alert("请您填写接受联系我们EMAIL！ \n");
   document.form1.contact_email.focus();
   return false;
  }
  if (document.form1.bulletin_content.value == "" && document.form1.bulletin_mode.checked)
  {
   alert("您选择了公告模式，请填写公告内容！ \n");
   document.form1.bulletin_content.focus();
   return false;
  }
  if (document.form1.search_key.value == "")
  {
   alert("请您填写搜索关键字，以便您的网站能更好的在各搜索引擎中搜索到！ \n");
   document.form1.search_key.focus();
   return false;
  }
  if (document.form1.web_foot.value == "")
  {
   alert("请您填写网页页脚描述！ \n");
   document.form1.web_foot.focus();
   return false;
  }
  return true;
}