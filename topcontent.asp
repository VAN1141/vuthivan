<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#Include file="Connection/Connection.asp"-->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Home Page Nissan Techno Viet Nam</title>
<link rel="stylesheet" type="text/css" href="Images/css/vavietnam.css" />
<link rel="stylesheet" type="text/css" href="Images/java/style.css" />
<script type="text/javascript" src="Images/java/jquery.min1.js" ></script>
<script type="text/javascript" src="Images/java/jquery-ui.min.js" ></script>
<SCRIPT type=text/javascript>
	$(document).ready(function e(){
		$("#featured > ul").tabs({fx:{opacity: "toggle"}}).tabs("rotate", 5000, true);
	});
</SCRIPT>
</head>
<body bgcolor="#E0F2FF" topmargin="0" bottommargin="0">
<!--#Include file="Template/topnews.asp"-->
</body>
</html>
<!--#Include file="Connection/EndConnection.asp"-->