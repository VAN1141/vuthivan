<!--#Include file="Connection\Connection.asp"-->
<!--#include file="inc_sha256.asp"-->
<%

'sUsername = UCase(Trim(Request.Form("txtusername")))
sUsername = Request("TENDANNHAP")
'Response.write(sUsername)
sUsername = SQLPatch(sUsername)
sUsername = sUsername

'sUserPw = Request.Form("txtUserPass")
sUserPw = Request("MAT_KHAU")
sUserPw = SQLPatch(sUserPw)
sUserPw = sha256(sUserPw)

sSQL = "SELECT Admin_Id FROM Admin WHERE User='" & sUsername & "' AND Password='" & sUserPw & "'"
Set adoRec = Server.CreateObject("ADODB.Recordset")
adoRec.Open sSQL, DK0HP, 3, 3
if adoRec.RecordCount>0 then
'if adoRec.RecordCount>0 then
	Session("USER") = sUsername
	Session("UserID")=adoRec("UserID")
	Response.Redirect "home_admin.asp"
else
	Response.Redirect "error_info.asp?err=20"
end if
%>
