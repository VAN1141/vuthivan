<%
if CheckMod=3 then
	Response.Redirect "error_info.asp?err=21"
end if
%>
<table border="0" cellpadding="7" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber1">
  <tr>
    <td width="100%"><font size="3" color="#4A865A"><b>Danh sách ng&#432;&#7901;i dùng</b></font></td>
  </tr>
  <tr>
    <td width="100%">
<%
nRecordCount = 0
      
sSQL = "SELECT * FROM Admin WHERE User<>'Admin' ORDER BY Decentralization DESC, User"
Set adoRec = Server.CreateObject("ADODB.Recordset")
adoRec.Open sSQL, DK0HP, 3, 3
      
nRecordCount = adoRec.RecordCount

adoRec.PageSize=10

nCurrentPage = CLng(Request.QueryString("page"))
if nCurrentPage=0 then
	nCurrentPage = 1
end if

    if adoRec.PageCount>1 then
%>
<div align="right">
    <table border="0" cellpadding="3" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" id="AutoNumber13">
      <tr>
        <td nowrap>Trang:</td>
        <td nowrap>
            <select name="GotoPage" onChange="javascript:location.href='user_list.asp?page='+this.value;" size="1"  style="font-family: Verdana; font-size: 8pt">
            <%
            For i=1 to adoRec.PageCount
            	if i=nCurrentPage then
            		Response.Write "<option value=""" & i & """ selected>" & i & "</option>" 
            	else
            		Response.Write "<option value=""" & i & """>" & i & "</option>" 
            	end if
            Next
            %>
            </select>
        </td>
        <td nowrap>
            trên t&#7893;ng s&#7889; <b><%=adoRec.PageCount%></b> trang</td>
      </tr>
    </table>    
</div>
<%
    end if
%>
    <p>
    <table border="0" cellpadding="3" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber2">
      <tr>
        <td width="5%"align="center" bgcolor="#DEDBCE">&nbsp;</td>
        <td width="15%" align="center" nowrap bgcolor="#DEDBCE">T&#234;n truy c&#7853;p</td>
		<td width="20%" align="center" nowrap bgcolor="#DEDBCE">H&#7885; tên</td>
        <td width="10%" align="center" bgcolor="#DEDBCE">G.Tính</td>
		<td width="25%" align="center" nowrap bgcolor="#DEDBCE">Địa chỉ email</td>
        <td width="20%" align="center" bgcolor="#DEDBCE">Phone</td>
        <td width="5%" align="center" nowrap bgcolor="#DEDBCE">Quy&#7873;n</td>
      </tr>
      <form name="messageList" method="POST" action="user_delete.asp">
      <%
      if nRecordCount>0 then
      
      adoRec.AbsolutePage = nCurrentPage      
      
      For i=1 to adoRec.PageSize
      %>
		<%
		if( adoRec("Decentralization")<>1) then
		%>
	  
      <tr>
        <td align="center">
		<%
		if( adoRec("Decentralization")=3 ) then
		%>
		&nbsp;
		<%else%>
		<input type="checkbox" name="chkDelete" value="<%=adoRec("Admin_Id")%>">
		<%end if%>
		</td>
        <td align="center" nowrap>
		<a href="Admin_add.asp?tinhnang=edit&id=<%=adoRec("Admin_Id")%>"><font color="#525152"><%=adoRec("User")%></font></a>&nbsp;
		</td>
		<td align="center" ><%=adoRec("Admin_FullName")%>&nbsp;</td>
        <td align="center"><%if adoRec("Gender")= true then Response.Write "Male" else Response.Write "Female" end if%>&nbsp;</td>
		<td align="center" ><%=adoRec("Admin_Email")%>&nbsp;</td>
        <td align="center"><%=adoRec("Admin_Phone")%>&nbsp;</td>
        <td align="center" nowrap>
        <%
        Select Case adoRec("Decentralization")
			Case 3
				Response.Write "Website administrator"
        	Case 2
        		Response.Write "Members only read and post"
        End Select
        %>
        &nbsp;</td>
      </tr>
      <%
      adoRec.MoveNext
      if adoRec.EOF then Exit For
		end if
      Next
      
      else          
      %>
      <tr>
        <td colspan="7">Không có ng&#432;&#7901;i dùng nào!</td>
      </tr>
      <%
      end if
      %>
      <tr>
        <td colspan="7">&nbsp;</td>
      </tr>
      <tr>
        <td colspan="7" align="center">
            <b><ul list-style-type = none color =black>
            <li list-style = "none" ><a href="user_new.asp"><img src="..\Images\edit.gif">Tạo mới  </a></li>
            </ul></b>
            <button onClick="ValidateForm();" name="B3" style="width: 80; height: 22"><b>
            <font face="Verdana" size="1">Xoá</font></b></button></td>
      </tr>
      <input type="hidden" name="msgid" value="">
      </form>
    </table>
<%    
Set adoRec = Nothing    
%>    
    </td>
  </tr>
  <tr>
    <td width="100%" height="400px">&nbsp;</td>
  </tr>  
</table>
<script language="Javascript">
function ValidateForm()
{
	CheckDelete();
	//alert(document.messageList.msgid.value);
	document.messageList.submit();
}

function CheckDelete()
{
 var sArray;
 
 sArray = "('0'";
 for (var i=0;i<document.messageList.elements.length;i++)
 {
  var e=document.messageList.elements[i];
  
  if (e.checked)
  sArray = sArray + ",'" + e.value + "'";       
 }
 
 sArray = sArray + ")";
 document.messageList.msgid.value=sArray;
}
</script>
