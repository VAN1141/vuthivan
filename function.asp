<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#Include file="Connection/Connection.asp"-->
<%
'response.Write(GetNewContent(1))
function GetNewContent(sgr)	
	dim loaibaivietsom, thoigianvietsom
	Set DK0Total = Server.CreateObject("ADODB.Recordset")
	DK5text = "SELECT Nhom_Id FROM Nhom WHERE Nhom_Lock = False AND Nhom_Id="&CInt(sgr)
	DK0Total.open DK5text,DK0HP
	Do while not DK0Total.EOF
		aIDNhomBV = DK0Total("Nhom_Id")
		'response.Write("Nhóm: "&aIDNhomBV&"<br>")
		'######################################## start Nhom
			thoigianvietsom=DateVN(now()-1000)
			Set DK0Conn = Server.CreateObject("ADODB.Recordset")
				DK9text = "SELECT Loai_Id FROM Loai WHERE Loai_Lock = False AND Nhom_Id ="&CInt(aIDNhomBV)&" ORDER BY Loai_Id ASC"
				DK0Conn.open DK9text,DK0HP
				Do while not DK0Conn.EOF
				aIDLoaiBV = DK0Conn("Loai_Id")
				'response.Write("Loại: "&aIDLoaiBV&" : ")
					
					Set rsTemp = Server.CreateObject("ADODB.Recordset")
					sqltext = "SELECT BaiViet_Date FROM BaiViet WHERE Loai_Id="&CInt(aIDLoaiBV)&" AND BaiViet_Lock=false ORDER BY BaiViet_Date DESC"
					rsTemp.open sqltext,DK0HP
						
						if rsTemp.recordcount <> 0 then
							'response.Write(thoigianvietsom&" - "&DateVN(rsTemp("BaiViet_Date"))&"<br>")
							if DateVN(rsTemp("BaiViet_Date")) > thoigianvietsom then
								thoigianvietsom =DateVN(rsTemp("BaiViet_Date"))
								loaibaivietsom = aIDLoaiBV
							end if
						end if
					rsTemp.Close
					set rsTemp = Nothing
					
				DK0Conn.Movenext
				LOOP
				DK0Conn.Close
				set DK0Conn = Nothing
			
		'######################################## end Nhom
		DK0Total.Movenext
	LOOP
	DK0Total.Close
	set DK0Total = Nothing
	'response.Write("<br>Bài viết sớm: "&loaibaivietsom)
	GetNewContent = loaibaivietsom
end function
%>
<!--#Include file="Connection/EndConnection.asp"-->