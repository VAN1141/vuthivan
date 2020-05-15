<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#Include file="Connection/Connection.asp"-->

<%
if Request.Form("Action")="VietComment" then
	commentHot= Request.Form("Hot")
	IpNguoiGui= Request.Form("MaxacnhanL")
	
	if IpNguoiGui ="" then
		'IpNguoiGui= Request.ServerVariables("AUTH_USER")
		'IpNguoiGui = Request.ServerVariables("LOGON_USER")
		'IpNguoiGui = Request.ServerVariables("REMOTE_USER")
		IpNguoiGui = Request.ServerVariables("REMOTE_ADDR")
	end if
	NoiDung = Request.Form("NoiDungComment")

	if IpNguoiGui<>"" AND NoiDung <>"" then
		set rsCommon = Server.CreateObject("ADODB.Recordset")
		sSQL="select * from Comment"
		rsCommon.Open sSQL, DK0HP, 3, 3
		rsCommon.Addnew
		rsCommon("Comment_Ip") = IpNguoiGui
		rsCommon("Comment_Body") = NoiDung
		rsCommon("Comment_Hot") = commentHot
		rsCommon("Comment_Hide") = true		
		rsCommon.Update
		rsCommon.Close()
		set rsCommon = nothing
		set rsCommon=Nothing
		Response.Redirect("Index.asp?msg=SUCCESSFUL!!")
	End if	
End if	
%>
<!--#Include file="Connection/EndConnection.asp"-->