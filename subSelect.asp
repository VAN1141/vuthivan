<!--#Include file="Connection/Connection.asp"-->
<%
    IDLVB = Request.QueryString("gr")
    IDVB = Request.QueryString("vbpl")
    IDC = Request.QueryString("chuong")
    IDM = Request.QueryString("muc")
    tn = Request.QueryString("tn")
    
    'txtNameVB_VN = ""
    'txtNameVB_JP = ""
    'txtNameVB_EN = ""
    txtNameC_VN = ""
    txtNameC_JP = ""
    txtNameC_EN = ""
    txtNameM_VN = ""
    txtNameM_JP = ""
    txtNameM_EN = ""
    select_bool = false
 
    if tn = "add" then
        IDLVB = Request.Form("IDLVB")
        IDVB = Request.Form("IDVB")
        IDC = Request.Form("IDC")
        IDM = Request.Form("IDM")
        'txtNameVB_VN = Request.Form("NameVB_VN")
        'txtNameVB_JP = Request.Form("NameVB_JP")
        'txtNameVB_EN = Request.Form("NameVB_EN")
        txtNameC_VN = Request.Form("NameC_VN")
        txtNameC_JP = Request.Form("NameC_JP")
        txtNameC_EN = Request.Form("NameC_EN")
        txtNameM_VN = Request.Form("NameM_VN")
        txtNameM_JP = Request.Form("NameM_JP")
        txtNameM_EN = Request.Form("NameM_EN")
        tn = ""
    elseif tn <> "" then
        if tn = "creat_link" then
            select_bool = true
        end if
        tn = " + " & chr(34) & "&tn=" & tn & chr(34)
    else
        tn = ""
    end if
    function chiso(txt)
        if instr(txt,"_") >0 then
            chiso = cint(left(txt,instr(txt,"_") -1))
        else
            chiso = cint(txt)
        end if
    end function
    'Response.Write(maID("15424_45"))
%>
<br>
<div class="form-group col-sm-6">
    <label for="LVB">Nhóm:</label>
    <select name="IDLVB" onChange='showCustomer("gr=" + this.value<%=tn%>);'>
        <%if cstr(IDLVB)="" then%> <option value="" selected>---Chọn Loại Văn Bản---</option> <%End if%>
        <option value="Luat" <%if cstr(IDLVB)="Luat" then%>selected <%End if%>>Luật & Pháp Lệnh</option>
        <option value="NghiDinh" <%if cstr(IDLVB)="NghiDinh" then%>selected <%End if%>>Nghị Định & Thông Tư</option>
        <option value="CongVan" <%if cstr(IDLVB)="CongVan" then%>selected <%End if%>>Công Văn & Quyết Định</option>
    </select>
</div>
<div class="form-group col-sm-6">
    <%if cstr(IDLVB) <> "" then%>
        <label for="VBPL">Văn Bản:</label>
        <select name="IDVB" onChange='showCustomer("vbpl=" + this.value + "&gr=" + document.getElementsByName("IDLVB")[0].value<%=tn%>);'>
            <%if cint(IDVB)= 0 then%> <option value=0 selected>---Chọn Văn Bản Pháp Luật---</option> <%End if%>
            <%
                Set rs = Server.CreateObject("ADODB.Recordset")
                rstext = "Select * From " &IDLVB
                rstext = rstext & " ORDER BY ID"
                rs.open rstext,DK0HP
                do until rs.EOF%>
                    <option <%if rs("ID")=cint(IDVB) then%> selected <%End if%> value=<%=rs("ID")%>>
                        <%=rs("NameVB_VN")%>
                    </option>
                    <%rs.MoveNext
                loop
                rs.Close
                Set rs = Nothing
            %>
            <!--<option value=-1 <%'if cint(IDVB)= -1 then%>selected <%'End if%>>★Thêm Văn Bản Pháp Luật Mới★</option>-->
        </select>
        <%'if cint(IDVB) = -1 then%><!--
        <div class="form-group">
            <input name="NameVB_VN" type="text" placeholder="Tiếng Việt" style="width: 495px" value="<%'=txtNameVB_VN%>">
            <input name="NameVB_JP" type="text" placeholder="日本語" style="width: 495px" value="<%'=txtNameVB_JP%>">
            <input name="NameVB_EN" type="text" placeholder="English" style="width: 495px" value="<%'=txtNameVB_EN%>">
        </div>-->
        <%'end if
    end if%>
    <br><br>
