<div class="sidebar"> <!-- data-spy="affix" data-offset-top="205"> -->
<div id="MenuLeft">
    <h3 style="margin-top:0;">
        Menu
    </h3>
 
    <%
    sub Menu(byval table, byval IDVB)
        ND = langin("ND_VN","ND_JP","ND_EN")
        Chuong_pre = 0
        Muc_pre = 0
        Dieu_pre =0
        ul_Muc = false
        ul_Dieu = false
        Set rs = Server.CreateObject("ADODB.Recordset")
        rstext = "Select * From Body_" & table & " Where IDVB=" &IDVB& " and Khoan=0 and Diem=-1"
        rstext = rstext & " ORDER BY Chuong,Muc,Dieu"
        'response.write(rstext)
        rs.open rstext,DK0HP
        do until rs.EOF
            lbl = rs(ND)
            if IsNull(lbl) then
                lbl = rs("ND_VN")
                if IsNull(lbl) then
                    lbl = "(empty)"
                end if
            end if
            link = "#" & rs("Bookmark")
            if Chuong_pre <> rs("Chuong") then
                if ul_Dieu = true then
                    response.write("</li> </ul>")
                    ul_Dieu = false
                end if
                if ul_Muc = true then
                    response.write("</li> </ul>")
                    ul_Muc = false
                    Muc_pre = 0
                end if
                if rs("Chuong") = 1 then%>
                    <ul class='w3-ul menu_left sub_menu'> 
                        <li><span class='ListIcon ListIcon-right'></span> <a href='<%=link%>'><%=lbl%></a>
                        <%ul_Chuong = true
                else%>
                        </li> <li><span class='ListIcon ListIcon-right'></span> <a href='<%=link%>'><%=lbl%></a>
                <%end if
                Chuong_pre = rs("Chuong")
            elseif Muc_pre <> rs("Muc") then
                if ul_Dieu = true then
                    response.write("</li> </ul>")
                    ul_Dieu = false
                end if
                if rs("Muc") = 1 then%>
                    <ul class='w3-ul menu_left sub_menu'>
                        <li><span class='ListIcon ListIcon-right'></span> <a href='<%=link%>'><%=lbl%></a>
                        <%ul_Muc = true
                else%>
                        </li> <li><span class='ListIcon ListIcon-right'></span> <a href='<%=link%>'><%=lbl%></a>
                <%end if
                Muc_pre = rs("Muc")
            elseif Dieu_pre < rs("Dieu") then
                if ul_Dieu = false then%>
                    <ul class='w3-ul menu_left sub_menu'>
                        <li><span class='ListIcon ListIcon-right'></span> <a href='<%=link%>'><%=lbl%></a>
                        <%ul_Dieu = true
                else%>
                        </li> <li><span class='ListIcon ListIcon-right'></span> <a href='<%=link%>'><%=lbl%></a>
                <%end if
                Dieu_pre = rs("Dieu")
            end if
            rs.MoveNext
        loop
        if ul_Dieu = true then
            response.write("</li> </ul>")
        end if
        if ul_Muc = true then
            response.write("</li> </ul>")
        end if
        if ul_chuong = true then
            Response.write("</li> </ul>")
        end if
        rs.Close
        Set rs = Nothing
    end sub

    sub CreateMenu(byval IDLVB)
        ND = langin("NameVB_VN","NameVB_JP","NameVB_EN")
        Set rs1 = Server.CreateObject("ADODB.Recordset")
        rstext = "SELECT * FROM " &IDLVB 
        'Response.write(rstext)
        rs1.open rstext,DK0HP
        ul_VB = false
        do until rs1.EOF
            lbl = rs1(ND)
            if IsNull(lbl) then
                lbl = rs1("NameVB_VN")
                if IsNull(lbl) then
                    lbl = "(empty)"
                end if
            end if
            if ul_VB = false then
                ul_VB = true%>
                <ul class='w3-ul menu_left sub_menu'> 
                    <li><span class='ListIcon ListIcon-right'></span> <a href='#'><%=lbl%></a>
            <%else%>
                    </li> <li><span class='ListIcon ListIcon-right'></span> <a href='#'><%=lbl%></a>
            <%end if
            call Menu(IDLVB ,rs1("ID"))
            rs1.MoveNext
        loop
        if ul_VB = true then
            Response.write("</li> </ul>")
        end if
        rs1.Close
        Set rs1 = Nothing
    end sub
    %>
 
    <ul class="w3-ul menu_left menu_tong">
        <li><span class='ListIcon ListIcon-right'></span><a href="#">Luật & Pháp Lệnh</a>
            <% call CreateMenu("Luat") %>
        </li>
        <li><span class='ListIcon ListIcon-right'> </span><a href="#">Nghị Định & Thông Tư</a>
            <% call CreateMenu("NghiDinh") %>
        </li>
        <li><span class='ListIcon ListIcon-right'> </span><a href="#">Công Văn & Quyết Định</a>
            <% call CreateMenu("CongVan") %>
        </li>
    </ul>
    
</div>
<!--#Include file="QuangCao.asp"-->
</div>