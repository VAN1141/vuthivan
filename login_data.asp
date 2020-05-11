<%@CODEPAGE=65001%>
<%Response.Charset = "utf-8"%>
<html>

<head>
<meta name="GENERATOR" content="Microsoft FrontPage 5.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<meta http-equiv="Content-Type" content="text/html; charset=utf-
8">
<title>Đăng nhập</title>
</head>
<body>
<%
Dim DK0HP,Sender
Set DK0HP = server.CreateObject("ADODB.Connection")
'DK0HP.connectionstring = "Provider = Microsoft.Jet.OLEDB.4.0; Data source="&"\\tis-ntv\Web\EIW\VBPL\Admin\Sub\Database\VBPL.mdb"
DK0HP.connectionstring = "Provider = Microsoft.Jet.OLEDB.4.0; Data source="&server.MapPath("Sub/Database/VBPL.mdb")
'DK0HP.connectionstring = "Provider=Microsoft.ACE.OLEDB.12.0; Data source="&server.MapPath("Admin/Sub/Database/VBPL.accdb") & ";Persist Security Info=False;"
'DK0HP.connectionstring = "Driver={Microsoft Access Driver (*.mdb, *.accdb)};Dbq=" & server.MapPath("Admin/Sub/Database/VBPL.accdb") & ";Uid=Admin;Pwd=;"
DK0HP.CursorLocation = 3
'Response.write(server.MapPath("Sub/Database/VBPL.mdb"))
DK0HP.Open
set rs=Server.CreateObject("ADODB.recordset")
' build SQL statement
vUserID = Request("TENDANNHAP")
vUserPassword = Request("MAT_KHAU")
'Response.Write(vUserID)
sql ="SELECT Admin_FullName, User FROM Admin WHERE Admin_FullName = " & "'" & vUserID & "'"
'Response.Write(sql)
rs.Open sql, DK0HP
'for each x in rs.Fields
	'Response.Write(x.name)
    'Response.Write(" = ")
    'Response.Write(x.value & "<br>")
'next
if rs("Admin_FullName") <> vUserID then
Response.Write "<p class=txtText>Không tồn tại tên đăng nhập.Hãy <a href='login.asp'>đăng nhập lại</a>"
else
if rs("User") <> vUserPassword then
Response.Write "<p class=txtText>Mật khẩu nhập vào sai. Hãy<a href='login.asp'>đăng nhập lại</a>"
else
Response.Write "<p class=txtText>Đăng nhập thành công. Hãy<a href='BaiViet_list.asp'>làm tiếp</a>"
Session("LoginOK") = 1
end if
end if
%>
<%
rs.Close
Set rs = NOTHING
DK0HP.Close
Set DK0HP = NOTHING
%>
</body>
</html>