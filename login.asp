<html>
	<head>
		
		<meta http-equiv="Content-Type" content="text/html;
		charset=utf-8">
		<title>vbpl</title>
		<link rel = "stylesheet" type="text/css" href = "../Template/css/styleadmin.css"/>
		<SCRIPT language=javascript type=text/javascript>
		function showDateVN()
		{
			d = new Date();
			var a = new Array("Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday");
			s = "<b>" + a[d.getDay()] + 
				", " +	(d.getDate()<10?"0" + d.getDate():d.getDate()) +
				"/" +	(d.getMonth()+1 <10?"0" + (d.getMonth() + 1):(d.getMonth()+1)) +
				"/" +	d.getFullYear() + "</b>";
			document.write(s);			
		}
</SCRIPT>
	</head>
	<body>
	<div id ="top"></div>
	<div id ="topday">
	<SCRIPT language=javascript 
        >showDateVN()</SCRIPT>
	</div>
		<div id="main">
				<div id="dangnhap">
					<form action = "login_data2.asp" method = "post">
						<p class="textform">Tên đăng nhập</p>
						<INPUT class="textform" TYPE="TEXT" NAME="TENDANNHAP" SIZE="n">
						<p class="textform">Mật Khẩu</p>
						<INPUT class="textform" TYPE="PASSWORD" NAME="MAT_KHAU" SIZE="n">
						<input class="formdangnhap" type="submit" value="Đăng Nhập" name="đăng nhập">
					</form>
				</div>
			<div id="logo">
				<img src = "..\Images\logo.PNG"/>
				<li>
				<img src = "..\Images\back.PNG"/>
				<a href = "http://tis-ntv/Web/EIW/VBPL/index.asp" title="quaylai">Quay lại</a>
				</li>
			</div>
		</div>
		<div id ="footer">Design by DR0 Group</div>
		<SCRIPT language=javascript type=text/javascript>            
                    var btnLogin = "btLogin";
                    var Login_LastClass;
                    function Login_Over(src){
                        Login_LastClass = src.className;
                        src.className = "Login_Hover";
                    }
                    function Login_Out(src){
                        src.className = Login_LastClass;
                    }

                    function ChanSubmit(e){
                        var keycode;
                        var ie4=document.all;                
                        if(ie4) window.event.returnValue = true;
                        keycode = (ie4)?(window.event.keyCode):(e.which);
                        
                        if (keycode==13){
                            document.getElementById(btnLogin).click();
                            return false;
                        }
                        else if(ie4){
                            window.event.returnValue = true;
                        }
                        return true;
                    }
                </SCRIPT>
	</body>
</html>