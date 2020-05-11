<%
IDLVB = Request.QueryString("gr")
IDVB = Request.QueryString("vbpl")

if IDLVB <> "" and IDVB <> "" then
    Set rs = Server.CreateObject("ADODB.Recordset")
    rstext = "SELECT * FROM " &IDLVB& " Where ID=" &IDVB
    rs.open rstext,DK0HP
    If rs.EOF Then
        response.write("Không có dữ liệu!")
        rs.Close
        Set rs = Nothing
    else
        lbl = rs(langin("NameVB_VN","NameVB_JP","NameVB_EN"))
        if IsNull(lbl) then
            lbl="(empty)"
        end if%>
        <h2 class="Name_VBPL"><%=lbl%></h2>

        <%rs.Close
        ND = langin("ND_VN","ND_JP","ND_EN")
        Chuong_pre = 0
        Muc_pre = 0
        Dieu_pre =0
        Set rs = Server.CreateObject("ADODB.Recordset")
        rstext = "Select * From Body_" &IDLVB& " Where IDVB=" &IDVB& " ORDER BY Bookmark"
        rs.open rstext,DK0HP
        do until rs.EOF
            lbl = rs(ND)
            if IsNull(lbl) then
                lbl = "(empty)"
            end if
            if rs("Chuong")<>0 and rs("Muc")=0 and rs("Dieu")=0 and rs("Khoan")=0 and rs("Diem")=-1 Then%>
                <h3 class="chuong" id="<%=rs("Bookmark")%>"><span id="<%=right(rs("Bookmark"),10)%>"><%=lbl%></span></h3>
            <%elseif rs("Muc")<>0 and rs("Dieu")=0 and rs("Khoan")=0 and rs("Diem")=-1 Then%>
                <h4 class="muc" id="<%=rs("Bookmark")%>"><span id="<%=right(rs("Bookmark"),10)%>"><%=lbl%></span></h4>
            <%elseif rs("Dieu")<>0 and rs("Khoan")=0 and rs("Diem")=-1 Then%>
                <h5 class="dieu" id="<%=rs("Bookmark")%>"><span id="<%=right(rs("Bookmark"),10)%>"><%=lbl%></span></h5>
            <%else%>
                <p id="<%=rs("Bookmark")%>"><span id="<%=right(rs("Bookmark"),10)%>"><%=lbl%></span></p>
            <%end if
            rs.MoveNext
        loop
        rs.Close
        Set rs = Nothing
    end if
else
    response.write("Không có dữ liệu!")
end If
%>
