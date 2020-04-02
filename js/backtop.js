lastScrollY=0;
function heartBeat(){
var diffY;
if (document.documentElement && document.documentElement.scrollTop)
    diffY = document.documentElement.scrollTop;
else if (document.body)
    diffY = document.body.scrollTop
else
    {/*Netscape stuff*/}
percent=.1*(diffY-lastScrollY);
if(percent>0)percent=Math.ceil(percent);
else percent=Math.floor(percent);
document.getElementById("full").style.top=parseInt(document.getElementById("full").style.top)+percent+"px";
lastScrollY=lastScrollY+percent;
if(lastScrollY<200)
{
document.getElementById("full").style.display="none";
}
else
{
document.getElementById("full").style.display="block";
}
}
var gkuan=document.body.clientWidth;
var ks=(gkuan-1002)/2-30;
suspendcode="<div id=\"full\" style='right:"+ks+"px;POSITION:absolute;TOP:520px;z-index:100;width:22px;height:60px;cursor:pointer;padding-top:25px;text-align:center;font-size:12px; line-height:14px;color:#4f576c;'><a onclick='window.scrollTo(0,0);'><img src=js/backtop.gif /></a></div>"
document.write(suspendcode);
window.setInterval("heartBeat()",1);