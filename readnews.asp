﻿<!--#include file="conn.asp" -->
<% 
'/*前页信息
id=request("id")
'/*
set rs2=server.createobject("adodb.recordset")
sql="select * from news where id="&id
rs2.open sql,conn,1,3
rs2("hot_count")=rs2("hot_count")+1
rs2.update
%>
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
.content .title{ font-size:22px; font-weight:bold; text-align:center; padding:10px 0px; line-height:40px;}
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
<div><a href="http://cyds.jxwcpt.com/index.html">首页</a> >> 【资料下载】</div>
</div>
<div class="main">
<div class="content">
<div class="clear"></div>
<div class="title">【资料下载】第三届江西省文化创意大赛</div>
<div class="info" style="line-height:50px;">阅读次数：<%=rs2("hot_count") %> &nbsp;&nbsp;&nbsp;&nbsp; <a href="javascript:history.back(-1);">【 返回 】</a></div>

<p>江西省VR AR创新团队十佳申报表&nbsp;点击下载&gt;&gt; &nbsp;<a href="http://cyds.jxwcpt.com/attachment/江西省VR AR创新团队十佳申报表.docx" target="_blank">【资料下载】</a></p>

<p>江西省成长性文旅企业十强申报表&nbsp;点击下载&gt;&gt; &nbsp;<a href="http://cyds.jxwcpt.com/attachment/江西省成长性文旅企业十强申报表.docx" target="_blank">【资料下载】</a></p>

<p>江西省文旅融合示范项目十佳申报表&nbsp;点击下载&gt;&gt; &nbsp;<a href="http://cyds.jxwcpt.com/attachment/江西省文旅融合示范项目十佳申报表.docx" target="_blank">【资料下载】</a></p>

<p>江西省影响力文旅企业十强申报表&nbsp;点击下载&gt;&gt; &nbsp;<a href="http://cyds.jxwcpt.com/attachment/江西省影响力文旅企业十强申报表.docx" target="_blank">【资料下载】</a></p>


<div id="footer">
<div class="f_sm">版权所有：江西省中融文化产业发展有限公司 &nbsp; 联系人：肖艳15179195761 &nbsp; 联系电话：0791-86896837 &nbsp; 邮箱：3215319040@qq.com </div>
</div>
</body>
</html>