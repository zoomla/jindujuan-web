<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%
Response.Charset = "utf-8"
Session.CodePage=65001
%>
<%
dbpath=server.mappath("../../database/#chinayazhuo_database#.mdb")
set conn=server.createobject("adodb.connection")
conn.open "driver={microsoft access driver (*.mdb)}; dbq=" & dbpath
set rs=server.createobject("adodb.recordset")
%>
