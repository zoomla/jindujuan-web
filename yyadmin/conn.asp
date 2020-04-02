<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%
Response.Charset = "utf-8"
Session.CodePage=65001
%>
<%
dim conn,db,ku,rs
db="../database/#chinayazhuo_database#.mdb"
ku="Provider=Microsoft.Jet.OLEDB.4.0;Data Source="& server.MapPath(db)
set conn=server.CreateObject("ADODB.Connection")
conn.open ku
set rs=server.CreateObject("ADODB.Recordset")

sub closedb
conn.close
set rs=nothing
set conn=nothing
end sub
%>