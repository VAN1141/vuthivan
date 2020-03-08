<!DOCTYPE html>
<html>
<%
@codepage=65001
%>
<%
set conn=Server.CreateObject("ADODB.Connection")
conn.Provider="Microsoft.Jet.OLEDB.4.0"
conn.Open "D:/ASP/testsite/tai_lieu_db.mdb"
table = Request.QueryString("table")
set rs=Server.CreateObject("ADODB.recordset")
sql="SELECT * from  "&table

rs.Open sql, conn
%>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>This is a WebPage using Bootstrap 4</title>
	<!-- Import Boostrap css, js, font awesome here -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">       
    <link href="https://use.fontawesome.com/releases/v5.0.4/css/all.css" rel="stylesheet">    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js">
    </script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <link href="./css/style.css" rel="stylesheet">

</head>
<body>

  <%
  do until rs.EOF
  %>

<div class="card" style="width: 18rem;">
  <div class="card-body">
    <h5 class="card-title"><%Response.Write(rs.Fields(1).Value)%></h5>
    <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
    <p class="card-text"><%Response.Write(rs.Fields(2).Value)%></p>
    <a href="#" class="card-link">ありがとうございます。</a>
    <a href="#" class="card-link">Another link</a>
  </div>
</div>
    <%
    rs.MoveNext%>

  <%loop
  rs.close
  conn.close%>
</BODY>
</HTML>