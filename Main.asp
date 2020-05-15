<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#Include file="Connection/Connection.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="Images/css/tabcontent.css">
<script type="text/javascript" src="Images/java/tabcontent.js"></script>
</head>
<body topmargin="0" leftmargin="0">
<table width="500" border="0" cellpadding="0" cellspacing="0">	
		<%
		Set DK0Total = Server.CreateObject("ADODB.Recordset")
		DK5text = "Select * From Nhom where Nhom_Lock = False"
		DK0Total.open DK5text,DK0HP
		Do while not DK0Total.EOF
		aIDNhomBV = DK0Total("Nhom_Id")	
		%>
		<tr>
		<td valign="top">
			<ul id="maintab<%=DK0Total("Nhom_Id")%>" class="shadetabs">
			<%		
				Set DK0Conn = Server.CreateObject("ADODB.Recordset")
				DK6text = "Select * From Loai where Loai_Lock = False and Nhom_Id ="&aIDNhomBV&" Order By Loai_Order ASC"
				DK0Conn.open DK6text,DK0HP
				Do while not DK0Conn.EOF
		%>
          <li class=""><a href="#" rel="Loai<%=DK0Conn("Loai_Id")%>"><%=DK0Conn("LoaiVN_Name")%></a></li>
		 <%
		  	DK0Conn.Movenext
			LOOP
			DK0Conn.close
			set DK0Conn = Nothing
		
		%>
       </ul>
	   
	   <div class="tabcontentstyle">
	   <%	
			Set DK0Conn = Server.CreateObject("ADODB.Recordset")
			DK9text = "Select * From Loai where Loai_Lock = False and Nhom_Id ="&aIDNhomBV&" Order By Loai_Order ASC"
			DK0Conn.open DK9text,DK0HP
			Do while not DK0Conn.EOF
			aIDLoaiBV = DK0Conn("Loai_Id")
		%>
          <div style="display: none;" id="Loai<%=DK0Conn("Loai_Id")%>" class="tabcontent">hahaah</div>
		 <%
		  	DK0Conn.Movenext
			LOOP
			DK0Conn.close
			set DK0Conn = Nothing
			%>
			</div>
			<script type="text/javascript">
				initializetabcontent("maintab<%=DK0Total("Nhom_Id")%>", "maintab2")
			</script>
			</td>
	</tr>

		<%
		DK0Total.Movenext
		LOOP
		DK0Total.Close
		set DK0Total = Nothing
		%>
	   
	<tr>
		<td height="5">&nbsp;</td>
	</tr>
</table>
			
</body>
</html>
<!--#Include file="Connection/EndConnection.asp"-->