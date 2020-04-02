<% 
'/*权限判断
sub checkpower(power,mess)
    '/*检测通行证
    if int(session("power")) < int(power) then
	   response.write "<br><br><br><div align='center'>"&mess&"<div>"
	   response.end
	end if 
end sub
'/**

'/*后台的通行证判断
sub checkadmin(action_url)
    '/*检测通行证
    if session("checkadmin") <> true then
	   %>
	   <script language="javascript">
       <!--
          alert("您的管理权限不足！原因\n\n您的操作已经超时\n或者您是非法登陆!\n请您重新登陆以便获得相应的权限!\n")
	      action_url="<%=action_url %>"
	      eval("top"+".location='"+action_url+"'")
       //-->
      </script>
	   <%
	end if 
end sub
'/**

'/*比较输出结果
sub compare_mess(str1,str2,same,differ)
    if str1=str2 then
	   response.write same
	else
	   response.write differ
	end if
end sub
'/**

'/*错误定义
sub error(mess,url)
   %>
    <script language="javascript">
       <!--
          alert("<%=mess %>")
	      document.location="<%=url %>"
       //-->
      </script>
	  <%
end sub
'/**

'/*成功定义
sub succeed(mess,url)
   %>
    <script language="javascript">
       <!--
          alert("<%=mess %>")
	      document.location="<%=url %>"
       //-->
      </script>
	  <%
end sub
'/**

