<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#Include file="Connection/Connection.asp"-->
<!--#include file="inc_sha256.asp"-->
<%
	if CheckMod = 3  then
	Response.Redirect "error_info.asp?err=21"
	else
	sUsername = UCase(Trim(Request.Form("Username")))
	sUsername = SQLPatch(sUsername)
	sAction = Trim(UCase(Request.Form("act")))
	if Trim(sUsername)="" then Response.Redirect "error_info.asp?err=90"
	sUserPw = Request.Form("UserPw")
	sUserPw = SQLPatch(sUserPw)
	sConfirmPw = Request.Form("ConfirmPw")
	sConfirmPw = SQLPatch(sConfirmPw)
	if sUserPw<>sConfirmPw then Response.Redirect "error_info.asp?err=91"
		sSQL = "SELECT * FROM Admin"
		Set adoRec = Server.CreateObject("ADODB.Recordset")
		adoRec.Open sSQL, DK0HP, 3, 3
		Set checkUse = Server.CreateObject("ADODB.Recordset")
		SQL = "SELECT * FROM Admin WHERE User='" & sUsername & "'"
		checkUse.Open SQL, DK0HP, 3, 3
	
	if sAction="ADD" then
		if checkUse.RecordCount>0 then
			Response.Redirect "error_info.asp?err=92"
		else
			adoRec.AddNew
		end if
	end if
	adoRec("Admin_FullName") = Trim(Request.Form("UserRealName"))
	adoRec("Admin_Email") = Trim(Request.Form("Address"))
	adoRec("Admin_Phone") = Trim(Request.Form("UserDept"))
	adoRec("User") = sUsername
	if Trim(sUserPw)<>"" then
		adoRec("Password") = SHA256(sUserPw)
	end if
	if(Trim(Request.Form("Gender"))="1") then
		adoRec("Gender") = true
	else
		adoRec("Gender") = false
	end if
	adoRec("Decentralization") = CLng(Request.Form("UserLevel"))
	adoRec.Update
	Set adoRec = Nothing
	checkUse.close
	set checkUse = nothing
	Response.Redirect "user_admin.asp"
	end if
%>