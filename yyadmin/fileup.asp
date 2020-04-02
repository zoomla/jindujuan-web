<% 
'/================================[SA_FileUp上传函数（孤竹无名）]=============================
'/* 图片上传检测及处理
'/* 须给定图片名称
'/* 格式：file1上传的文件，filepath文件物理路径，filename文件名，ExtName1返回文件扩展名
'/==========================================================================================
function SA_FileUp_image(file1,FilePath,filename,ExtName1)
	'//判断上传的是否图片类型
	set file1=formdata.form(""&file1&"")
	ContentType1=file1.ContentType
	if instr(ContentType1,"jpeg")>0 or instr(ContentType1,"gif")>0 then
		if instr(ContentType1,"jpeg")>0 then
			ExtName1=".jpg" 
		end if
		if instr(ContentType1,"gif")>0 then 
			ExtName1=".gif"
		end if
		images_name=filename&ExtName1
		file1.SaveAs(FilePath&"\"&images_name)
		ExtName1=ExtName1
	else
		mess="您上传的不是图片类型！\n规定图片类型为 GIF 或者是 JPG 的格式 \n"
		goto_url="javascript:history.back();"
		call error(mess,goto_url)
		response.end
	end if
end function
'/**
'/========================================================
'/* 图片名称自动生成
'/* 格式：file1上传的文件，filepath文件物理路径，filename返回文件名，js_name返回去扩展的文件名
'/=========================================================
function SA_FileUp_image2(file1,FilePath,filename,js_name)
         '//判断上传的是否图片类型
		 set file1=formdata.form(""&file1&"")
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
			file1.SaveAs(FilePath&"\"&images_name)
			filename=images_name
			js_name=ExtName1
         else
            mess="您上传的不是图片类型！\n规定图片类型为 GIF 或者是 JPG 的格式 \n"
            goto_url="javascript:history.back();"
            call error(mess,goto_url)
            response.end
         end if
end function
'/**
'/========================================================
'/* flash名称自动生成
'/* 格式：file1上传的文件，filepath文件物理路径，filename返回文件名，js_name返回去扩展的文件名
'/=========================================================
function SA_FileUp_flash2(file1,FilePath,filename,js_name)
         '//判断上传的是否flash类型
		 set file1=formdata.form(""&file1&"")
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
'/========================================================
'/* flash名称给定
'/* 格式：file1上传的文件，filepath文件物理路径，filename返回文件名，js_name返回去扩展的文件名
'/=========================================================
function SA_FileUp_flash(file1,FilePath,filename,js_name)
         '//判断上传的是否flash类型
		 set file1=formdata.form(""&file1&"")
		 ContentType1=file1.ContentType
         if instr(ContentType1,"flash")>0 then
	        ExtName1=".swf"
			images_name=filename&ExtName1
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
'/==================================================================================================
'/=========================================[SA_FileUp上传函数结束]===================================
'/==================================================================================================


'/================================[LyfUpload上传函数（孤竹无名）]=============================
'/* 图片上传检测及处理
'/* 须给定图片名称
'/* 格式：file1上传的文件，filename文件名，filepath文件物理路径，ExtName1返回文件扩展名
'/==========================================================================================
function LyfUpload_image(file1,FilePath,filename,ExtName1)
	'//判断上传的是否图片类型
	ContentType1=obj.filetype(""&file1&"")
	if instr(ContentType1,"jpeg")>0 or instr(ContentType1,"gif")>0 then
		if instr(ContentType1,"jpeg")>0 then
			ExtName1=".jpg" 
		end if
		if instr(ContentType1,"gif")>0 then 
			ExtName1=".gif"
		end if
		images_name=filename&ExtName1
		aa=obj.SaveFile(file1, FilePath, true,images_name)
		ExtName1=ExtName1
	else
		mess="您上传的不是图片类型！\n规定图片类型为 GIF 或者是 JPG 的格式 \n"
		goto_url="javascript:history.back();"
		call error(mess,goto_url)
		response.end
	end if
end function
'/**
'/========================================================
'/* 图片名称自动生成
'/* 格式：file1上传的文件，filepath文件物理路径，filename返回文件名，js_name返回去扩展的文件名
'/=========================================================
function LyfUpload_image2(file1,FilePath,filename,js_name)
         '//判断上传的是否图片类型
		 ContentType1=obj.filetype(""&file1&"")
         if instr(ContentType1,"jpeg")>0 or instr(ContentType1,"gif")>0 then
            if instr(ContentType1,"jpeg")>0 then
	           ExtName1=".jpg" 
            end if
            if instr(ContentType1,"gif")>0 then 
	           ExtName1=".gif"
            end if
			js_name=right(year(now),1)&month(now)&day(now)&right(replace(timer,".",""),5)
            images_name=js_name&ExtName1
			aa=obj.SaveFile(file1, FilePath, true,images_name)
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
'/==================================================================================================
'/=========================================[LyfUpload上传函数结束]===================================
'/==================================================================================================
%>
