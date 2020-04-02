<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%
Response.Charset = "utf-8"
Session.CodePage=65001
%>
<%
dim conn,db
dim connstr   
   'on error resume next
call conn_init()
sub conn_init()
       'on error resume next
   connstr = "DBQ=" + server.mappath("/database/#chinayazhuo_database#.mdb") + ";DefaultDir=;DRIVER={Microsoft Access Driver (*.mdb)};"       
       set conn=server.createobject("ADODB.CONNECTION")
       if err.number<>0 then 
           err.clear
           set conn=nothing
		   response.write "数据库连接出错！"
		   Response.End
       else
		   'response.write connstr
		   conn.open connstr
           if err then 
              err.clear
              set conn=nothing
			   response.write "数据库连接出错！"
              Response.End 
           end if
       end if   
  end sub
	
  sub endConnection()
      conn.close
      set conn=nothing
  end sub
%>

<%
Dim GetFlag Rem(提交方式)
Dim ErrorSql Rem(非法字符) 
Dim RequestKey Rem(提交数据)
Dim ForI Rem(循环标记)
ErrorSql = "'~;~and~(~)~exec~update~count~*~%~chr~mid~master~truncate~char~declare" Rem(每个敏感字符或者词语请使用半角 "~" 格开)
ErrorSql = split(ErrorSql,"~")
If Request.ServerVariables("REQUEST_METHOD")="GET" Then
GetFlag=True
Else
GetFlag=False
End If
If GetFlag Then
  For Each RequestKey In Request.QueryString
   For ForI=0 To Ubound(ErrorSql)
    If Instr(LCase(Request.QueryString(RequestKey)),ErrorSql(ForI))<>0 Then
    response.write "<script>alert(""严重警告:\n请不要使用敏感字符"");location.href=""Sql.asp"";</script>"
    Response.End
    End If
   Next
  Next 
Else
  For Each RequestKey In Request.Form
   For ForI=0 To Ubound(ErrorSql)
    If Instr(LCase(Request.Form(RequestKey)),ErrorSql(ForI))<>0 Then
    response.write "<script>alert(""严重警告:\n请不要使用敏感字符"");location.href=""Sql.asp"";</script>"
    Response.End
    End If
   Next
  Next
End If
%>
<%
'防止注入
dim qs,errc,iii
qs=request.servervariables("query_string")
'response.write(qs)
dim deStr(13)
deStr(0)="net user"
deStr(1)="xp_cmdshell"
deStr(2)="/add"
deStr(3)="select"
deStr(4)="count"
deStr(5)="asc"
deStr(6)="char"
deStr(7)="mid"
deStr(8)="'"
deStr(9)=""""
deStr(10)="insert"
deStr(11)="delete"
deStr(12)="drop"
deStr(13)="truncate"
errc=false
for iii= 0 to ubound(deStr)
if instr(qs,deStr(iii))<>0 then
errc=true
end if
next
if errc then
Response.Write("对不起，非法URL地址请求!")
response.end
end if
%>
<!--#include file="inc/function.asp" -->
<!--#include file="inc/path.inc" -->
<% 
language=false
set rs=server.createobject("adodb.recordset")
sql="select * from define where language="&language
rs.open sql,conn,1,1
if rs.eof=false then
	web_title=rs("web_title")
	web_foot=rs("web_foot")
	contact_email=rs("contact_email")
	web_url=rs("web_url")
end if
rs.close
%>