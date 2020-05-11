<html>

<head>
<meta name="GENERATOR" content="Microsoft FrontPage 5.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>New Page 3</title>
<link rel="stylesheet" type="text/css" href="Css/cms.css">
</head>

<body bgcolor="#F7F7EF">
<%
Select Case CLng(Request.QueryString("err"))
  Case 10%>
        <p align="center" style="line-height: 200%">
            <font color="#FF0000"><b>Tin, bài &#273;ã &#273;&#432;&#7907;c xoá thành công!</b></font>
         </p>
<%Case 90%>
        <p align="center" style="line-height: 200%"><font color="#FF0000"><b>Tên ng&#432;&#7901;i 
        s&#7917; d&#7909;ng không th&#7875; là kho&#7843;ng tr&#7855;ng!</b></font></p>
<%Case 91%>
        <p align="center" style="line-height: 200%"><font color="#FF0000"><b>Ki&#7875;m tra 
        l&#7841;i m&#7853;t kh&#7849;u c&#7911;a b&#7841;n!<br>
        </b></font><font color="#808080">(D&#7919; li&#7879;u trong ô nh&#7853;p M&#7853;t kh&#7849;u và ô nh&#7853;p Gõ l&#7841;i 
        m&#7853;t kh&#7849;u ph&#7843;i gi&#7889;ng nhau)</font></p>
<%Case 92%>
        <p align="center" style="line-height: 200%"><font color="#FF0000"><b>Ng&#432;&#7901;i dùng 
        này &#273;ã t&#7891;n t&#7841;i!<br>
        </b></font><font color="#808080">(Ng&#432;&#7901;i dùng không th&#7875; trùng tên v&#7899;i nhau)</font></p>
<%Case 20%>
        <p align="center" style="line-height: 200%"><font color="#FF0000"><b>Tên ho&#7863;c 
        m&#7853;t kh&#7849;u không chính xác!<br>
        </b></font><font color="#808080">(N&#7871;u v&#7851;n không truy c&#7853;p &#273;&#432;&#7907;c hãy liên h&#7879; v&#7899;i 
        ng&#432;&#7901;i qu&#7843;n tr&#7883;)</font></p>
<%Case 21%>
        <p align="center" style="line-height: 200%"><font color="#FF0000"><b>B&#7841;n không 
        có quy&#7873;n s&#7917; d&#7909;ng ch&#7913;c n&#259;ng này!</b></font></p>
<%Case 22%>
        <p align="center" style="line-height: 200%"><font color="#FF0000"><b>Ch&#7913;c n&#259;ng 
        này ch&#432;a cài &#273;&#7863;t!<br>
        </b></font><font color="#808080">(Liên h&#7879; v&#7899;i nhà cung c&#7845;p &#273;&#7875; bi&#7871;t thêm chi 
        ti&#7871;t)</font></p>
<%Case 23%>
        <p align="center" style="line-height: 200%"><font color="#FF0000"><b>M&#7853;t kh&#7849;u &#273;ã 
        &#273;&#432;&#7907;c &#273;&#7893;i thành công!<br>
        </b></font><font color="#808080">(Hãy s&#7917; d&#7909;ng m&#7853;t kh&#7849;u m&#7899;i t&#7841;i l&#7847;n truy c&#7853;p sau)</font></p>
<%Case 24%>
        <p align="center" style="line-height: 200%"><font color="#FF0000"><b>Không tìm 
        th&#7845;y ng&#432;&#7901;i dùng!</b></font></p>
<%End Select%>
<p align="center">
            <button onClick="history.back();" name="B2" style="width: 80; height: 22"><b>
            <font face="Verdana" size="1">&lt;&lt; Quay l&#7841;i</font></b></button></p>
</body>

</html>