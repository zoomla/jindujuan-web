<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>江西省文化创意大赛</title>
<meta name="keywords" content="江西省文化创意大赛" />
<meta name="description" content="江西省文化创意大赛" />
<link href="/css/style2.css" rel="stylesheet" type="text/css" />
<script src="/script/jquery-1.8.3.min.js" type="text/javascript"></script>
</head>
<body>
<div id="head"></div>
<style>
.clear{ clear:both; width:0px; height:0px; }
.main{ background-color:#FFF; padding:20px; width:1200px; margin:10px auto 20px auto; }
.list{ width:1200px; margin:0 auto; background-color:#FFF; min-height:400px;}
.list ul li{ height:30px; line-height:28px; width:100%;}
.list ul li a{  font-size:16px; float:left; width:860px; }
.list ul li a:hover{ text-decoration:underline; }
.list ul li label{ width:130px; float:right; }
.content{ font-size:12px; min-height:600px; }
.content .title{ font-size:22px; font-weight:bold; text-align:center; padding:20px 0px; line-height:40px;}
.content .info{ text-align:right; }
.content .cont{ font-size:14px; line-height:24px; }
.content .cont .intro{ font-size:12px; border:solid 1px #B48781; padding:10px; margin-bottom:10px;  }
.content .cont p{ text-indent:2em; }
.content .cont img{ max-width:100%; }
.nrwz{ font-weight:bold; }
.pages{ clear:both; height:60px; padding-top:20px; line-height:22px; }
.pages a{ border:solid 1px #E2E2E2; padding:4px; margin:2px; display:block; float:left; text-align:center; font-size:14px;
    width:18px; height:18px; }
.pages a:hover{ background-color:#F4A548; color:#FFF; }
.pages b{ padding:4px; margin:2px; background-color:#F4A548; display:block; text-align:center; float:left; color:#FFF; width:20px; height:20px; }
.pages input{ height:21px; margin-top:2px;}
.search-result dl dt{ font-size:14px; }
.piao{ font-size:20px; line-height:36px; padding:0px; margin:0px; text-align:right; color:#6C7AAB; }
.piao span{ color:#BE3432; }
.bar{ background-color:#3524c3; width:100%; margin:14px auto; height:40px; border-radius:5px; }
.bar div{ width:20%; float:left; margin-right:1%; color:#FFF; text-align:center; height:40px;line-height:40px;  }
.bar div a{ color:#FFF; font-weight:bold; font-size:16px; }
p.tip{ font-weight:thin; float:right; font-size:12px; }
</style>
<div class="Box bar">
<div><a href="http://cyds.jxwcpt.com/index.html">首页</a> >> 【联系我们】</div>
</div>
<!--联系我们-->
<li><b>联系方式</b></li>
<p>纸质申报材料邮寄地址：南昌市东湖区豫章路 1 号豫章壹号文化科技园（新九楼
3F）江西省文化产业协会，邮编 330006</p>
<p>电子版申报材料发送电子邮箱：3215319040@qq.com</p>
<p>联系电话：0791-86896837</p>
<p>联系人：肖艳 15179195761</p>
<!--引用百度地图API-->
<style type="text/css">
    html,body{margin:0;padding:0;}
    .iw_poi_title {color:#CC5522;font-size:14px;font-weight:bold;overflow:hidden;padding-right:13px;white-space:nowrap}
    .iw_poi_content {font:12px arial,sans-serif;overflow:visible;padding-top:4px;white-space:-moz-pre-wrap;word-wrap:break-word}
</style>
<script type="text/javascript" src="http://api.map.baidu.com/api?key=&v=1.1&services=true"></script>
  <!--百度地图容器-->
  <div style="width:697px;height:550px;border:#ccc solid 1px;" id="dituContent"></div>
<script type="text/javascript">
    //创建和初始化地图函数：
    function initMap(){
        createMap();//创建地图
        setMapEvent();//设置地图事件
        addMapControl();//向地图添加控件
        addMarker();//向地图中添加marker
    }
    
    //创建地图函数：
    function createMap(){
        var map = new BMap.Map("dituContent");//在百度地图容器中创建一个地图
        var point = new BMap.Point(115.896071,28.695008);//定义一个中心点坐标
        map.centerAndZoom(point,18);//设定地图的中心点和坐标并将地图显示在地图容器中
        window.map = map;//将map变量存储在全局
    }
    
    //地图事件设置函数：
    function setMapEvent(){
        map.enableDragging();//启用地图拖拽事件，默认启用(可不写)
        map.enableScrollWheelZoom();//启用地图滚轮放大缩小
        map.enableDoubleClickZoom();//启用鼠标双击放大，默认启用(可不写)
        map.enableKeyboard();//启用键盘上下左右键移动地图
    }
    
    //地图控件添加函数：
    function addMapControl(){
        //向地图中添加缩放控件
	var ctrl_nav = new BMap.NavigationControl({anchor:BMAP_ANCHOR_TOP_LEFT,type:BMAP_NAVIGATION_CONTROL_LARGE});
	map.addControl(ctrl_nav);
        //向地图中添加缩略图控件
	var ctrl_ove = new BMap.OverviewMapControl({anchor:BMAP_ANCHOR_BOTTOM_RIGHT,isOpen:1});
	map.addControl(ctrl_ove);
        //向地图中添加比例尺控件
	var ctrl_sca = new BMap.ScaleControl({anchor:BMAP_ANCHOR_BOTTOM_LEFT});
	map.addControl(ctrl_sca);
    }
    
    //标注点数组
    var markerArr = [{title:"报名地址",content:"豫章壹号文化科技园（新九楼3F）江西省文化产业协会",point:"115.896561|28.694754",isOpen:0,icon:{w:21,h:21,l:0,t:0,x:6,lb:5}}
		 ];
    //创建marker
    function addMarker(){
        for(var i=0;i<markerArr.length;i++){
            var json = markerArr[i];
            var p0 = json.point.split("|")[0];
            var p1 = json.point.split("|")[1];
            var point = new BMap.Point(p0,p1);
			var iconImg = createIcon(json.icon);
            var marker = new BMap.Marker(point,{icon:iconImg});
			var iw = createInfoWindow(i);
			var label = new BMap.Label(json.title,{"offset":new BMap.Size(json.icon.lb-json.icon.x+10,-20)});
			marker.setLabel(label);
            map.addOverlay(marker);
            label.setStyle({
                        borderColor:"#808080",
                        color:"#333",
                        cursor:"pointer"
            });
			
			(function(){
				var index = i;
				var _iw = createInfoWindow(i);
				var _marker = marker;
				_marker.addEventListener("click",function(){
				    this.openInfoWindow(_iw);
			    });
			    _iw.addEventListener("open",function(){
				    _marker.getLabel().hide();
			    })
			    _iw.addEventListener("close",function(){
				    _marker.getLabel().show();
			    })
				label.addEventListener("click",function(){
				    _marker.openInfoWindow(_iw);
			    })
				if(!!json.isOpen){
					label.hide();
					_marker.openInfoWindow(_iw);
				}
			})()
        }
    }
    //创建InfoWindow
    function createInfoWindow(i){
        var json = markerArr[i];
        var iw = new BMap.InfoWindow("<b class='iw_poi_title' title='" + json.title + "'>" + json.title + "</b><div class='iw_poi_content'>"+json.content+"</div>");
        return iw;
    }
    //创建一个Icon
    function createIcon(json){
        var icon = new BMap.Icon("http://app.baidu.com/map/images/us_mk_icon.png", new BMap.Size(json.w,json.h),{imageOffset: new BMap.Size(-json.l,-json.t),infoWindowOffset:new BMap.Size(json.lb+5,1),offset:new BMap.Size(json.x,json.h)})
        return icon;
    }
    
    initMap();//创建和初始化地图
</script>

<div id="footer">
<div class="f_sm">版权所有：江西省中融文化产业发展有限公司 &nbsp; 联系人：肖艳15179195761 &nbsp; 联系电话：0791-86896837 &nbsp; 邮箱：3215319040@qq.com </div>
</div>
</body>
</html>