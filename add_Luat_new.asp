<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html>
<html lang="vi">
<!--#Include file="Connection/Connection.asp"-->

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>HỆ THỐNG TRA CỨU VĂN BẢN PHÁP LUẬT LAO ĐỘNG</title>
  <link rel="stylesheet" type="text/css" href="../Template/css/bootstrap.min.css">
</head>
<body>
  <div id="top">
    <!--#Include file="Template/MenuTop.asp"-->
  </div>
  <div id="main" class="container">
 <script language="javascript">
function test()
{
  if(EditMessage.IDLVB.value=="") 
	{
  
	alert("Ban chua Chon Loai Van Ban");
	
	}
else
if(EditMessage.so_ky_hieu.value=="") 
	{
  EditMessage.so_ky_hieu.focus();
	alert("Ban chua nhap so_ky_hieu");
	
	}
else
	if(EditMessage.NameVB_VN.value=="") 
		{
		alert("Nhập Tên Văn Bản Tiếng Việt");
		EditMessage.NameVB_VN.focus();
		}
	else
		if(EditMessage.NameVB_JP.value=="") 
		{
		alert("Nhập Tên Văn Bản Tiếng Nhật");
		EditMessage.NameVB_JP.focus();
		}
		else
			if(EditMessage.NameVB_EN.value=="") 
				{
				alert("Nhập Tên Văn Bản Tiếng Anh");
				EditMessage.NameVB_EN.focus();
				}
			else
				if(EditMessage.DateBH=="") 
						{
						alert("Ban Nhập Ngày ban hành ");
						EditMessage.DateBH.focus();
						}
					else
						if(EditMessage.CQBH.value=="") 
							{
							alert("Ban chua nhap Cơ Quan Ban Hành");
							EditMessage.CQBH.focus();
							}
						else
							if(EditMessage.NguoiBH.value=="") 
								{
								alert("Ban chua nhap Người Ban Hành");
								EditMessage.NguoiBH.focus();
								}
							else
								EditMessage.submit();	
}
</script>
<form name="EditMessage" action ="Template\It_add_luat.asp" method = "post">
    <label for="LVB">Nhóm:</label>
    <select name="IDLVB">
        <option value="" >---Chọn Loại Văn Bản---</option> 
        <option value="Luat" >Luật & Pháp Lệnh</option>
        <option value="NghiDinh">Nghị Định & Thông Tư</option>
        <option value="CongVan" >Công Văn & Quyết Định</option>
     </select>
        <p class="textform">số ký hiệu</p>
				<INPUT  class="form-group" TYPE="TEXT" placeholder="nhâp số ký hiệu" NAME="so_ky_hieu" >
        <div class="row">
        <div class="col-sm-4" style="background-color:lavender;">
          
          <p class="textform">Nhập Tên Văn Bản Tiếng Việt</p>
					<INPUT class="form-control input-lg" TYPE="text" NAME="NameVB_VN" SIZE="n">
          <p class="textform">tóm tắt nội dung tiếng Việt</p>
					<INPUT class="form-control input-lg" TYPE="text" NAME="TomtatND_VN" SIZE="n">

        </div>
        <div class="col-sm-4" style="background-color:lavenderblush;">
          <p class="textform">Nhập Tên Văn Bản Tiếng Nhật</p>
						<INPUT class="form-control input-lg" TYPE="text" NAME="NameVB_JP" SIZE="n">
          <p class="textform">tóm tắt nội dung tiếng Nhật</p>
					<INPUT class="form-control input-lg" TYPE="text" NAME="TomtatND_JP" SIZE="n">
        </div>
        <div class="col-sm-4" style="background-color:lavender;">
        <p class="textform">Nhập Tên Văn Bản Tiếng Anh</p>
						<INPUT class="form-control input-lg" TYPE="text" NAME="NameVB_EN" SIZE="n">
           <p class="textform">tóm tắt nội dung tiếng Anh</p>
					<INPUT class="form-control input-lg" TYPE="text" NAME="TomtatND_EN" SIZE="n">
        </div>
        <p class="textform">Ngày ban hành</p>
				<INPUT class="form-control input-lg" TYPE="text" NAME="DateBH" SIZE="n">
        <p class="textform">Cơ quan Ban Hành</p>
				<INPUT class="form-control input-lg" TYPE="text" NAME="CQBH" SIZE="n">
        <p class="textform">Người Ban Hành</p>
				<INPUT class="form-control input-lg" TYPE="text" NAME="NguoiBH" SIZE="n">
        <p class="textform">Link tài liệu</p>
				<INPUT class="form-control input-lg" TYPE="text" NAME="Link_TL" SIZE="n">
        <p class="textform">hidden</p>
        <input type="checkbox" name="Hidden">
        <div class="row">
        <div class="col-sm-4"></div>
        <div class="col-sm-4"style="text-align:center;">
         <button onClick="test()"  name="tao_moi" style="width: 150; height: 30"><b>
            <font face="Verdana" size="2">Tạo Mới</font></b></button>
        <div class="col-sm-4"></div>
        </div>
      </form>
  </div>
  
  <div id="bottom">
    <!--#Include file="Template/Bottom.asp"-->
  </div>
  
  <script type="text/javascript" language="javascript" src="../Template/java/jquery-3.4.1.min.js"></script>
  <script type="text/javascript" language="javascript" src="../Template/java/bootstrap.min.js"></script>
  <script type="text/javascript" language="javascript" src="ckeditor/ckeditor.js"></script>
  <script>
    CKEDITOR.replace('txt');
    CKEDITOR.config.entities_latin = false;
  </script>
<!--#Include file="Connection/EndConnection.asp"-->
</body>
</html>