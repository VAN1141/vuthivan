<%
if CheckMod = 3  and CheckMod = 2 then
	Response.Redirect "error_info.asp?err=21"
else
%>
<script language="javascript">
function test()
{
if(EditMessage.Username.value=="") 
	{
	alert("Ban chua nhap ten dang nhap");
	EditMessage.Username.focus();
	}
else
	if(EditMessage.UserPw.value=="") 
		{
		alert("Ban chua nhap mat khau");
		EditMessage.UserPw.focus();
		}
	else
		if(EditMessage.UserPw.value!=EditMessage.ConfirmPw.value) 
			{
			alert("Mat khau xac nhan lai khong hop le");
			EditMessage.ConfirmPw.focus();
			}
		else
			if(EditMessage.UserRealName.value=="") 
				{
				alert("Ban chua nhap ho ten");
				EditMessage.UserRealName.focus();
				}
			else
				if(EditMessage.Gender.value=="-1") 
						{
						alert("Ban chua chon gioi tinh");
						EditMessage.Gender.focus();
						}
					else
						if(EditMessage.Address.value=="") 
							{
							alert("Ban chua nhap dia chi");
							EditMessage.Address.focus();
							}
						else
							if(EditMessage.UserDept.value=="") 
								{
								alert("Ban chua nhap phong ban");
								EditMessage.UserDept.focus();
								}
							else
								EditMessage.submit();
			
}
</script>
<center>
<table border="0" cellpadding="0" cellspacing="0"   width="55%">
<tr>
    <td align="center" height="10px">&nbsp;</td>
  </tr>
  <tr>
    <td align="center"><font size="4" color="#4A865A"><b>CREATE NEW USER</b></font></td>
  </tr>
  <tr>
    <td align="center" height="10px">&nbsp;</td>
  </tr>
   <form name="EditMessage" method="POST" action="user_data.asp">
  <tr><td align="center" class="HienThi" style="padding:5px;">
 
    <fieldset>
    		<legend><b>Information User</b></legend>
	  <table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tr>
        <td width="35%" nowrap>&nbsp;</td>
        <td width="65%">&nbsp;</td>
      </tr>
      <tr>
        <td width="35%" class="HienThi">Username:</td>
        <td width="65%">
        <input type="text" name="Username" size="30" style="font-family: Verdana; font-size: 8pt; width:200px"></td>
      </tr>
      <tr>
        <td width="35%"  class="HienThi">Password:</td>
        <td width="65%">
        <input type="password" name="UserPw" size="30" style="font-family: Verdana; font-size: 8pt;width:200px"></td>
      </tr>
      <tr>
        <td width="35%"  class="HienThi"><font color="#808080">Confirm Password:</font></td>
        <td width="65%">
        <input type="password" name="ConfirmPw" size="30" style="font-family: Verdana; font-size: 8pt;width:200px"></td>
      </tr>
      <tr>
        <td width="35%"  class="HienThi">Decentralization :</td>
        <td width="65%">
        <select size="1" name="UserLevel" style="font-family: Verdana; font-size: 8pt;width:200px">
        <option value="3">Website administrator</option>		
        <option value="2">Members only read and post</option>
        </select></td>
      </tr>
	  <tr>
    <td width="35%" height="20px" align="center">&nbsp;</td>
	<td width="65%" height="20px" align="center">&nbsp;</td>
  </tr>
    </table></fieldset>
    </td>
  </tr>
  <tr>
    <td align="center" height="20px">&nbsp;</td>
  </tr>
  <tr>
    <td width="100%" align="center" class="HienThi">
	 <fieldset>
    		<legend><b>Information Personal</b></legend>
    <table border="0" cellpadding="3" cellspacing="0" width="100%">
      <tr>
        <td width="35%"  class="HienThi">&nbsp;</td>
        <td width="65%">&nbsp;        </td>
      </tr>
      <tr>
        <td width="35%"  class="HienThi">Full name :</td>
        <td width="65%">
        <input type="text" name="UserRealName" size="30" style="font-family: Verdana; font-size: 8pt;width:200px"></td>
      </tr>
	  <tr>
        <td width="35%"  class="HienThi">Gender :</td>
        <td width="65%">        <select name="Gender" id="Gender">
          <option value="1">Male</option>
          <option value="0">Female</option>
        </select></td>
      </tr>
	  
	  <tr>
        <td width="35%"  class="HienThi">Email :</td>
        <td width="65%">
        <input name="Address" type="text" id="Address" style="font-family: Verdana; font-size: 8pt;width:200px" size="30"></td>
      </tr>

	  
      <tr>
        <td width="35%"  class="HienThi">Phone :</td>
        <td width="65%">
        <input type="text" name="UserDept" size="30" style="font-family: Verdana; font-size: 8pt;width:200px"></td>
      </tr>
	  <tr>
    <td width="35%" height="20px" align="center">&nbsp;</td>
	<td width="65%"  align="center">&nbsp;</td>
  </tr>
      </table></fieldset>
    </td>
  </tr>
  <tr>
    <td align="center" height="10px">&nbsp;</td>
  </tr>
  <tr>
    <td align="center">
    
            <button onClick="JavaScript:test();"  name="B2" style="width: 80; height: 22"><b>
			
            <font face="Verdana" size="1">Create</font></b></button>
			<input type="hidden" name="act" value="ADD">
    </td>
  </tr>
  <tr>
    <td align="center" height="10px">&nbsp;</td>
  </tr>
  </form>
</table>
</center>
<%end if%>