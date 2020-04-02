$(document).ready(function(){
	
	$('.menu_spage').click(menu_spage);
	$('.menu_load').click(menu_load);
	
//	resizeDiv();
	/*$('#left').hover(show_left,function(){
		var dw = document.body.clientWidth; 
		console.log(dw); 
		if(dw<1260){
			hide_left();
		}
	});*/
	$('body').attr('style',"background:url(images/home_bg.jpg) top center no-repeat;background-size:cover;");
	check_loginfo();
	resize_left();
	nav_hover();
	$('#btn_contact').click(contact);
	$('#btn_guide').click(guide);
});


function guide(){
	 html = "<div id=\"xqy\">" +
		"<div class=\"xq_bt\"><div class=\"xqbt_cu\">报名方式</div>" +
		"</div>" +
		"<div class=\"xq_zt\"><div align=\"center\" class=\"xz_pic guide\">";
	html ="<div class=\"xq_text\" style=\"text-indent:0em;font-size:16px;\">1、自主报名：符合评选范围的文旅企业、团队可登陆http://cyds.jxwcpt.com/index.html下载报名表格和资料，并按要求提供相关资料；也可将纸质申报材料邮寄至活动委会直接报名.<br/>
	2、推荐报名<br/>
	主管部门推荐：各设区市文化产业主管单位收集、汇总本辖区内符合条件的文化企业，向组委会推荐。<br/>
	合作机构推荐：协会、银行、资本、证券等机构均可推荐优秀企业参评。<br/>
	合作媒体推荐：媒体推荐优秀企业(项目、团队)参评。<br/><br/>
	资料提交方式<br/>
	无论是自主报名和推荐报名，均需按要求提供电子版和纸质版两种类型的资料。<br/>
	纸质版申报材料（一式三份），邮寄至活动组委会办公地址：南昌市豫章路1号豫章壹号文化科技园（新九楼3F）江西省文化企业协会，邮编330006<br/>
	电子版申报材料发送电子邮箱：3215319040@qq.com<br/>
	联系人：肖 艳15179195761 0791-86896837<br/><br/>
	报名截止时间（拟定）：2020年5月08日<br/>
纸质申报材料邮寄地址：南昌市东湖区豫章路 1 号豫章壹号文化科技园（新九楼3F）江西省文化产业协会，邮编 330006<br/>
电子版申报材料发送电子邮箱：3215319040@qq.com<br/>
联系电话：0791-86896837<br/>
联系人：肖艳 15179195761<br/>
				"</div></div></div>";
	$('#pop_content').html(html);
	$('#pop_content').modal();
}
/**
 * 联系方式
 */
function contact(){
	 html = "<div id=\"xqy\">" +
		"<div class=\"xq_bt\"><div class=\"xqbt_cu\">联系方式</div>" +
		"</div>" +
		"<div class=\"xq_zt\"><div align=\"center\" class=\"xz_pic\">";
	html +="<div class=\"xq_text\" style=\"text-indent:0em;font-size:16px;\"><strong>组委会办公室：南昌市豫章路1号豫章壹号文化科技园（新九楼3F）江西省文化企业协会</strong><br/>邮编：330006<br/>" +
				"联系人： 肖 艳 15179195761 0791-86896837<br/>电子邮箱：3215319040@qq.com<br/>" +
			
				"在线客服：<a target=\"_blank\" href=\"http://wpa.qq.com/msgrd?v=3&uin=3215319040&site=qq&menu=yes\"><img border=\"0\" src=\"http://wpa.qq.com/pa?p=2:3215319040:51\" alt=\"点击这里给我发消息\" title=\"点击这里给我发消息\"/></a>"+
				"</div></div></div>";
	$('#pop_content').html(html);
	$('#pop_content').modal();
}

/**
 * 鼠标移入
 */
function nav_hover(){
	$('div.nav a').hover(function(){//on
		var na = $(this).attr('val');
		img = $(this).children('img');		
		img.attr('src','/images/nav_'+na+'_hover.png');
		
	},function(){//out
		var na = $(this).attr('val');
		img = $(this).children('img');
		img.attr('src','/images/nav_'+na+'.png');
	});
}