'/*字符转换函数
function Checkin(s) 
s=trim(s) 
's=replace(s," ","&amp;nbsp;") 
s=replace(s,"'","＇") 
s=replace(s,"""","＂") 
s=replace(s,"<","〈") 
s=replace(s,">","〉")
s=replace(s,"&","＆") 
Checkin=s 
end function 
'/**

'/*关闭指针集合的过程
sub close_rs(rs)
    rs=close
	set rs=nothing
end sub
'/**

'/*提取flash or 图片处理信息
function flash_img(torf,url_name,link_name,width,height)
        if torf="1" then'1是FALSH 
		%><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="<%=width %>" height="<%=height %>"><param name="movie" value="<%=url_name%>"><param name="quality" value="high"><embed src="<%=url_name%>" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="<%=width %>" height="<%=height %>"></embed></object><%
		else'2是图片
		%><a href="<%=link_name %>" target="_blank"><img src="<%=url_name%>" border="0"></a><%
		end if
end function
'/**

'/* 图片上传检测及处理
function up_image(file1,FilePath,filename,js_name)
         '//判断上传的是否图片类型
		 ContentType1=file1.ContentType
         if instr(ContentType1,"jpeg")>0 or instr(ContentType1,"gif")>0 then
            if instr(ContentType1,"jpeg")>0 then
	           ExtName1=".jpg" 
            end if
            if instr(ContentType1,"gif")>0 then 
	           ExtName1=".gif"
            end if
			js_name=right(year(now),1)&month(now)&day(now)&right(replace(timer,".",""),5)
            images_name=js_name&ExtName1
			'images_name=filename&ExtName1
			file1.SaveAs(FilePath&"\"&images_name)
			filename=images_name
			js_name=js_name
         else
            mess="您上传的不是图片类型！\n规定图片类型为 GIF 或者是 JPG 的格式 \n"
            goto_url="javascript:history.back();"
            call error(mess,goto_url)
            response.end
         end if
end function
'/**

'/* flash上传检测及处理
function up_flash(file1,FilePath,filename,js_name)
         '//判断上传的是否flash类型
		 ContentType1=file1.ContentType
         if instr(ContentType1,"flash")>0 then
	        ExtName1=".swf"
			js_name=right(year(now),1)&month(now)&day(now)&right(replace(timer,".",""),5)
            images_name=js_name&ExtName1
			'images_name=filename&ExtName1
			file1.SaveAs(FilePath&"\"&images_name)
			filename=images_name
			js_name=js_name
         else
            mess="您上传的不是Flash类型！\n规定Falsh类型为 swf 的格式 \n"
            goto_url="javascript:history.back();"
            call error(mess,goto_url)
            response.end
         end if
end function
'/**

'/*分页信息处理
function pages_action(cp_hs,cp_ls,rdpages,pages)
   page_size=cp_ls*cp_hs
   rs.pagesize=page_size
   rdpages=rs.pagecount
   if pages="" then
      pages=0
   end if
   if rs.eof=false then
      if pages=0 then
         pages=1
      end if
      rs.AbsolutePage=pages
    end if
	rdpages=rdpages
	pages=pages
end function

function CutStr(str,mun)   '取规定长度的字符串
	dim cl,ct,i
	cl=len(str)
	ct=0
	if cl>0 then
		for i=1 to cl
			cs=Asc(Mid(str,i,1))
			if cs<0 or cs>255 then
				ct=ct+2
			else 
				ct=ct+1
			end if
			if ct>mun*2 then
				CutStr=left(str,i-2)&"..."
				exit for
			else
				CutStr=str
			end if
		next
	end if
end function
'/===================================================================================
'//=====================================[ubb]========================================
'/===================================================================================
%>
<% Sub FontColor() %>
   <SELECT name="selectColour" onChange="FormatText('ForeColor',selectColour.options[selectColour.selectedIndex].value);document.form1.selectColour.options[0].selected = true;" onMouseOver="window.status='选择选定文字的颜色。';return true;" onMouseOut="window.status='';return true;">
       <option value=字体颜色 selected>字体颜色</option>
                <option 
        style="COLOR: #ff0000; BACKGROUND-COLOR: #ff0000" 
        value=#ff0000>#ff0000</option>
                <option 
        style="COLOR: #f0f8ff; BACKGROUND-COLOR: #f0f8ff" 
        value=#F0F8FF>#F0F8FF</option>
                <option 
        style="COLOR: #faebd7; BACKGROUND-COLOR: #faebd7" 
        value=#FAEBD7>#FAEBD7</option>
                <option 
        style="COLOR: #00ffff; BACKGROUND-COLOR: #00ffff" 
        value=#00FFFF>#00FFFF</option>
                <option 
        style="COLOR: #7fffd4; BACKGROUND-COLOR: #7fffd4" 
        value=#7FFFD4>#7FFFD4</option>
                <option 
        style="COLOR: #f0ffff; BACKGROUND-COLOR: #f0ffff" 
        value=#F0FFFF>#F0FFFF</option>
                <option 
        style="COLOR: #f5f5dc; BACKGROUND-COLOR: #f5f5dc" 
        value=#F5F5DC>#F5F5DC</option>
                <option 
        style="COLOR: #ffe4c4; BACKGROUND-COLOR: #ffe4c4" 
        value=#FFE4C4>#FFE4C4</option>
                <option 
        style="COLOR: #000000; BACKGROUND-COLOR: #000000" 
        value=#000000>#000000</option>
                <option 
        style="COLOR: #ffebcd; BACKGROUND-COLOR: #ffebcd" 
        value=#FFEBCD>#FFEBCD</option>
                <option 
        style="COLOR: #0000ff; BACKGROUND-COLOR: #0000ff" 
        value=#0000FF>#0000FF</option>
                <option 
        style="COLOR: #8a2be2; BACKGROUND-COLOR: #8a2be2" 
        value=#8A2BE2>#8A2BE2</option>
                <option 
        style="COLOR: #a52a2a; BACKGROUND-COLOR: #a52a2a" 
        value=#A52A2A>#A52A2A</option>
                <option 
        style="COLOR: #deb887; BACKGROUND-COLOR: #deb887" 
        value=#DEB887>#DEB887</option>
                <option 
        style="COLOR: #5f9ea0; BACKGROUND-COLOR: #5f9ea0" 
        value=#5F9EA0>#5F9EA0</option>
                <option 
        style="COLOR: #7fff00; BACKGROUND-COLOR: #7fff00" 
        value=#7FFF00>#7FFF00</option>
                <option 
        style="COLOR: #d2691e; BACKGROUND-COLOR: #d2691e" 
        value=#D2691E>#D2691E</option>
                <option 
        style="COLOR: #ff7f50; BACKGROUND-COLOR: #ff7f50" 
        value=#FF7F50>#FF7F50</option>
                <option 
        style="COLOR: #6495ed; BACKGROUND-COLOR: #6495ed" 
        value=#6495ED>#6495ED</option>
                <option 
        style="COLOR: #fff8dc; BACKGROUND-COLOR: #fff8dc" 
        value=#FFF8DC>#FFF8DC</option>
                <option 
        style="COLOR: #dc143c; BACKGROUND-COLOR: #dc143c" 
        value=#DC143C>#DC143C</option>
                <option 
        style="COLOR: #00ffff; BACKGROUND-COLOR: #00ffff" 
        value=#00FFFF>#00FFFF</option>
                <option 
        style="COLOR: #00008b; BACKGROUND-COLOR: #00008b" 
        value=#00008B>#00008B</option>
                <option 
        style="COLOR: #008b8b; BACKGROUND-COLOR: #008b8b" 
        value=#008B8B>#008B8B</option>
                <option 
        style="COLOR: #b8860b; BACKGROUND-COLOR: #b8860b" 
        value=#B8860B>#B8860B</option>
                <option 
        style="COLOR: #a9a9a9; BACKGROUND-COLOR: #a9a9a9" 
        value=#A9A9A9>#A9A9A9</option>
                <option 
        style="COLOR: #006400; BACKGROUND-COLOR: #006400" 
        value=#006400>#006400</option>
                <option 
        style="COLOR: #bdb76b; BACKGROUND-COLOR: #bdb76b" 
        value=#BDB76B>#BDB76B</option>
                <option 
        style="COLOR: #8b008b; BACKGROUND-COLOR: #8b008b" 
        value=#8B008B>#8B008B</option>
                <option 
        style="COLOR: #556b2f; BACKGROUND-COLOR: #556b2f" 
        value=#556B2F>#556B2F</option>
                <option 
        style="COLOR: #ff8c00; BACKGROUND-COLOR: #ff8c00" 
        value=#FF8C00>#FF8C00</option>
                <option 
        style="COLOR: #9932cc; BACKGROUND-COLOR: #9932cc" 
        value=#9932CC>#9932CC</option>
                <option 
        style="COLOR: #8b0000; BACKGROUND-COLOR: #8b0000" 
        value=#8B0000>#8B0000</option>
                <option 
        style="COLOR: #e9967a; BACKGROUND-COLOR: #e9967a" 
        value=#E9967A>#E9967A</option>
                <option 
        style="COLOR: #8fbc8f; BACKGROUND-COLOR: #8fbc8f" 
        value=#8FBC8F>#8FBC8F</option>
                <option 
        style="COLOR: #483d8b; BACKGROUND-COLOR: #483d8b" 
        value=#483D8B>#483D8B</option>
                <option 
        style="COLOR: #2f4f4f; BACKGROUND-COLOR: #2f4f4f" 
        value=#2F4F4F>#2F4F4F</option>
                <option 
        style="COLOR: #00ced1; BACKGROUND-COLOR: #00ced1" 
        value=#00CED1>#00CED1</option>
                <option 
        style="COLOR: #9400d3; BACKGROUND-COLOR: #9400d3" 
        value=#9400D3>#9400D3</option>
                <option 
        style="COLOR: #ff1493; BACKGROUND-COLOR: #ff1493" 
        value=#FF1493>#FF1493</option>
                <option 
        style="COLOR: #00bfff; BACKGROUND-COLOR: #00bfff" 
        value=#00BFFF>#00BFFF</option>
                <option 
        style="COLOR: #696969; BACKGROUND-COLOR: #696969" 
        value=#696969>#696969</option>
                <option 
        style="COLOR: #1e90ff; BACKGROUND-COLOR: #1e90ff" 
        value=#1E90FF>#1E90FF</option>
                <option 
        style="COLOR: #b22222; BACKGROUND-COLOR: #b22222" 
        value=#B22222>#B22222</option>
                <option 
        style="COLOR: #fffaf0; BACKGROUND-COLOR: #fffaf0" 
        value=#FFFAF0>#FFFAF0</option>
                <option 
        style="COLOR: #228b22; BACKGROUND-COLOR: #228b22" 
        value=#228B22>#228B22</option>
                <option 
        style="COLOR: #ff00ff; BACKGROUND-COLOR: #ff00ff" 
        value=#FF00FF>#FF00FF</option>
                <option 
        style="COLOR: #dcdcdc; BACKGROUND-COLOR: #dcdcdc" 
        value=#DCDCDC>#DCDCDC</option>
                <option 
        style="COLOR: #f8f8ff; BACKGROUND-COLOR: #f8f8ff" 
        value=#F8F8FF>#F8F8FF</option>
                <option 
        style="COLOR: #ffd700; BACKGROUND-COLOR: #ffd700" 
        value=#FFD700>#FFD700</option>
                <option 
        style="COLOR: #daa520; BACKGROUND-COLOR: #daa520" 
        value=#DAA520>#DAA520</option>
                <option 
        style="COLOR: #808080; BACKGROUND-COLOR: #808080" 
        value=#808080>#808080</option>
                <option 
        style="COLOR: #008000; BACKGROUND-COLOR: #008000" 
        value=#008000>#008000</option>
                <option 
        style="COLOR: #adff2f; BACKGROUND-COLOR: #adff2f" 
        value=#ADFF2F>#ADFF2F</option>
                <option 
        style="COLOR: #f0fff0; BACKGROUND-COLOR: #f0fff0" 
        value=#F0FFF0>#F0FFF0</option>
                <option 
        style="COLOR: #ff69b4; BACKGROUND-COLOR: #ff69b4" 
        value=#FF69B4>#FF69B4</option>
                <option 
        style="COLOR: #cd5c5c; BACKGROUND-COLOR: #cd5c5c" 
        value=#CD5C5C>#CD5C5C</option>
                <option 
        style="COLOR: #4b0082; BACKGROUND-COLOR: #4b0082" 
        value=#4B0082>#4B0082</option>
                <option 
        style="COLOR: #fffff0; BACKGROUND-COLOR: #fffff0" 
        value=#FFFFF0>#FFFFF0</option>
                <option 
        style="COLOR: #f0e68c; BACKGROUND-COLOR: #f0e68c" 
        value=#F0E68C>#F0E68C</option>
                <option 
        style="COLOR: #e6e6fa; BACKGROUND-COLOR: #e6e6fa" 
        value=#E6E6FA>#E6E6FA</option>
                <option 
        style="COLOR: #fff0f5; BACKGROUND-COLOR: #fff0f5" 
        value=#FFF0F5>#FFF0F5</option>
                <option 
        style="COLOR: #7cfc00; BACKGROUND-COLOR: #7cfc00" 
        value=#7CFC00>#7CFC00</option>
                <option 
        style="COLOR: #fffacd; BACKGROUND-COLOR: #fffacd" 
        value=#FFFACD>#FFFACD</option>
                <option 
        style="COLOR: #add8e6; BACKGROUND-COLOR: #add8e6" 
        value=#ADD8E6>#ADD8E6</option>
                <option 
        style="COLOR: #f08080; BACKGROUND-COLOR: #f08080" 
        value=#F08080>#F08080</option>
                <option 
        style="COLOR: #e0ffff; BACKGROUND-COLOR: #e0ffff" 
        value=#E0FFFF>#E0FFFF</option>
                <option 
        style="COLOR: #fafad2; BACKGROUND-COLOR: #fafad2" 
        value=#FAFAD2>#FAFAD2</option>
                <option 
        style="COLOR: #90ee90; BACKGROUND-COLOR: #90ee90" 
        value=#90EE90>#90EE90</option>
                <option 
        style="COLOR: #d3d3d3; BACKGROUND-COLOR: #d3d3d3" 
        value=#D3D3D3>#D3D3D3</option>
                <option 
        style="COLOR: #ffb6c1; BACKGROUND-COLOR: #ffb6c1" 
        value=#FFB6C1>#FFB6C1</option>
                <option 
        style="COLOR: #ffa07a; BACKGROUND-COLOR: #ffa07a" 
        value=#FFA07A>#FFA07A</option>
                <option 
        style="COLOR: #20b2aa; BACKGROUND-COLOR: #20b2aa" 
        value=#20B2AA>#20B2AA</option>
                <option 
        style="COLOR: #87cefa; BACKGROUND-COLOR: #87cefa" 
        value=#87CEFA>#87CEFA</option>
                <option 
        style="COLOR: #778899; BACKGROUND-COLOR: #778899" 
        value=#778899>#778899</option>
                <option 
        style="COLOR: #b0c4de; BACKGROUND-COLOR: #b0c4de" 
        value=#B0C4DE>#B0C4DE</option>
                <option 
        style="COLOR: #ffffe0; BACKGROUND-COLOR: #ffffe0" 
        value=#FFFFE0>#FFFFE0</option>
                <option 
        style="COLOR: #00ff00; BACKGROUND-COLOR: #00ff00" 
        value=#00FF00>#00FF00</option>
                <option 
        style="COLOR: #32cd32; BACKGROUND-COLOR: #32cd32" 
        value=#32CD32>#32CD32</option>
                <option 
        style="COLOR: #faf0e6; BACKGROUND-COLOR: #faf0e6" 
        value=#FAF0E6>#FAF0E6</option>
                <option 
        style="COLOR: #ff00ff; BACKGROUND-COLOR: #ff00ff" 
        value=#FF00FF>#FF00FF</option>
                <option 
        style="COLOR: #800000; BACKGROUND-COLOR: #800000" 
        value=#800000>#800000</option>
                <option 
        style="COLOR: #66cdaa; BACKGROUND-COLOR: #66cdaa" 
        value=#66CDAA>#66CDAA</option>
                <option 
        style="COLOR: #0000cd; BACKGROUND-COLOR: #0000cd" 
        value=#0000CD>#0000CD</option>
                <option 
        style="COLOR: #ba55d3; BACKGROUND-COLOR: #ba55d3" 
        value=#BA55D3>#BA55D3</option>
                <option 
        style="COLOR: #9370db; BACKGROUND-COLOR: #9370db" 
        value=#9370DB>#9370DB</option>
                <option 
        style="COLOR: #3cb371; BACKGROUND-COLOR: #3cb371" 
        value=#3CB371>#3CB371</option>
                <option 
        style="COLOR: #7b68ee; BACKGROUND-COLOR: #7b68ee" 
        value=#7B68EE>#7B68EE</option>
                <option 
        style="COLOR: #00fa9a; BACKGROUND-COLOR: #00fa9a" 
        value=#00FA9A>#00FA9A</option>
                <option 
        style="COLOR: #48d1cc; BACKGROUND-COLOR: #48d1cc" 
        value=#48D1CC>#48D1CC</option>
                <option 
        style="COLOR: #c71585; BACKGROUND-COLOR: #c71585" 
        value=#C71585>#C71585</option>
                <option 
        style="COLOR: #191970; BACKGROUND-COLOR: #191970" 
        value=#191970>#191970</option>
                <option 
        style="COLOR: #f5fffa; BACKGROUND-COLOR: #f5fffa" 
        value=#F5FFFA>#F5FFFA</option>
                <option 
        style="COLOR: #ffe4e1; BACKGROUND-COLOR: #ffe4e1" 
        value=#FFE4E1>#FFE4E1</option>
                <option 
        style="COLOR: #ffe4b5; BACKGROUND-COLOR: #ffe4b5" 
        value=#FFE4B5>#FFE4B5</option>
                <option 
        style="COLOR: #ffdead; BACKGROUND-COLOR: #ffdead" 
        value=#FFDEAD>#FFDEAD</option>
                <option 
        style="COLOR: #000080; BACKGROUND-COLOR: #000080" 
        value=#000080>#000080</option>
                <option 
        style="COLOR: #fdf5e6; BACKGROUND-COLOR: #fdf5e6" 
        value=#FDF5E6>#FDF5E6</option>
                <option 
        style="COLOR: #808000; BACKGROUND-COLOR: #808000" 
        value=#808000>#808000</option>
                <option 
        style="COLOR: #6b8e23; BACKGROUND-COLOR: #6b8e23" 
        value=#6B8E23>#6B8E23</option>
                <option 
        style="COLOR: #ffa500; BACKGROUND-COLOR: #ffa500" 
        value=#FFA500>#FFA500</option>
                <option 
        style="COLOR: #ff4500; BACKGROUND-COLOR: #ff4500" 
        value=#FF4500>#FF4500</option>
                <option 
        style="COLOR: #da70d6; BACKGROUND-COLOR: #da70d6" 
        value=#DA70D6>#DA70D6</option>
                <option 
        style="COLOR: #eee8aa; BACKGROUND-COLOR: #eee8aa" 
        value=#EEE8AA>#EEE8AA</option>
                <option 
        style="COLOR: #98fb98; BACKGROUND-COLOR: #98fb98" 
        value=#98FB98>#98FB98</option>
                <option 
        style="COLOR: #afeeee; BACKGROUND-COLOR: #afeeee" 
        value=#AFEEEE>#AFEEEE</option>
                <option 
        style="COLOR: #db7093; BACKGROUND-COLOR: #db7093" 
        value=#DB7093>#DB7093</option>
                <option 
        style="COLOR: #ffefd5; BACKGROUND-COLOR: #ffefd5" 
        value=#FFEFD5>#FFEFD5</option>
                <option 
        style="COLOR: #ffdab9; BACKGROUND-COLOR: #ffdab9" 
        value=#FFDAB9>#FFDAB9</option>
                <option 
        style="COLOR: #cd853f; BACKGROUND-COLOR: #cd853f" 
        value=#CD853F>#CD853F</option>
                <option 
        style="COLOR: #ffc0cb; BACKGROUND-COLOR: #ffc0cb" 
        value=#FFC0CB>#FFC0CB</option>
                <option 
        style="COLOR: #dda0dd; BACKGROUND-COLOR: #dda0dd" 
        value=#DDA0DD>#DDA0DD</option>
                <option 
        style="COLOR: #b0e0e6; BACKGROUND-COLOR: #b0e0e6" 
        value=#B0E0E6>#B0E0E6</option>
                <option 
        style="COLOR: #800080; BACKGROUND-COLOR: #800080" 
        value=#800080>#800080</option>
                <option 
        style="COLOR: #ff0000; BACKGROUND-COLOR: #ff0000" 
        value=#FF0000>#FF0000</option>
                <option 
        style="COLOR: #bc8f8f; BACKGROUND-COLOR: #bc8f8f" 
        value=#BC8F8F>#BC8F8F</option>
                <option 
        style="COLOR: #4169e1; BACKGROUND-COLOR: #4169e1" 
        value=#4169E1>#4169E1</option>
                <option 
        style="COLOR: #8b4513; BACKGROUND-COLOR: #8b4513" 
        value=#8B4513>#8B4513</option>
                <option 
        style="COLOR: #fa8072; BACKGROUND-COLOR: #fa8072" 
        value=#FA8072>#FA8072</option>
                <option 
        style="COLOR: #f4a460; BACKGROUND-COLOR: #f4a460" 
        value=#F4A460>#F4A460</option>
                <option 
        style="COLOR: #2e8b57; BACKGROUND-COLOR: #2e8b57" 
        value=#2E8B57>#2E8B57</option>
                <option 
        style="COLOR: #fff5ee; BACKGROUND-COLOR: #fff5ee" 
        value=#FFF5EE>#FFF5EE</option>
                <option 
        style="COLOR: #a0522d; BACKGROUND-COLOR: #a0522d" 
        value=#A0522D>#A0522D</option>
                <option 
        style="COLOR: #c0c0c0; BACKGROUND-COLOR: #c0c0c0" 
        value=#C0C0C0>#C0C0C0</option>
                <option 
        style="COLOR: #87ceeb; BACKGROUND-COLOR: #87ceeb" 
        value=#87CEEB>#87CEEB</option>
                <option 
        style="COLOR: #6a5acd; BACKGROUND-COLOR: #6a5acd" 
        value=#6A5ACD>#6A5ACD</option>
                <option 
        style="COLOR: #708090; BACKGROUND-COLOR: #708090" 
        value=#708090>#708090</option>
                <option 
        style="COLOR: #fffafa; BACKGROUND-COLOR: #fffafa" 
        value=#FFFAFA>#FFFAFA</option>
                <option 
        style="COLOR: #00ff7f; BACKGROUND-COLOR: #00ff7f" 
        value=#00FF7F>#00FF7F</option>
                <option 
        style="COLOR: #4682b4; BACKGROUND-COLOR: #4682b4" 
        value=#4682B4>#4682B4</option>
                <option 
        style="COLOR: #d2b48c; BACKGROUND-COLOR: #d2b48c" 
        value=#D2B48C>#D2B48C</option>
                <option 
        style="COLOR: #008080; BACKGROUND-COLOR: #008080" 
        value=#008080>#008080</option>
                <option 
        style="COLOR: #d8bfd8; BACKGROUND-COLOR: #d8bfd8" 
        value=#D8BFD8>#D8BFD8</option>
                <option 
        style="COLOR: #ff6347; BACKGROUND-COLOR: #ff6347" 
        value=#FF6347>#FF6347</option>
                <option 
        style="COLOR: #40e0d0; BACKGROUND-COLOR: #40e0d0" 
        value=#40E0D0>#40E0D0</option>
                <option 
        style="COLOR: #ee82ee; BACKGROUND-COLOR: #ee82ee" 
        value=#EE82EE>#EE82EE</option>
                <option 
        style="COLOR: #f5deb3; BACKGROUND-COLOR: #f5deb3" 
        value=#F5DEB3>#F5DEB3</option>
                <option 
        style="COLOR: #ffffff; BACKGROUND-COLOR: #ffffff" 
        value=#FFFFFF>#FFFFFF</option>
                <option 
        style="COLOR: #f5f5f5; BACKGROUND-COLOR: #f5f5f5" 
        value=#F5F5F5>#F5F5F5</option>
                <option 
        style="COLOR: #ffff00; BACKGROUND-COLOR: #ffff00" 
        value=#FFFF00>#FFFF00</option>
                <option 
        style="COLOR: #9acd32; BACKGROUND-COLOR: #9acd32" 
        value=#9ACD32>#9ACD32</option>
              </select>
<% End Sub
   Sub FontBackColor()
%>
      <select name="selectbgColour" onChange="FormatText('BackColor',selectbgColour.options[selectbgColour.selectedIndex].value);document.form1.selectbgColour.options[0].selected = true;" onMouseOver="window.status='选择选定文字的背景颜色。';return true;" onMouseOut="window.status='';return true;">
        <option value="0" selected>选择文字背景颜色</option>
        <option style="background-color:#F0F8FF;color: #F0F8FF" value="#F0F8FF">#F0F8FF</option>
        <option style="background-color:#FAEBD7;color: #FAEBD7" value="#FAEBD7">#FAEBD7</option>
        <option style="background-color:#00FFFF;color: #00FFFF" value="#00FFFF">#00FFFF</option>
        <option style="background-color:#7FFFD4;color: #7FFFD4" value="#7FFFD4">#7FFFD4</option>
        <option style="background-color:#F0FFFF;color: #F0FFFF" value="#F0FFFF">#F0FFFF</option>
        <option style="background-color:#F5F5DC;color: #F5F5DC" value="#F5F5DC">#F5F5DC</option>
        <option style="background-color:#FFE4C4;color: #FFE4C4" value="#FFE4C4">#FFE4C4</option>
        <option style="background-color:#000000;color: #000000" value="#000000">#000000</option>
        <option style="background-color:#FFEBCD;color: #FFEBCD" value="#FFEBCD">#FFEBCD</option>
        <option style="background-color:#0000FF;color: #0000FF" value="#0000FF">#0000FF</option>
        <option style="background-color:#8A2BE2;color: #8A2BE2" value="#8A2BE2">#8A2BE2</option>
        <option style="background-color:#A52A2A;color: #A52A2A" value="#A52A2A">#A52A2A</option>
        <option style="background-color:#DEB887;color: #DEB887" value="#DEB887">#DEB887</option>
        <option style="background-color:#5F9EA0;color: #5F9EA0" value="#5F9EA0">#5F9EA0</option>
        <option style="background-color:#7FFF00;color: #7FFF00" value="#7FFF00">#7FFF00</option>
        <option style="background-color:#D2691E;color: #D2691E" value="#D2691E">#D2691E</option>
        <option style="background-color:#FF7F50;color: #FF7F50" value="#FF7F50">#FF7F50</option>
        <option style="background-color:#6495ED;color: #6495ED" value="#6495ED">#6495ED</option>
        <option style="background-color:#FFF8DC;color: #FFF8DC" value="#FFF8DC">#FFF8DC</option>
        <option style="background-color:#DC143C;color: #DC143C" value="#DC143C">#DC143C</option>


        <option style="background-color:#00FFFF;color: #00FFFF" value="#00FFFF">#00FFFF</option>
        <option style="background-color:#00008B;color: #00008B" value="#00008B">#00008B</option>
        <option style="background-color:#008B8B;color: #008B8B" value="#008B8B">#008B8B</option>
        <option style="background-color:#B8860B;color: #B8860B" value="#B8860B">#B8860B</option>
        <option style="background-color:#A9A9A9;color: #A9A9A9" value="#A9A9A9">#A9A9A9</option>
        <option style="background-color:#006400;color: #006400" value="#006400">#006400</option>
        <option style="background-color:#BDB76B;color: #BDB76B" value="#BDB76B">#BDB76B</option>
        <option style="background-color:#8B008B;color: #8B008B" value="#8B008B">#8B008B</option>
        <option style="background-color:#556B2F;color: #556B2F" value="#556B2F">#556B2F</option>
        <option style="background-color:#FF8C00;color: #FF8C00" value="#FF8C00">#FF8C00</option>
        <option style="background-color:#9932CC;color: #9932CC" value="#9932CC">#9932CC</option>
        <option style="background-color:#8B0000;color: #8B0000" value="#8B0000">#8B0000</option>
        <option style="background-color:#E9967A;color: #E9967A" value="#E9967A">#E9967A</option>
        <option style="background-color:#8FBC8F;color: #8FBC8F" value="#8FBC8F">#8FBC8F</option>
        <option style="background-color:#483D8B;color: #483D8B" value="#483D8B">#483D8B</option>
        <option style="background-color:#2F4F4F;color: #2F4F4F" value="#2F4F4F">#2F4F4F</option>
        <option style="background-color:#00CED1;color: #00CED1" value="#00CED1">#00CED1</option>
        <option style="background-color:#9400D3;color: #9400D3" value="#9400D3">#9400D3</option>
        <option style="background-color:#FF1493;color: #FF1493" value="#FF1493">#FF1493</option>
        <option style="background-color:#00BFFF;color: #00BFFF" value="#00BFFF">#00BFFF</option>
        <option style="background-color:#696969;color: #696969" value="#696969">#696969</option>
        <option style="background-color:#1E90FF;color: #1E90FF" value="#1E90FF">#1E90FF</option>
        <option style="background-color:#B22222;color: #B22222" value="#B22222">#B22222</option>
        <option style="background-color:#FFFAF0;color: #FFFAF0" value="#FFFAF0">#FFFAF0</option>
        <option style="background-color:#228B22;color: #228B22" value="#228B22">#228B22</option>
        <option style="background-color:#FF00FF;color: #FF00FF" value="#FF00FF">#FF00FF</option>
        <option style="background-color:#DCDCDC;color: #DCDCDC" value="#DCDCDC">#DCDCDC</option>
        <option style="background-color:#F8F8FF;color: #F8F8FF" value="#F8F8FF">#F8F8FF</option>
        <option style="background-color:#FFD700;color: #FFD700" value="#FFD700">#FFD700</option>
        <option style="background-color:#DAA520;color: #DAA520" value="#DAA520">#DAA520</option>
        <option style="background-color:#808080;color: #808080" value="#808080">#808080</option>
        <option style="background-color:#008000;color: #008000" value="#008000">#008000</option>
        <option style="background-color:#ADFF2F;color: #ADFF2F" value="#ADFF2F">#ADFF2F</option>
        <option style="background-color:#F0FFF0;color: #F0FFF0" value="#F0FFF0">#F0FFF0</option>
        <option style="background-color:#FF69B4;color: #FF69B4" value="#FF69B4">#FF69B4</option>
        <option style="background-color:#CD5C5C;color: #CD5C5C" value="#CD5C5C">#CD5C5C</option>
        <option style="background-color:#4B0082;color: #4B0082" value="#4B0082">#4B0082</option>
        <option style="background-color:#FFFFF0;color: #FFFFF0" value="#FFFFF0">#FFFFF0</option>
        <option style="background-color:#F0E68C;color: #F0E68C" value="#F0E68C">#F0E68C</option>
        <option style="background-color:#E6E6FA;color: #E6E6FA" value="#E6E6FA">#E6E6FA</option>
        <option style="background-color:#FFF0F5;color: #FFF0F5" value="#FFF0F5">#FFF0F5</option>
        <option style="background-color:#7CFC00;color: #7CFC00" value="#7CFC00">#7CFC00</option>
        <option style="background-color:#FFFACD;color: #FFFACD" value="#FFFACD">#FFFACD</option>
        <option style="background-color:#ADD8E6;color: #ADD8E6" value="#ADD8E6">#ADD8E6</option>
        <option style="background-color:#F08080;color: #F08080" value="#F08080">#F08080</option>
        <option style="background-color:#E0FFFF;color: #E0FFFF" value="#E0FFFF">#E0FFFF</option>
        <option style="background-color:#FAFAD2;color: #FAFAD2" value="#FAFAD2">#FAFAD2</option>
        <option style="background-color:#90EE90;color: #90EE90" value="#90EE90">#90EE90</option>
        <option style="background-color:#D3D3D3;color: #D3D3D3" value="#D3D3D3">#D3D3D3</option>
        <option style="background-color:#FFB6C1;color: #FFB6C1" value="#FFB6C1">#FFB6C1</option>
        <option style="background-color:#FFA07A;color: #FFA07A" value="#FFA07A">#FFA07A</option>
        <option style="background-color:#20B2AA;color: #20B2AA" value="#20B2AA">#20B2AA</option>
        <option style="background-color:#87CEFA;color: #87CEFA" value="#87CEFA">#87CEFA</option>
        <option style="background-color:#778899;color: #778899" value="#778899">#778899</option>
        <option style="background-color:#B0C4DE;color: #B0C4DE" value="#B0C4DE">#B0C4DE</option>
        <option style="background-color:#FFFFE0;color: #FFFFE0" value="#FFFFE0">#FFFFE0</option>
        <option style="background-color:#00FF00;color: #00FF00" value="#00FF00">#00FF00</option>
        <option style="background-color:#32CD32;color: #32CD32" value="#32CD32">#32CD32</option>
        <option style="background-color:#FAF0E6;color: #FAF0E6" value="#FAF0E6">#FAF0E6</option>
        <option style="background-color:#FF00FF;color: #FF00FF" value="#FF00FF">#FF00FF</option>
        <option style="background-color:#800000;color: #800000" value="#800000">#800000</option>
        <option style="background-color:#66CDAA;color: #66CDAA" value="#66CDAA">#66CDAA</option>
        <option style="background-color:#0000CD;color: #0000CD" value="#0000CD">#0000CD</option>
        <option style="background-color:#BA55D3;color: #BA55D3" value="#BA55D3">#BA55D3</option>
        <option style="background-color:#9370DB;color: #9370DB" value="#9370DB">#9370DB</option>
        <option style="background-color:#3CB371;color: #3CB371" value="#3CB371">#3CB371</option>
        <option style="background-color:#7B68EE;color: #7B68EE" value="#7B68EE">#7B68EE</option>
        <option style="background-color:#00FA9A;color: #00FA9A" value="#00FA9A">#00FA9A</option>
        <option style="background-color:#48D1CC;color: #48D1CC" value="#48D1CC">#48D1CC</option>
        <option style="background-color:#C71585;color: #C71585" value="#C71585">#C71585</option>
        <option style="background-color:#191970;color: #191970" value="#191970">#191970</option>
        <option style="background-color:#F5FFFA;color: #F5FFFA" value="#F5FFFA">#F5FFFA</option>
        <option style="background-color:#FFE4E1;color: #FFE4E1" value="#FFE4E1">#FFE4E1</option>
        <option style="background-color:#FFE4B5;color: #FFE4B5" value="#FFE4B5">#FFE4B5</option>
        <option style="background-color:#FFDEAD;color: #FFDEAD" value="#FFDEAD">#FFDEAD</option>
        <option style="background-color:#000080;color: #000080" value="#000080">#000080</option>
        <option style="background-color:#FDF5E6;color: #FDF5E6" value="#FDF5E6">#FDF5E6</option>
        <option style="background-color:#808000;color: #808000" value="#808000">#808000</option>
        <option style="background-color:#6B8E23;color: #6B8E23" value="#6B8E23">#6B8E23</option>
        <option style="background-color:#FFA500;color: #FFA500" value="#FFA500">#FFA500</option>
        <option style="background-color:#FF4500;color: #FF4500" value="#FF4500">#FF4500</option>
        <option style="background-color:#DA70D6;color: #DA70D6" value="#DA70D6">#DA70D6</option>
        <option style="background-color:#EEE8AA;color: #EEE8AA" value="#EEE8AA">#EEE8AA</option>
        <option style="background-color:#98FB98;color: #98FB98" value="#98FB98">#98FB98</option>
        <option style="background-color:#AFEEEE;color: #AFEEEE" value="#AFEEEE">#AFEEEE</option>
        <option style="background-color:#DB7093;color: #DB7093" value="#DB7093">#DB7093</option>
        <option style="background-color:#FFEFD5;color: #FFEFD5" value="#FFEFD5">#FFEFD5</option>
        <option style="background-color:#FFDAB9;color: #FFDAB9" value="#FFDAB9">#FFDAB9</option>
        <option style="background-color:#CD853F;color: #CD853F" value="#CD853F">#CD853F</option>
        <option style="background-color:#FFC0CB;color: #FFC0CB" value="#FFC0CB">#FFC0CB</option>
        <option style="background-color:#DDA0DD;color: #DDA0DD" value="#DDA0DD">#DDA0DD</option>
        <option style="background-color:#B0E0E6;color: #B0E0E6" value="#B0E0E6">#B0E0E6</option>
        <option style="background-color:#800080;color: #800080" value="#800080">#800080</option>
        <option style="background-color:#FF0000;color: #FF0000" value="#FF0000">#FF0000</option>
        <option style="background-color:#BC8F8F;color: #BC8F8F" value="#BC8F8F">#BC8F8F</option>
        <option style="background-color:#4169E1;color: #4169E1" value="#4169E1">#4169E1</option>
        <option style="background-color:#8B4513;color: #8B4513" value="#8B4513">#8B4513</option>
        <option style="background-color:#FA8072;color: #FA8072" value="#FA8072">#FA8072</option>
        <option style="background-color:#F4A460;color: #F4A460" value="#F4A460">#F4A460</option>
        <option style="background-color:#2E8B57;color: #2E8B57" value="#2E8B57">#2E8B57</option>
        <option style="background-color:#FFF5EE;color: #FFF5EE" value="#FFF5EE">#FFF5EE</option>
        <option style="background-color:#A0522D;color: #A0522D" value="#A0522D">#A0522D</option>
        <option style="background-color:#C0C0C0;color: #C0C0C0" value="#C0C0C0">#C0C0C0</option>
        <option style="background-color:#87CEEB;color: #87CEEB" value="#87CEEB">#87CEEB</option>
        <option style="background-color:#6A5ACD;color: #6A5ACD" value="#6A5ACD">#6A5ACD</option>
        <option style="background-color:#708090;color: #708090" value="#708090">#708090</option>
        <option style="background-color:#FFFAFA;color: #FFFAFA" value="#FFFAFA">#FFFAFA</option>
        <option style="background-color:#00FF7F;color: #00FF7F" value="#00FF7F">#00FF7F</option>
        <option style="background-color:#4682B4;color: #4682B4" value="#4682B4">#4682B4</option>
        <option style="background-color:#D2B48C;color: #D2B48C" value="#D2B48C">#D2B48C</option>
        <option style="background-color:#008080;color: #008080" value="#008080">#008080</option>
        <option style="background-color:#D8BFD8;color: #D8BFD8" value="#D8BFD8">#D8BFD8</option>
        <option style="background-color:#FF6347;color: #FF6347" value="#FF6347">#FF6347</option>
        <option style="background-color:#40E0D0;color: #40E0D0" value="#40E0D0">#40E0D0</option>
        <option style="background-color:#EE82EE;color: #EE82EE" value="#EE82EE">#EE82EE</option>
        <option style="background-color:#F5DEB3;color: #F5DEB3" value="#F5DEB3">#F5DEB3</option>
        <option style="background-color:#FFFFFF;color: #FFFFFF" value="#FFFFFF">#FFFFFF</option>
        <option style="background-color:#F5F5F5;color: #F5F5F5" value="#F5F5F5">#F5F5F5</option>
        <option style="background-color:#FFFF00;color: #FFFF00" value="#FFFF00">#FFFF00</option>
        <option style="background-color:#9ACD32;color: #9ACD32" value="#9ACD32">#9ACD32</option>
      </select>
<%
   End Sub
   Sub FontSize()
%>
     <SELECT language="javascript"  id="FontSize" title="字号大小" onChange="FormatText('fontsize',this[this.selectedIndex].value);" name="select" onMouseOver="window.status='选择选定文字的字号大小。';return true;" onMouseOut="window.status='';return true;">
       <option value=字体大小 selected>字体大小</option>
         <option value=1>1</option>
         <option value=2>2</option>
         <option value=3>3</option>
         <option value=4>4</option>
         <option value=5>5</option>
         <option value=6>6</option>
         <option value=7>7</option>
     </select>
<% End Sub
   Sub FontFace()
%>
     <SELECT name="selectFont" onChange="FormatText('fontname', selectFont.options[selectFont.selectedIndex].value);document.form1.selectFont.options[0].selected = true;"  style="font-family: 宋体; font-size: 9pt" onMouseOver="window.status='选择选定文字的字体。';return true;" onMouseOut="window.status='';return true;">
        <option value=选择字体 selected>&nbsp;&nbsp;&nbsp;&nbsp;选择字体</option>
        <option value=宋体>宋体</option>
        <option value=楷体_GB2312>楷体</option>
        <option value=新宋体>新宋体</option>
        <option value=黑体>黑体</option>
        <option value=隶书>隶书</option>
        <option value="Andale Mono">Andale Mono</option>
        <option value=Arial>Arial</option>
        <option value="Arial Black">Arial Black</option>
        <option value="Book Antiqua">Book Antiqua</option>
        <option value="Century Gothic">Century Gothic</option>
        <option value="Comic Sans MS">Comic Sans MS</option>
        <option value="Courier New">Courier New</option>
        <option value=Georgia>Georgia</option>
        <option value=Impact>Impact</option>
        <option value=Tahoma>Tahoma</option>
        <option value=Stencil>Stencil</option>
        <option value=Verdana>Verdana</option>
        </select>
<%
  End SUb
  Sub img()
%>
<img onClick="FormatText('cut')" alt=剪切 src="../images/cut.gif" style="cursor: hand;"> 
<img onClick="FormatText('copy')" alt=复制 src="../images/copy.gif" style="cursor: hand;"> 
<img onClick="FormatText('paste')" alt=粘贴 src="../images/paste.gif" style="cursor: hand;"> 
<img onClick="FormatText('DELETE')" alt=删除 src="../images/delete.gif" style="cursor: hand;"> 
<img onClick="FormatText('undo')" alt=取消 src="../images/undo.gif" style="cursor: hand;"> 
<img onClick="FormatText('redo')" alt=恢复 src="../images/redo.gif" style="cursor: hand;"> 
<img src="../images/bold.gif" alt=粗体 width="23" height="22" style="cursor: hand;" onClick="FormatText('bold', '')">
<img src="../images/i.gif" alt=斜体 width="23" height="22"  style="cursor: hand;" onClick="FormatText('italic', '')"> 
<img onClick="FormatText('underline', '')" alt=下划线 src="../images/underline.gif"   style="cursor: hand;"> 
<img src="../images/left.gif" alt=居左 width="23" height="22"  style="cursor: hand;" onClick="FormatText('Justifyleft', '')"> 
<img onClick="FormatText('JustifyCenter', '')" alt=居中 src="../images/center.gif"  style="cursor: hand;"> 
<img src="../images/right.gif" alt=居右 width="23" height="22"   style="cursor: hand;" onClick="FormatText('JustifyRight', '')"> 
<img onClick="FormatText('InsertUnorderedList', '')" alt=项目符号 src="../images/list1.gif"   style="cursor: hand;"> 
<img onClick="FormatText('insertorderedlist', '')" alt=编号 src="../images/number.gif"   style="cursor: hand;"> 
<img onClick="FormatText('Outdent', '')" alt="回退" src="../images/outdent.gif"   style="cursor: hand;"> 
<img onClick="FormatText('indent', '')" alt="缩进" src="../images/indent.gif" style="cursor: hand;"> 
<img onClick="CrTable()" alt="插入表格" src="../images/table.gif"  style="cursor: hand;"> 
<img onClick="hr()" alt="水平线" src="../images/line1.gif" style="cursor: hand;">
<img onclick="iframe()" alt="框架" src="../images/iframe.gif" style="cursor: hand;"> 
<img onclick="FIELDSET()" alt="栏目框" src="../images/FIELDSET.gif" style="cursor: hand;"> 
<img onClick="FormatText('createLink')" alt="超级链接" src="../images/url.gif"  style="cursor: hand;"> 
<img onClick="FormatText('unLink')" alt="取消超级链接" src="../images/unurl.gif"  style="cursor: hand;"> 
<%
  End SUb
  SUb title()
%>
<SELECT onchange=DoTitle(this.options[this.selectedIndex].value)>
      <option value="">标题颜色</option>
      <option value=[粗]>　　[粗]</option>
      <option value=[红]>　　[红]</option>
      <option value=[蓝]>　　[蓝]</option>
      <option value=[绿]>　　[绿]</option>
      <option value=[紫]>　　[紫]</option>
      <option value=[酱]>　　[酱]</option>
      <option value=[橙]>　　[橙]</option>
      <option value="">登载方式</option>
      <option value=[原创]>　[原创]</option>
      <option value=[转载]>　[转载]</option>
      <option value=[推荐]>　[推荐]</option>
      <option value=[公告]>　[公告]</option>
      <option value=[下载]>　[下载]</option>
      <option value=[注意]>　[注意]</option>
      <option value=[建议]>　[建议]</option>
      <option value=[焦点]>　[焦点]</option>
      <option value=[社会]>　[社会]</option>
    </select>
<%
  End SUb
%>

<script language="JavaScript">
      //操作确认
       function confirm_mess(action_url,mess)
       {
	          var del_yes_no=window.confirm(mess);
              if (del_yes_no) {
	    	  document.location=action_url;
    	        }
        }
</script>