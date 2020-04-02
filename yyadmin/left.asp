<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台管理菜单</title>
<link href="css.css" rel="stylesheet" type="text/css">
<style type="text/css">
body{ background-color:#799ae1;}
*,IFRAME,div{margin:0;padding:0;list-style-type:none; text-align:left;}
a,img{border:0;}
.vcon{margin:0;padding:0; height:auto; line-height:0px;}

/*收缩菜单*/
.v{float:right;width:14px;height:14px;overflow:hidden;background:url(images/vicon.png) no-repeat;display:inline-block;}
.v01{background-position:0 0;}
.v02{background-position:0 -16px;;}
.vtitle{height:25px;line-height:25px;margin-top:2px; margin-bottom:2px; padding-left:12px;font-size:12px;color:#215dc6; font-weight:bold; cursor:pointer;background:url(images/title_bg_show.gif) no-repeat;text-decoration: none }

</style>
<script src="js/jquery.min.js"></script>
<script>
$(function(){
	//菜单隐藏展开
	var tabs_i=0
	$('.vtitle').click(function(){
		var _self = $(this);
		var j = $('.vtitle').index(_self);
		if( tabs_i == j ) return false; tabs_i = j;
		$('.vtitle em').each(function(e){
			if(e==tabs_i){
				$('em',_self).removeClass('v01').addClass('v02');
			}else{
				$(this).removeClass('v02').addClass('v01');
			}
		});
		$('.vcon').slideUp().eq(tabs_i).slideDown();
	});
})
</script>

</head>
<body bgcolor="#799ae1" >

<div style="width:158px;margin:10px auto 0 auto;">

	<div><img src="images/title.gif" width="158" height="38"></div>
	<div><a href="exit.asp" target="_top"><img src="images/title_exit.jpg" width="158" height="25"></a></div>
	
	<div class="vtitle">站点全局管理</div>
		<div class="vcon">
		<iframe src="define/site_manage.asp" id="leftFrame" name="leftFrame" MARGINHEIGHT="0" MARGINWIDTH="0" FRAMEBORDER="0"  WIDTH="100%" HEIGHT="50" SCROLLING="auto" align="default"></iframe>
	</div>
	
	<div class="vtitle">内容管理</div>
		<div class="vcon" style="display: none; overflow:hidden">
		<IFRAME src="columns/nav.asp" id="leftFrame" MARGINHEIGHT="0" MARGINWIDTH="0" FRAMEBORDER="0" HEIGHT="120" WIDTH="100%" SCROLLING="auto" align="default"></iframe>
	</div>
	
	<div class="vtitle">新闻管理</div>
		<div class="vcon" style="display: none; overflow:hidden">
		<IFRAME src="news/news_manage.asp" id="leftFrame" MARGINHEIGHT="0" MARGINWIDTH="0" FRAMEBORDER="0" HEIGHT="150" WIDTH="100%" SCROLLING="auto" align="default"></iframe>
	</div>
	
	<div class="vtitle">图片管理</div>
		<div class="vcon" style="display: none; overflow:hidden">
		<IFRAME src="products/pro_manage.asp" id="leftFrame" MARGINHEIGHT="0" MARGINWIDTH="0" FRAMEBORDER="0" HEIGHT="150" WIDTH="100%" SCROLLING="auto" align="default"></iframe>
	</div>
    
   
	<div class="vtitle">系统后台管理</div>
		<div class="vcon" style="display: none; overflow:hidden">
		<IFRAME src="system/system_manage.asp" id="leftFrame" MARGINHEIGHT="0" MARGINWIDTH="0" FRAMEBORDER="0" HEIGHT="150" WIDTH="100%" SCROLLING="auto" align="default"></iframe>
	</div>

</div>
</body>
</html>
