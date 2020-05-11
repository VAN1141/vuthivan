<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#Include file="Connection/Connection.asp"-->
<%
function chiso(byref txt)
    if instr(txt,"_") >0 then
        chiso = clng(left(txt,instr(txt,"_") -1))
        vt_chiso = InStr(txt, "_")
        If vt_chiso < Len(txt) Then
            txt = clng(Mid(txt, InStr(txt, "_") + 1))
        Else
            txt = 0
        End If
    else
        chiso = clng(txt)
        txt = chiso
    end if
end function
IDLVB = Request.Form("IDLVB")
IDVB = clng(Request.Form("IDVB"))
if IDVB = -1 then
    txtNameVB_VN = Request.Form("NameVB_VN")
    txtNameVB_JP = Request.Form("NameVB_JP")
    txtNameVB_EN = Request.Form("NameVB_EN")
    'creat new nhom VB
    Set rs = CreateObject("ADODB.Recordset")
    sql="SELECT * FROM " &IDLVB & " ORDER BY ID"
    rs.Open sql,DK0HP,3,3
    rs.Addnew
    rs("So_Kyhieu") = "ABC"
    rs("NameVB_VN") = txtNameVB_VN
    rs("NameVB_JP") = txtNameVB_JP
    rs("NameVB_EN") = txtNameVB_EN
    rs.Update
    rs.movelast
    IDVB = rs("ID")
    rs.close
'    Response.Write("vbpl" &cstr(IDVB))
end if

IDC = Request.Form("IDC")
numC = chiso(IDC)
txtNameC_VN = Request.Form("NameC_VN")
txtNameC_JP = Request.Form("NameC_JP")
txtNameC_EN = Request.Form("NameC_EN")
if numC = -1 then   ' them chuong moi
    if txtNameC_VN <> "" then
        numC = IDC + 1
        sql="INSERT INTO Body_" &IDLVB & " (IDVB,Chuong,Muc,Dieu,Khoan,Diem, ND_VN,ND_JP,ND_EN,Bookmark)"
        sql=sql & " VALUES "
        sql=sql & "(" &IDVB& "," &numC& ",0,0,0,-1,'" &txtNameC_VN& "','" &txtNameC_JP& "','" &txtNameC_EN& "','" & Int2Str(IDVB,3) & Int2Str(numC,3) & "0000000000000')"
        'on error resume next
        DK0HP.Execute sql
        'on error goto 0
    else
        numC = 0
    end if
else
    sql="DELETE FROM Body_" &IDLVB 
    sql=sql & " WHERE IDVB=" &IDVB& " and Chuong=" &numC& " and Muc=0 and (Dieu > 0 or Khoan > 0 or Diem > -1) "
    'on error resume next
    DK0HP.Execute sql
    'on error goto 0
    
    if numC >0  then
        sql="UPDATE Body_" &IDLVB& " SET "
        sql=sql & "ND_VN='" &txtNameC_VN& "',"
        sql=sql & "ND_JP='" &txtNameC_JP& "',"
        sql=sql & "ND_EN='" &txtNameC_EN& "'"
    '    sql=sql & " WHERE ID=" & IDC
        sql=sql & " WHERE IDVB=" &IDVB& " and Chuong=" &numC& " and Muc=0 and Dieu=0 and Khoan=0 and Diem=-1 "
        'on error resume next
        DK0HP.Execute sql
        'on error goto 0
    end if
end if

IDM = Request.Form("IDM")
numM = chiso(IDM)
txtNameM_VN = Request.Form("NameM_VN")
txtNameM_JP = Request.Form("NameM_JP")
txtNameM_EN = Request.Form("NameM_EN")
if numM = -1 then   ' them muc moi
    if txtNameM_VN <> "" then
        numM = IDM + 1
        sql="INSERT INTO Body_" &IDLVB & " (IDVB,Chuong,Muc,Dieu,Khoan,Diem, ND_VN,ND_JP,ND_EN,Bookmark)"
        sql=sql & " VALUES "
        sql=sql & "(" &IDVB& "," &numC& "," &numM& ",0,0,-1,'" &txtNameM_VN& "','" &txtNameM_JP& "','" &txtNameM_EN& "','" & Int2Str(IDVB,3) & Int2Str(numC,3) & Int2Str(numM,3) & "0000000000')"
        'Response.Write(sql)
        'on error resume next
        DK0HP.Execute sql
        'on error goto 0
    else
        numM = 0
    end if
else
    sql="DELETE FROM Body_" &IDLVB 
    sql=sql & " WHERE IDVB=" &IDVB& " and Chuong=" &numC& " and Muc=" &numM & " and (Dieu > 0 or Khoan > 0 or Diem > -1)"
    'on error resume next
    DK0HP.Execute sql
    'on error goto 0
    if numM > 0 then
        sql="UPDATE Body_" &IDLVB& " SET "
        sql=sql & "ND_VN='" &txtNameM_VN& "',"
        sql=sql & "ND_JP='" &txtNameM_JP& "',"
        sql=sql & "ND_EN='" &txtNameM_EN& "'"
