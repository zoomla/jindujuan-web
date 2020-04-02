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
function switchSysBar(){
	if (switchPoint.innerText==3){
		switchPoint.innerText=4
		document.all("mnuList").style.display="none"
		top.content.cols="12,*"
	}
	else{
		switchPoint.innerText=3
		document.all("mnuList").style.display=""				
		top.content.cols="207,*"		
	}
}
//离开处理
//
function logout(){

if (!window.close())
{
//alert("dfdfdfdf")
//window.open("logout.asp","","")
} 
} 
