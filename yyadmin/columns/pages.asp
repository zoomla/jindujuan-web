<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="25"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr valign="bottom"> 
          <td width="85%" height="24" class="black">
		  <div align="right">
		  <script language="JavaScript" type="text/JavaScript">
           <!--
            function MM_jumpMenu(targ,selObj,restore){ //v3.0
                      eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
                      if (restore) selObj.selectedIndex=0;
                     }
            //-->
          </script>
		  <% 
		  if int(pages)>1 then
		  %>
		     <a href="?language=<%=language %>&type_id=<%=type_id %>&search_key=<%=search_key%>">首页</a>&nbsp;|&nbsp;<a href="?language=<%=language %>&type_id=<%=type_id %>&search_key=<%=search_key%>&pages=<%=pages-1 %>">上一页</a>
		  <% 
		  end if
		  if int(pages)<int(rdpages) then
		  %>  
		     &nbsp;|&nbsp;<a href="?language=<%=language %>&type_id=<%=type_id %>&search_key=<%=search_key%>&pages=<%=pages+1 %>">下一页</a>&nbsp;|&nbsp;<a href="?language=<%=language %>&type_id=<%=type_id %>&search_key=<%=search_key%>&pages=<%=rdpages %>">末页</a>&nbsp;|&nbsp;
		  <% 
		  end if
		  %>
          转到&nbsp;&nbsp;</div></td>
          <td> 
		  <select name="pages" onChange="MM_jumpMenu('self',this,0)">
		  <%
		  if rdpages=0 then
		  %>
		      <option value="">无</option>
		  <%
		  end if
		  i=1
		  while i<=rdpages
		  %>
              <option value="?language=<%=language %>&type_id=<%=type_id %>&search_key=<%=search_key%>&pages=<%=i %>" <%call compare_mess(int(pages),i,"selected","")%>><%=i %></option>
		  <% 
		  i=i+1
		  wend
		  %>
           </select>
            页 </td>
        </tr>
      </table></td>
  </tr>
</table>