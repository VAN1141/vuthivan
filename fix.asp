<link rel="stylesheet" type="text/css" href="Images/css/<%response.Write(langin("vietnam_fix","japan_fix"))%>.css" />

<style type="text/css">
#slides .slides_container {
	width:210px;
	height:140px;
	display:none;
}
#slides .slides_container div {
	width:210px;
	height:140px;
	display:block;
}
#slides ul {
margin: 0;
padding: 0;
position: relative;
list-style-type: none;
float:right;
}
#slides ul li{
width: 20px;
float:left;
margin: 0 1px 1px 0;
}

#slides a{
font: bold 10px Verdana, Arial;
text-align: center;
line-height: 22px;
background:#017CC2;
color: #fff;
text-decoration: none;
display: block;
}
#slides a:hover, #slides ul li.current a {
background:#fff;
color: #ff0000;
}


#slides_left .slides_container {
	width:210px;
	height:140px;
	display:none;
}
#slides_left .slides_container div {
	width:210px;
	height:140px;
	display:block;
}
#slides_left ul {
margin: 0;
padding: 0;
position: relative;
list-style-type: none;
float:right;
}
#slides_left ul li{
width: 20px;
float:left;
margin: 0 1px 1px 0;
}

#slides_left a{
font: bold 10px Verdana, Arial;
text-align: center;
line-height: 22px;
background:#017CC2;
color: #fff;
text-decoration: none;
display: block;
}
#slides_left a:hover, #slides_left ul li.current a {
background:#fff;
color: #ff0000;
}
</style>
<script type="text/javascript" src="Images/java/jquery.min.js"></script>
<script type="text/javascript" src="Images/java/slides.min.jquery.js"></script>
<SCRIPT type=text/javascript>
	$(function(){
		$('#slides').slides({
			generateNextPrev: false,
			play: 2500
		});
		$('#slides_left').slides({
			generateNextPrev: false,
			play: 2500
		});
		
	});
</SCRIPT>
<!--
<script type="text/javascript" src="Images/java/jquery-1.5.min.js"></script>
<script type="text/javascript" src="Images/java/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="Images/java/jquery.slideviewer.1.2.js"></script>


<script type="text/javascript">
	$(window).bind("load", function() {
	$("div#mygalone").slideView();
});
</script>

-->