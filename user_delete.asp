<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#Include file="Connection/Connection.asp"-->
<%
if CheckMod=3 then
	Response.Redirect "error_info.asp?err=21"
else

sArrayID = Request.Form("msgid")

sSQL = "DELETE FROM Admin WHERE trim(Admin_Id) IN " & sArrayID
DK0HP.Execute sSQL
end if
Response.Redirect "user_admin.asp"
%>