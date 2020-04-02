//检测表单
function show(tips,flag,url){
var my_tips=document.all.mytips;
if(flag){
my_tips.style.display="";
if (url!=null){my_tips.innerHTML="<img src='"+url+"'align=left>"+tips;}
else{ my_tips.innerHTML=tips;}
my_tips.style.left=event.clientX+10;
my_tips.style.top=event.clientY+10;
}
else 
{
my_tips.style.display="none";
}
}

function popnews(id)
{
var win=window.open(id,'newtxt','top=20,left=50,width=518,height=500,scrollbars=yes,resizable=no');
win.focus();
 }
 function popcp(id)
{
var win=window.open(id,'cp','top=20,left=50,width=518,height=600,scrollbars=yes,resizable=no');
win.focus();
 }
function popdc(id)
{
window.open(id,"","height=300,width=700,status=no,menubar=no,toolbar=no,scrollbars=yes,location=no");
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