</div>
<div class="form-group col-sm-6">
    <%if cint(IDVB) <> 0 then%>
    <label for="Chuong">Chương:</label>
    <select name="IDC" onChange='showCustomer("chuong=" + this.value + "&gr=" + document.getElementsByName("IDLVB")[0].value 
        + "&vbpl=" + document.getElementsByName("IDVB")[0].value<%=tn%>);'>
        <option value=0 <%if chiso(IDC)=0 then%>selected <%End if%>>---Chọn Chương---</option>
        <%if cint(IDVB) > 0 then
            Set rs = Server.CreateObject("ADODB.Recordset")
            rstext = "Select * From Body_" &IDLVB & " Where IDVB=" &IDVB& " and Chuong>0 and Muc=0 and Dieu=0 and Khoan=0 and Diem=-1 " 
            rstext = rstext & " ORDER BY Chuong, Muc, Dieu, Khoan, Diem"
            rs.open rstext,DK0HP
            chuong = 0
            do until rs.EOF
                chuong = rs("Chuong")
                if chuong = chiso(IDC) and txtNameC_VN = "" then
                    txtNameC_VN = rs("ND_VN")
                    txtNameC_JP = rs("ND_JP")
                    txtNameC_EN = rs("ND_EN")
                End if%>
                <option <%if chuong=chiso(IDC) then %>selected <%End if%> value=<%=chuong &"_"& rs("ID")%>>
                    Chương <%=chuong%>
                </option>
                <%rs.MoveNext
            loop
            rs.Close
            Set rs = Nothing
        end if
        if select_bool = false then%>
        <option value=<%="-1_" &cstr(chuong) %> <%if chiso(IDC)=-1 then%> selected <%End if%>>★Thêm Chương Mới★</option>
        <%end if%>
    </select>
        <%if chiso(IDC) <> 0 then%>
        <div class="form-group">
            <input name="NameC_VN" type="text" placeholder="Tiếng Việt" style="width: 495px" value="<%=txtNameC_VN%>">
            <input name="NameC_JP" type="text" placeholder="日本語" style="width: 495px" value="<%=txtNameC_JP%>">
            <input name="NameC_EN" type="text" placeholder="English" style="width: 495px" value="<%=txtNameC_EN%>">
        </div>
        <%end if
    end if%>
</div>
<div class="form-group col-sm-6">
    <%if chiso(IDC) <> 0 then%>
    <label for="Muc">Mục:</label>
    <select name="IDM" onChange='showCustomer("muc=" + this.value + "&gr=" + document.getElementsByName("IDLVB")[0].value + "&vbpl=" 
        + document.getElementsByName("IDVB")[0].value + "&chuong=" + document.getElementsByName("IDC")[0].value<%=tn%>);'>
        <option value=0 <%if chiso(IDM)=0 then%>selected <%End if%>>---Chọn Mục---</option>
        <%if chiso(IDC) > 0 then
            Set rs = Server.CreateObject("ADODB.Recordset")
            rstext = "Select * From Body_" &IDLVB & " Where IDVB=" &IDVB& " and Chuong=" & chiso(IDC) & " and Muc>0 and Dieu=0 and Khoan=0 and Diem=-1" 
            rstext = rstext & " ORDER BY Chuong, Muc, Dieu, Khoan, Diem"
            rs.open rstext,DK0HP
            muc = 0
            do until rs.EOF
                muc = rs("Muc")
                if muc = chiso(IDM) and txtNameM_VN = "" then
                    txtNameM_VN = rs("ND_VN")
                    txtNameM_JP = rs("ND_JP")
                    txtNameM_EN = rs("ND_EN")
                End if%>
                <option <%if muc = chiso(IDM) then %>selected  <%End if%> value=<%=muc  &"_"& rs("ID")%>>
                    Mục <%=muc%>
                </option>
                <%rs.MoveNext
            loop
            rs.Close
            Set rs = Nothing
        end if
        if select_bool = false then%>
        <option value=<%="-1_" & cstr(muc)%> <%if chiso(IDM)=-1 then%> selected <%End if%>>★Thêm Mục Mới★</option>
        <%end if%>
    </select>
        <%if chiso(IDM)<>0 then%>
        <div class="form-group">
            <input name="NameM_VN" type="text" placeholder="Tiếng Việt" style="width: 495px" value="<%=txtNameM_VN%>">
            <input name="NameM_JP" type="text" placeholder="日本語" style="width: 495px" value="<%=txtNameM_JP%>">
            <input name="NameM_EN" type="text" placeholder="English" style="width: 495px" value="<%=txtNameM_EN%>">
        </div>
        <%end if
    end if%>
</div>
<!--#Include file="Connection/EndConnection.asp"-->