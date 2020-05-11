<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html>
<html lang="vi">
<!--#Include file="Connection/Connection.asp"-->
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>HỆ THỐNG TRA CỨU VĂN BẢN PHÁP LUẬT LAO ĐỘNG</title>
  <link rel="stylesheet" type="text/css" href="../Template/css/bootstrap.min.css">
</head>
<body>
  <div id="top">
    <!--#Include file="Template/MenuTop.asp"-->
  </div>
  <div id="main" class="container-fluid">

   <!--#Include file="user_list.asp"-->

  </div>
  <div id="bottom">
    <!--#Include file="Template/Bottom.asp"-->
  </div>
 
  <script type="text/javascript" language="javascript" src="../Template/java/jquery-3.4.1.min.js"></script>
  <script type="text/javascript" language="javascript" src="../Template/java/bootstrap.min.js"></script>
  <script type="text/javascript" language="javascript" src="ckeditor/ckeditor.js"></script>
  <script>
    CKEDITOR.replace('txt');
    CKEDITOR.config.entities_latin = false;
  </script>
<!--#Include file="Connection/EndConnection.asp"-->
</body>
</html>