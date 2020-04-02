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
'/**

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
