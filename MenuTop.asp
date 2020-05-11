<!-- LOGO -->
<div>
    <img src="Images/logo.jpg" width=100% height=150px alt="Logo">
</div>

<!-- Menu Ngang -->
<nav class="navbar">
  <div class="container-fluid">
    <ul class="nav navbar-nav">
      <li class="active"><a target="_self" href="index.asp"><%=langin("Trang chủ","ホーム","Home")%></a></li>
      <li><a href="#"><%=langin("Hỏi & Đáp","Q&A","Q&A")%></a></li>
      <li><a href="#"><%=langin("Giới Thiệu & Liên Hệ","概要 ・連絡先","About & Contact")%></a></li>
    </ul>
    <div class="lang navbar-right">
      <a href="index.asp?langs=vn" type="button" class="btn btn-link navbar-btn">VN</a>
      <span>|</span>
      <a href="index.asp?langs=jp" type="button" class="btn btn-link navbar-btn">JP</a>
      <span>|</span>
      <a href="index.asp?langs=en" type="button" class="btn btn-link navbar-btn">EN</a>
    </div>
    <form class="navbar-form navbar-right" action="/action_page.php">
      <div class="input-group">
        <input type="text" class="form-control" placeholder="Search" name="search">
        <div class="input-group-btn">
          <button class="btn btn-default" type="submit">
            <i class="glyphicon glyphicon-search"></i>
          </button>
        </div>
      </div>
    </form>
  </div>
</nav>
