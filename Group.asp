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
	Dim strURL
	strURL = Request.QueryString("ID")
%>
<a name="top" id= "top"></a>
<center>
  <table width="960" border="0" cellspacing="0" cellpadding="0" class="bigtable">
    <tr>
      <td width="960" height="120" colspan="3" valign="top" ><!--#Include file="Template/logo.asp"--></td>
    </tr>
    <tr>
      <td width="740" colspan="2"  class="MenuTop" align="center"><!--#Include file="Template/MenuNgang.asp"--></td>
      <td align="center"  class="MenuLang"><a href="Group.asp?ID=<%=strURL%>&langs=ja" class="MenuLang" target="_self">&nbsp;Japanese&nbsp;</a>&nbsp;|&nbsp;<a href="Group.asp?ID=<%=strURL%>&langs=vn" class="MenuLang" target="_self">Vietnamese</a></td>
    </tr>
    <tr>
      <td width="220px" valign="top" bgcolor="#FFFFFF" style="padding:1px 0; border-right:1px #CCCCCC solid;"><!--#Include file="Template/MenuLeft.asp"--></td>
      <td  class="KhungChinh" valign="top" width="520">
	  <!--Nội dung chứa ở đây-->
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td align="center"><!--#Include file="Template/toploai.asp"--></td>
            </tr>
            <tr>
              <td valign="top" align="left"><!--#Include file="Template/group.asp"--></td>
            </tr>
          </table>
        <!--hết phần Nội dung-->
        <br><p></p>
		  </td>
      <td valign="top" bgcolor="#FFFFFF" style="padding:1px 0; border-left:1px #CCCCCC solid;"><!--#Include file="Template/MenuRight.asp"--></td>
    </tr>
    <tr>
      <td colspan="3" bgcolor="#0058A0" style=" border-top:1px solid #FFFFFF;" class="MenuPoster"><!--#Include file="Template/LienHe.asp"--></td>
    </tr>
  </table>
</center>
</body>
</html>
<!--#Include file="Connection/EndConnection.asp"-->