/**
 * 加载登录信息
 */
function check_loginfo(){
	
	$.post("/user.php?op=loginfo", '',function(data){
		$('#loginfo').html(data.data);
		translateBody();
	},'json');
	
}

window.onresize = resizeDiv;
function resizeDiv()
{
	var dw = document.documentElement.clientWidth; 
	var dh =document.documentElement.clientHeight;
	if(dw<=0){
		var dw = document.body.clientWidth;
	}
	if(dh<=0){ 
		var dh =document.body.clientHeight;
	}
	l_h = $('#left').height();
	mg_top_right = dh*0.1;
	h_box = dh*0.5;
	if(h_box<=300){
		h_box = 300;
	}
	
	pct_ot_menu = 76/270;
	pct_left =  273/954;
	l_width = l_h*pct_left;
	menu_w = l_width+ l_width*pct_ot_menu;
	right_w = dw-menu_w;
	
	$('#right').css({'top':mg_top_right,'left':menu_w+20});
	h_trans = h_box +80;
	$('#content_scroll_box').css({'height':h_box});
	$('.tansparent').css({'height':h_trans});
	resize_left();
}

function resize_left()
{
	var dw = document.documentElement.clientWidth; 
	var dh =document.documentElement.clientHeight;
	if(dw<=0){
		var dw = document.body.clientWidth;
	}
	if(dh<=0){ 
		var dh =document.body.clientHeight;
	}
	pct_ot_menu = 76/270;
	pct_left =  273/954;
		l_h = $('#left').height();		
		if(l_h>dh){//缩小窗口操作
			l_width = l_h*pct_left;
			menu_w = l_width+ l_width*pct_ot_menu;
			
			$('#left').css({'height':dh,'width':l_width});
			$('#left .nav_wrap').css({'width':menu_w});
			// foot_font_size = l_width*0.04;
			// $('.footer').css({'fontSize':foot_font_size});
		}else{//放大窗口操作
			l_width = l_h*pct_left;
			menu_w = l_width+ l_width*pct_ot_menu;
			if(l_width>273){
				l_width =273;
			}
			if(menu_w>358){
				menu_w = 358;
			}
			$('#left').css({'height':dh,'width':l_width});
			$('#left .nav_wrap').css({'width':menu_w});
		}		
}

function show_left(){
	$("#left").css({'left':0});
}

function hide_left(){
	$("#left").css({'left':-272});
	$("#right").css({'left':10});
	$("div.main").css({'left':30});
}


//请求数据列表
function menu_load(){
	var t = $(this).attr('val');
//	t=pngwei/dongtai/zuopin
}

//菜单，单页内容
function menu_spage(){
	var t = $(this).attr('val');
	var call_back = $(this).attr('callback');
	$(this).blur();
	$('body').removeAttr('style');
	
	$('#right').addClass('animated bounceInRight');
	$('#right').load('/'+t+'.htm',function(){
		var box = $('#content_scroll_box');
		if(typeof(box)!='undefined' && box){
			var dh = document.body.clientHeight;
			top_right=  dh*0.1;
			h_box = dh*0.65;
			h_trans = h_box+80
			$('#right').css({'top':top_right});
			$('#content_scroll_box').css({'height':h_box});
			$('.tansparent').css({'height':h_trans});
			$("#content_scroll_box").mCustomScrollbar({
				scrollButtons:{
					enable:true
				}
			});
		}
		if(typeof(call_back)!='undefined'){
			call_back = eval(call_back+"");
			call_back();
		}
		translateBody();
	});
//		resizeDiv();
	setTimeout(removeClass, 1000);
	
}

function removeClass(){
	$('#right').removeClass('bounceInRight');
}


function is_empty(str){
	if(typeof(str)=='undefined' || str=="" || str==null || str.length<=0 ){
		return true;
	}
	return false;
}