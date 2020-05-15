<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#Include file="Connection/Connection.asp"-->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Home Page Nissan Techno Viet Nam</title>
<link rel="stylesheet" type="text/css" href="Images/css/vavietnam.css" />
<!--#Include file="fix.asp"-->
</head>

<body bgcolor="#FFFFFF" topmargin="0" bottommargin="0">
<%
	Dim IDBV,strURL
	IDBV = request.QueryString("ID")
	strURL = Request.QueryString("gr")
	
	Set rsconn1 = Server.CreateObject("ADODB.Recordset")
	strSQL1 = "SELECT BaiViet_View FROM BaiViet WHERE BaiViet_Id ="&IDBV
	rsconn1.Open strSQL1,DK0HP,3,3	
		If NOT rsconn1.EOF Then 
			LUOTXEM=rsconn1("BaiViet_View")+1
			strSQL1="UPDATE BaiViet set BaiViet_View ="&LUOTXEM&" WHERE BaiViet_Id ="&IDBV
			DK0HP.execute(strSQL1)
		End If
	rsconn1.close()
	set rsconn1= nothing
		 
	Set rsConn = Server.CreateObject("ADODB.Recordset")
	sqltext = "Select * From BaiViet where BaiViet_Id="&IDBV
	rsConn.open sqltext,DK0HP
	vIDLoaiBV = rsConn("Loai_Id")
	if strURL ="" and IDBV <>"" then
		strURL =vIDLoaiBV
	end if
	%>

<a name="top" id= "top"></a>
<center>
  <table width="960" border="0" cellspacing="0" cellpadding="0" class="bigtable">
    <tr>
      <td width="960" height="120" colspan="2" valign="top" ><!--#Include file="Template/logo.asp"--></td>
    </tr>
    <tr>
      <td width="960" colspan="2" class="MenuTop">
	  	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		  <tr>
			<td width="740" class="MenuTop" align="center"><!--#Include file="Template/MenuNgang.asp"--></td>
			<td align="center" width="220" class="MenuLang"><a href="Details.asp?ID=<%=IDBV%>&langs=ja" class="MenuLang" target="_self">&nbsp;Japanese&nbsp;</a>&nbsp;|
	  &nbsp;<a href="Details.asp?ID=<%=IDBV%>&langs=vn" class="MenuLang" target="_self">Vietnamese</a> </td>
		  </tr>
		</table>

	  </td>
    </tr>
	  <tr>
      <td width="220px" valign="top" bgcolor="#FFFFFF" style="padding:1px 0; border-right:1px #CCCCCC solid;"><!--#Include file="Template/MenuLeft.asp"--></td>
	  <td width="740" valign="top" bgcolor="#FFFFFF" align="left" class="fulltext" ><!--#Include file="Template/details.asp"--></td>
    </tr>
    <tr>
      <td colspan="2" bgcolor="#0058A0" style=" border-top:1px solid #FFFFFF;" class="MenuPoster"><!--#Include file="Template/LienHe.asp"--></td>
    </tr>
  </table>
</center>
</body>
</html>
<!--#Include file="Connection/EndConnection.asp"-->