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