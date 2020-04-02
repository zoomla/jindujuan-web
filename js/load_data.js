var NEWS_PAGE = 1;

/**
 * 加载新闻列表
 */
function news_list(){
	$.post("/news.asp", { op:'news_list',p:NEWS_PAGE},function(data){
		 if(data.status){
			 list = data.data;
			 var html = "";
			 for(i in list){
				 obj = list[i];
//				 var url = "/ajax_data.php?op=view&tid="+obj.tid+"&cid="+obj.cid;
				 html += "<div class=\"ssdta\"><a href=\"javascript:;\" class=\"article\" tid=\""+obj.tid+"\" cid=\""+obj.cid+"\">" +
					"<div class=\"ss_tit\">"+obj.title+"</div>" +
					"<div class=\"ss_pic\" align=\"center\"><img src=\""+obj.photo+"\" width=\"100%\" /></div>" +
					"<div class=\"ss_sm\">" +obj.intro+"</div>" +
					"<div class=\"ss_time\">"+obj.dateline+"</div></a></div>";
			 }
			 $('#news_list').append(html);
			 adjust_scroll('news_list');
			 NEWS_PAGE ++;
			 news_bind();
		 }else{
			 alert(data.info);
		 }
		translateBody();
	},'json');
	
}

/**
 * 绑定新加载的列表时间
 */
function news_bind(){
	
	$('#btn_list_more').click(news_list);
	$('a.article').click(news_content);
	
}

/**
 * 显示新闻详情
 */
function news_content(){
	var tid = $(this).attr('tid');
	var cid = $(this).attr('cid');
	if(!tid || !cid){
		alert('参数错误');
		return false;
	}
	$.post("/ajax_data.php", { op:'view',tid:tid,cid:cid},function(data){
		 if(data.status){
			 o = data.data;
			 html = "";
			 html += "<div id=\"xqy\">" +
			 		"<div class=\"xq_bt\"><div class=\"xqbt_cu\">"+o.title+"</div>" +
			 		"<div class=\"xq_from\">"+o.postdate+"&nbsp;&nbsp;来源："+o.fromsite+"| 作者："+o.author+"</div></div>" +
			 		"<div class=\"xq_zt\"><div align=\"center\" class=\"xz_pic\">";
			 		if(o.photo){
			 			//html += "<img width=\"60%\" src=\""+o.photo+"\"></div>";	
			 		}
			 		html +="<div class=\"xq_text\">"+o.content+"</div><div class=\"clear\"></div></div>" +
			 				"<div class=\"clear\"></div>" +
			 				"<div id=\"btn_zan\" tid=\""+o.tid+"\" class=\"btn_zan\"><p>"+o.zan+"</p>" +
			 						"<div class=\"zan_icon\"></div></div>" +
			 						"</div>";
			 		
			 $('#content_news').html(html);
			 $('#content_news').modal();
			 bind_zan();
		 }else{
			 alert(data.info);
		 }
		translateBody();
	},'json');
	
}

function bind_zan(){
	var can_zan = true;  
	$('#btn_zan').click(function(){
		var _self = $(this);
		var tid = _self.attr('tid');
		if(can_zan && tid){
			$.post("/ajax_data.php", { op:'zan',tid:tid},function(data){
				 if(data.status){
					 _self.find('p').html(data.data);
					 _self.find('div.zan_icon').addClass('zan');
				 }else{
				  alert(data.info);
				 }

				},'json');
			can_zan = false;
		}		
	});
}

/**
 * 设置适应滚动
 * @param id
 */
function adjust_scroll( id ){
	if(!id || id=='' || id==null){
		return ;
	}
	
	var box = $('#'+id);
	if(typeof(box)!='undefined' && box){
		var dh = document.body.clientHeight;
		top_right=  dh*0.1;
		h_box = dh*0.65;
		h_trans = h_box+80
		$('#right').css({'top':top_right});
		box.css({'height':h_box});
		$('.tansparent').css({'height':h_trans});
		box.mCustomScrollbar({
			scrollButtons:{
				enable:true
			}
		});
	}
}
