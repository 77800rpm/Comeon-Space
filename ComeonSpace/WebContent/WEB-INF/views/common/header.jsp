<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member"%>
<% Member loginUser = (Member)session.getAttribute("loginUser"); %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="assets/css/style.css">
<script class="cssdeck" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>

<!-- 검색 기능 및 페이지 연결 필요 -->

<style>

    *{font-family: 'jua', sans-serif; !important}
    a, p, h1, h2, h3{font-family: 'jua', sans-serif; !important}
    

.dropdown-submenu {
  position: relative;
}

.dropdown-submenu a::after {
  transform: rotate(-90deg);
  position: absolute;
  right: 6px;
  top: .8em;
}

.dropdown-submenu .dropdown-menu {
  top: 0;
  left: 100%;
  margin-left: .1rem;
  margin-right: .1rem;
}

	.bar-menu{color: #0f6756; font-weight: bold;}
	#logoImg{width: 60px; height: auto;}
	#menuImg{width: 40px; height: auto;}
	.header-list{float: right; padding: 0px;}
 	.nav-link{padding: 4px; font-size: 20px; color: black;}
 	.nav-link a:hover {color: #0f6756;}
 	.main-login{
 		background-color: #0f6756;
 		border-radius: 5px 5px 5px 5px;
 		color: white !important;

	}
	#main-search{
 		background-color: #0f6756;
 		border-radius: 5px 5px 5px 5px;
 		color: white !important;
	}

</style>

</head>
<body>
  
<nav class="navbar navbar-expand-lg">
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
    <a class="navbar-brand" href="index.jsp"><img src="assets/img/logo.png" id="logoImg"></a>
    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
      <li class="nav-item active">
        <a class="nav-link" href="#">공간등록 <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">고객센터</a>
      </li>
      <li class="nav-item">
        <% if(loginUser == null){ %>
        	<a class="nav-link main-login" id="login">로그인</a>
         <% } else { %>
            <a class="nav-link main-login" id="logout">로그아웃</a>
         <% } %>
      </li>
   <li class="nav-item dropdown">
   		<% if(loginUser == null){ %>
   		<a class="nav-link disabled" href="#">계정</a>
   		<% } else { %>
        <a class="nav-link dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          	계정
        </a>
         <% } %>
        <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <li><a class="dropdown-item" href="#">HealthyK</a></li>
          <li><a class="dropdown-item" href="#">마이페이지</a></li>
          <li class="dropdown-submenu"><a class="dropdown-item dropdown-toggle" href="#">메뉴</a>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="#">찜 목록</a></li>
              <li><a class="dropdown-item" href="#">문의내역</a></li>


              <li class="dropdown-submenu"><a class="dropdown-item dropdown-toggle" href="#">호스트</a>
                <ul class="dropdown-menu">
                  <li><a class="dropdown-item" href="#">호스트_권한</a></li>
                  <li><a class="dropdown-item" href="#">호스트_권한</a></li>
                </ul>
              </li>
              <li class="dropdown-submenu"><a class="dropdown-item dropdown-toggle" href="#">관리자</a>
                <ul class="dropdown-menu">
                  <li><a class="dropdown-item" href="#">관리자_권한</a></li>
                  <li><a class="dropdown-item" href="#">관리자_권한</a></li>
                </ul>
              </li>
            </ul>
          </li>
        </ul>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="text" placeholder="어떤 장소를 찾으시나요?" aria-label="Search">
      <button id="main-search" type="submit">검색</button>
    </form>
  </div>
</nav>

<!-- 드롭다운 메뉴 -->
<script>
$('.dropdown-menu a.dropdown-toggle').on('click', function(e) {
	  if (!$(this).next().hasClass('show')) {
	    $(this).parents('.dropdown-menu').first().find('.show').removeClass("show");
	  }
	  var $subMenu = $(this).next(".dropdown-menu");
	  $subMenu.toggleClass('show');


	  $(this).parents('li.nav-item.dropdown.show').on('hidden.bs.dropdown', function(e) {
	    $('.dropdown-submenu .show').removeClass("show");
	  });
	  return false;
	});
</script>

<!-- 로그인 -->
<script>
	$('#login').on('click', function(){
		location.href="<%= request.getContextPath() %>/loginForm.me";
	});
	
	$('#logout').on('click', function(){
		location.href="<%= request.getContextPath() %>/logout.me";
	});
</script>

  
</body>
</html>
</body>
</html>