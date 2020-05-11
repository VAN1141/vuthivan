<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#Include file="Connection/Connection.asp"-->
<%
	if CheckMod <> 3 then
	Response.Redirect "error_info.asp?err=21"
	else
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Administrator Website EIW</title>
<link rel="stylesheet" type="text/css" href="Images/css/admin.css" />
<script type="text/javascript" src="../Images/java/chrome.js"></script>
</head>

<body bgcolor="#FFFFFF" topmargin="3" bottommargin="1">

<a name="top" id= "top"></a>
<center>
<table width="780" height="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#B7B1BF">
  	<tr>
    	<td width="780" height="90" valign="top" ><img src="../Images/logo_admin.jpg" width="780" height="90" /></td>
  	</tr>
  	<tr>
		<td width="780" bgcolor="#333333" height="25px;"><!--#Include file="Template/MenuNgang.asp"--><script type="text/javascript">cssdropdown.startchrome('menu')</script>	</td>
  	</tr>
 <tr>
		<td valign="top" ><!--#Include file="header.asp"--></td>
	</tr>
	<tr>
		<td valign="top" bgcolor="#B7B1BF" style="padding:1px">
		<%
		tinhnang = Request.QueryString("tinhnang")
		Select Case tinhnang
			Case "list":%>
					<!--#Include file="user_list.asp"-->
			<%Case "add":%>
					<!--#Include file="user_new.asp"-->
			<%Case "edit":%>
					<!--#Include file="user_edit.asp"-->
			<%Case else:%>
					<!--#Include file="user_new.asp"-->
		  <%End Select%></td>
	</tr>
	<tr>
		<td height="23" bgcolor="#333333" style=" border-top:1px solid #FFFFFF;" class="Copyright"><!--#Include file="Template/LienHe.asp"--></td>
	</tr>  
</table>
</center>
</body>
</html>
<%end if%>
<!--#Include file="Connection/EndConnection.asp"-->