'        sql=sql & " WHERE ID=" & IDM
        sql=sql & " WHERE IDVB=" &IDVB& " and Chuong=" &numC& " and Muc=" &numM & " and Dieu=0 and Khoan=0 and Diem=-1"
        'Response.Write(sql)
        'on error resume next
        DK0HP.Execute sql
        'on error goto 0
    end if
end if

IDd = clng(Request.Form("dieu_begin")) - 1
IDk = 0
IDi = 0
IDi_temp = 0
for i = 0 to clng(Request.Form("row"))
    NDVN = Request.Form("NDVN" &cstr(i))
    NDJP = Request.Form("NDJP" &cstr(i))
    NDEN = Request.Form("NDEN" &cstr(i))
    skip = false
    select case Request.Form("op" &cstr(i))
    case "d"
        IDd = IDd + 1
        IDk = 0
        IDi = -1
        IDi_temp = IDi
    case "k"
        IDk = IDk + 1
        IDi = -1
        IDi_temp = IDi
    case "i"
        if IDi < 0 then
            IDi = 0
        ElseIf IDi = 0 then
            IDi = IDi_temp
        end if
        IDi = IDi + 1
        'diem = chr(IDi)
        IDi_temp = IDi
    Case else
        IDi = 0
        if NDVN = "" and NDJP = "" and NDEN = "" then
            skip = true
        end if
    end select
    if skip = false then
        NDVN = Add_link_bookmark(NDVN, IDd)
        Response.Write(NDVN)
        Bookmark =  Int2Str(IDVB,3) & Int2Str(numC,3) & Int2Str(numM,3) & Int2Str(IDd,4) & Int2Str(IDk,3) & Int2Str(IDi_temp+1,3)
        sql="INSERT INTO Body_" &IDLVB & " (IDVB,Chuong,Muc,Dieu,Khoan,Diem, ND_VN,ND_JP,ND_EN,Bookmark)"
        sql=sql & " VALUES "
        sql=sql & "(" &IDVB& "," &numC& "," &numM& "," &IDd& "," &IDk& "," &IDi& ","
        sql=sql & "'" & NDVN & "','" & NDJP & "','" & NDEN & "','" & Bookmark & "')"
        'Response.Write(sql)
        'on error resume next
        DK0HP.Execute sql
        'on error goto 0
    end if
next

Response.Redirect("VBPL_Body_Add.asp")
%>

<% '------------------Function--------------------
const dieu = "điều"
const dieunay = "điều này"
const khoan = "khoản"
const diem = "điểm"
Function Add_link_bookmark(Byval txt_row, byval num_dieunay) 
    i_dieu = 0
    Do While InStrRev(LCase(txt_row), dieu, i_dieu - 1) > 0
        i_dieu = InStrRev(LCase(txt_row), dieu, i_dieu - 1)
        num_dieu = 0
        num_khoan = 0
        num_diem = 0
        vt_start = i_dieu
        vt_stop = 0
        If LCase(Mid(txt_row, i_dieu, 8)) = dieunay Then
            num_dieu = num_dieunay
            vt_stop = i_dieu + 7
        Else
            vt = InStr(i_dieu + 5, txt_row, " ")
            If vt = 0 Then
                str_temp = Mid(txt_row, i_dieu + 5)
                vt_stop = Len(txt_row)
            Else
                str_temp = Mid(txt_row, i_dieu + 5, vt - i_dieu - 5)
                vt_stop = vt - 1
            End If
            If str_temp <> "" Then
                If IsNumeric(str_temp) Then
                    num_dieu = clng(str_temp)
                End If
            End If
        End If
        if num_dieu > 0 then
            vt = InStrRev(LCase(txt_row), khoan, i_dieu)
            If vt = 0 Then
                'khong co khoan
            Else
                vt_start = vt
                str_temp = Mid(txt_row, vt + 6, i_dieu - vt - 7)
                If str_temp <> "" Then
                    If IsNumeric(str_temp) Then
                        num_khoan = clng(str_temp)
                        vt2 = InStrRev(LCase(txt_row), diem, vt)
                        If vt2 = 0 Or vt - vt2 > 8 Then
                            'khong co diem
                        Else
                            vt_start = vt2
                            str_temp = Mid(txt_row, vt2 + 5, 1)
                            num_diem = AscW(str_temp)
                            If num_diem = 101 Then
                                num_diem = 102
                            ElseIf num_diem = 273 Then
                                num_diem = 101
                            End If
                            num_diem = num_diem - 96
                        End If
                        str_temp = Mid(txt_row, vt_start, vt_stop - vt_start + 1)
                        txt_row = Left(txt_row, vt_start - 1) & "<a href=" & chr(34) & "#" & Int2Str(num_dieu, 4) & Int2Str(num_khoan, 3) & Int2Str(num_diem, 3) & chr(34) & ">" & str_temp & "</a>" & Mid(txt_row, vt_stop + 1)
                    End If
                End If
            End If
        end if
        If i_dieu <= 1 Then
            Exit Do
        End If
    Loop
    Add_link_bookmark = txt_row
End Function
Function Int2Str(ByVal i_num, ByVal numberOfDigits)
  Int2Str = Right("00000" & i_num, numberOfDigits)
End Function

%>
<!--#Include file="Connection/EndConnection.asp"-->