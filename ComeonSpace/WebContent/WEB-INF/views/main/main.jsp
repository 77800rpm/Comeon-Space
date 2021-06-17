<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member"%>
<% Member loginUser = (Member)session.getAttribute("loginUser"); %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Come on Space! - 메인페이지</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="apple-touch-icon" href="assets/img/apple-icon.png">
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/logo.ico">

    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/templatemo.css">
    <link rel="stylesheet" href="assets/css/custom.css">

    <!-- Load fonts style after rendering the layout styles -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
    <link rel="stylesheet" href="assets/css/fontawesome.min.css">
    
    
        <!-- Load map styles -->
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css" integrity="sha512-xodZBNTC5n17Xt2atTPuE1HxjVMSvLVW9ocqUKLsCC5CXdbqCmblAshOMAS6/keqq/sMZMZ19scR4PsZChSR7A==" crossorigin="" />

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="assets/js/jquery-1.11.0.min.js"></script>
    <script src="assets/js/jquery-migrate-1.2.1.min.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/templatemo.js"></script>
    <script src="assets/js/custom.js"></script>
<!--
    
TemplateMo 559 Zay Shop

https://templatemo.com/tm-559-zay-shop

-->
   
   <link rel="preconnect" href="https://fonts.gstatic.com">
   <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">

   
   <style>
	#search{border: none; border-bottom: 1px solid black;}
	#searchImg{width:15px; height: auto;}

      
    #lineGreen{color: #069a55;}
      
      
      /* 폰트 지정. 주아체.            제발 다 적용되어줘... */
     *{font-family: 'jua', sans-serif; !important}
     #hotSpace{font-family: 'jua', sans-serif;}
     a, p, h1, h2, h3{font-family: 'jua', sans-serif; !important}
      
    .footer{text-align: center;}
	.footer-list{margin: 6px;} 
	
	
	.carousel-inner > .carousel-item > img{ /* width: 640px; height: 720px; */ }
	
	#login, #logout {
		cursor:pointer;
	}
	
/* 메뉴바 스타일 */
	
#menuToggle
{
  display: block;
  position: relative;
  top: 75px;
  left: 50px;
  
  z-index: 1;
  
  -webkit-user-select: none;
  user-select: none;
  
}

#menuToggle a
{
  text-decoration: none;
  color: #232323;
  
  transition: color 0.3s ease;
}

#menuToggle a:hover
{
  color: rgb(244,162,1);
}


#menuToggle input
{
  display: block;
  width: 40px;
  height: 32px;
  position: absolute;
  top: -7px;
  left: -5px;
  
  cursor: pointer;
  
  opacity: 0; 
  z-index: 2; 
  
  -webkit-touch-callout: none;
}

/*
 * 햄버거 메뉴
 */
#menuToggle span
{
  display: block;
  width: 33px;
  height: 4px;
  margin-bottom: 5px;
  position: relative;
  
  background: rgb(15, 103, 86);
  border-radius: 3px;
  
  z-index: 1;
  
  transform-origin: 4px 0px;
  
  transition: transform 0.5s cubic-bezier(0.77,0.2,0.05,1.0),
              background 0.5s cubic-bezier(0.77,0.2,0.05,1.0),
              opacity 0.55s ease;
}

#menuToggle span:first-child
{
  transform-origin: 0% 0%;
}

#menuToggle span:nth-last-child(2)
{
  transform-origin: 0% 100%;
}

/* 
 * 
 * 메뉴 모양 변형
 */
#menuToggle input:checked ~ span
{
  opacity: 1;
  transform: rotate(45deg) translate(-2px, -1px);
  background: rgb(244,162,1);
}

/*
 * 
 */
#menuToggle input:checked ~ span:nth-last-child(3)
{
  opacity: 0;
  transform: rotate(0deg) scale(0.2, 0.2);
}


#menuToggle input:checked ~ span:nth-last-child(2)
{
  transform: rotate(-45deg) translate(0, -1px);
}


#menu
{
  font-family: 'jua', sans-serif;
  position: absolute;
  width: 350px;
  margin: -100px 0 0 -50px;
  padding: 50px;
  padding-top: 125px;
  
  background: rgb(15, 103, 86);
  list-style-type: none;
  -webkit-font-smoothing: antialiased;
  
  transform-origin: 0% 0%;
  transform: translate(-100%, 0);
  
  transition: transform 0.5s cubic-bezier(0.77,0.2,0.05,1.0);
}

#menu li
{
  padding: 10px 0;
  font-size: 22px;
}

#logOut{text-decoration: underline;}


#menuToggle input:checked ~ ul
{
  transform: none;
}
	
/* 메뉴바 스타일 끝 */


/* header */

	.bar-menu{color: #0f6756; font-weight: bold;}
	#logoImg{width: 60px; height: auto;}
	#menuImg{width: 40px; height: auto;}
	.header-list{float: right; padding: 0px;}
 	.nav-link{padding: 4px; font-size: 20px !important;}
 	.main-login{
 		background-color: #0f6756;
 		border-radius: 5px 5px 5px 5px;
 		color: white !important;

	}
	#search{border: none; border-bottom: 1px solid black;}
	#searchImg{width:15px; height: auto;}	
	.footer{text-align: center;}
	.footer-list{margin: 6px;}
      
</style>
</head>


<body>
	
    <!-- Header -->
    <nav class="navbar navbar-expand-lg navbar-light shadow">
        <div class="container d-flex justify-content-between align-items-center">

            <a class="navbar-brand text-success logo h1 align-self-center" href="index.html">
            	<img src="resources/image/logo.png" id="logoImg">
            </a>

            <div class="align-self-center collapse navbar-collapse flex-fill  d-lg-flex justify-content-lg-between" id="templatemo_main_nav">
                <input type="text" id="search" placeholder="어떤 장소를 찾으시나요?">
                <img src="resources/image/search.png" id="searchImg">
                <div class="flex-fill">
                    <ul class="nav header-list">
                        <li class="nav-item">                
                        <li class="nav-item">
                            <a class="nav-link" href="index.html">공간보기 |</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="about.html">공간등록 |</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="shop.html">고객센터 |</a>
                        </li>                       
                        <li class="nav-item">
                       <% if(loginUser == null){ %> 
                            <a class="nav-link main-login" id="login">로그인</a>
                       <% } else { %>
                       		<a class="nav-link main-login btn-member-logout" id="logout">로그아웃</a>
                       <% } %>     
                        </li>
                    </ul>
                </div>
            </div>

        </div>
    </nav>
    <!-- Close Header -->		
	




<% if(loginUser != null){ %>  	

<!-- 메인페이지 메뉴바 시작 -->
<nav role="navigation">
  <div id="menuToggle">
    <input type="checkbox" />
    
    <!--
           햄버거 메뉴
    -->
    <span></span>
    <span></span>
    <span></span>
    
    <!--
           메뉴바는 자바스크립트 사용해야 할 것 같아 보류하려다가
           일단 css만 이용해서 만들었습니다.
    -->
 
    <ul id="menu">
    <p>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <img src="https://img.hankyung.com/photo/202104/01.25738179.1.jpg" style="width: 70%">
      </p><br>
      <p>
      <a><%= loginUser.getUserName() %>  회원님 환영합니다!</a> <!-- 회원 이름 가져오기 -->
      </p>
      <a href="mainPage.html"><li>홈</li></a>
      <a href="#"><li>고객센터</li></a>
      <a href="#"><li>마이페이지</li></a>
      <a href="https://www.instagram.com/willyarchives/" target="_blank"><li>👻</li></a>
      <a href="#" target="_blank"><li>
      <button type="button" class="btn btn-warning btn-member-logout">로그아웃😥</button></li></a>	<!-- 로그아웃 후 홈 화면 이동 -->
    </ul>
  </div>
</nav>
	
	<!-- 메인페이지 메뉴바 끝 -->
<% } %>     	





    <br><br><br><br>
    
    <!-- Modal -->
    <div class="modal fade bg-white" id="templatemo_search" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="w-100 pt-1 mb-5 text-right">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="" method="get" class="modal-content modal-body border-0 p-0">
                <div class="input-group mb-2">
                    <input type="text" class="form-control" id="inputModalSearch" name="q" placeholder="어떤 공간을 찾으시나요?">
                    <button type="submit" class="input-group-text bg-success text-light">
                        <i class="fa fa-fw fa-search text-white"></i>
                    </button>
                </div>
            </form>
        </div>
    </div>


	
    <!-- 메인 배너 공간 시작 -->
    <!-- 
    	메인 배너 공간은 공간광고-> 그냥..광고?-> 공지사항 순으로 넣었습니다. (뭘 넣어야할지 떠오르지 않아서..)
    	공간광고는 공간 페이지에서,
    	공지사항은 공지사항 페이지에서 정보 가져오거나 하면 될 것 같은데
    	두번째 페이지의 그냥 광고 부분은 어떻게 가져오게 할지 모르겠네요ㅠ
    	
    	아니다 싶으면 공간광고나 공지사항 하나 더 넣는 걸로 하면 될 것 같아요!
     -->
    <div id="template-mo-zay-hero-carousel" class="carousel slide" data-bs-ride="carousel">
        <ol class="carousel-indicators">
            <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="0" class="active"></li>
            <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="1"></li>
            <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <div class="container">
                    <div class="row p-5">
                        <div class="mx-auto col-md-8 col-lg-6 order-lg-last">
                            <a href=""><img class="img-fluid" src="assets/img/banner_img_01.jpg" alt="" height=400px;></a> <!-- 이미지에 해당 공간 경로 링크 적용 -->
                        </div>
                        <div class="col-lg-6 mb-0 d-flex align-items-center">
                            <div class="text-align-left align-self-center">
                                <h1 style="color: rgb(15, 103, 86)"><b>뒷마당 스페이스</b> 05/10~06/10</h1>
                                <h3 class="h2">런칭 기념 얼리버드 특가!</h3>
                                <p>
                                                                        호스트 박신우님의 취향이 곳곳에 있는 <a rel="sponsored" style="color: rgb(15, 103, 86)" href="https://templatemo.com" target="_blank">뒷마당 스페이스</a>가 오픈했습니다! 
                                                                        얼리버드 특가로 누구보다 먼저 그녀의 취향을 만나보세요! 또한 <a rel="sponsored" style="color: rgb(15, 103, 86)" href="https://stories.freepik.com/" target="_blank">Desker</a>
                                                                        의 가구와 <a rel="sponsored" style="color: rgb(15, 103, 86)" href="https://unsplash.com/" target="_blank">다이슨</a>, 그리고
                                    <a rel="sponsored" style="color: rgb(15, 103, 86)" href="https://icons8.com/" target="_blank">루이스 폴센</a>의 조명을 만나볼 수 있습니다.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <div class="container">
                    <div class="row p-5">
                        <div class="mx-auto col-md-8 col-lg-6 order-lg-last">
                            <img class="img-fluid" src="assets/img/banner_img_02.jpg" alt="">
                        </div>
                        <div class="col-lg-6 mb-0 d-flex align-items-center">
                            <div class="text-align-left align-self-center">
                                <h1 style="color: rgb(15, 103, 86)"><b><월간 스페이스></b><br>-아마추어 서울-</h1>
                                <h3 class="h2">서울 애호가들의 사적인 지도</h3>
                                <p>
                                                                        아마추어 서울은 서울 안의 장소에 관한  흥미로운 지도를 만듭니다.<br>
                                    5월의 컴온 스페이스는 아마추어 서울의 두 대표를 만났습니다.<br> 
                                                                        서울을 왠만큼 다 안다고 생각하는 사람에게도 그 이면의 이야기를<br>들려주는
                                    <a rel="sponsored"  style="color: rgb(15, 103, 86)" href="https://villiv.co.kr/people/9202" target="_blank">아마추어 서울의 이야기를 들어보세요!</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <div class="container">
                    <div class="row p-5">
                        <div class="mx-auto col-md-8 col-lg-6 order-lg-last">
                            <img class="img-fluid" src="assets/img/banner_img_03.jpg" alt="">	<!-- 이미지에 해당 공지사항 경로 링크 적용 -->
                        </div>
                        <div class="col-lg-6 mb-0 d-flex align-items-center">
                            <div class="text-align-left">
                                <h1 style="color: rgb(15, 103, 86)">공지사항🔔</h1>
                                <h3 class="h2">호스트 컨퍼런스</h3>
                                <p>
                                                                       호스트와 관리자가 컴온스페이스의 개선 사항과 발전 방향에 대해<br>
                                                                       의논하는 호스트 컨퍼런스가 6월에는 줌이 아닌<br><a rel="sponsored" style="color: rgb(15, 103, 86)" href="https://gather.town/" target="_blank">개더타운Gather.Town</a>
                                                                       으로 개최됩니다!<br>
                                                                       우리 모두 8비트 메타버스에서 만나요🙋‍♀️
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <a class="carousel-control-prev text-decoration-none w-auto ps-3" href="#template-mo-zay-hero-carousel" role="button" data-bs-slide="prev">
            <i class="fas fa-chevron-left"></i>
        </a>
        <a class="carousel-control-next text-decoration-none w-auto pe-3" href="#template-mo-zay-hero-carousel" role="button" data-bs-slide="next">
            <i class="fas fa-chevron-right"></i>
        </a>
    </div>
    <!-- 메인 배너 공간 끝  -->
	
	

    <!-- 이달의 인기 공간 시작 -->
    <section class="container py-5" >
        <div class="row text-center pt-3">
            <div class="col-lg-6 m-auto">
                <h1 class="h1" id="hotSpace">5월, 가장 뜨거웠던 공간🏆</h1>
                <p>
                   	<a href="">지난 한달 간 가장 인기 있었던 공간 10곳.zip</a> <!-- 인기 공간 10곳 경로 링크 적용... 필수 기능 아님 -->
                </p>
            </div>
        </div>
        <div class="row">
            <div class="col-12 col-md-4 p-5 mt-3">
                <a href="#"><img src="assets/img/category_img_01.jpg" class="rounded-circle img-fluid border"></a> <!-- 이미지에 해당 공간 경로 링크 적용 -->
                <h5 class="text-center mt-3 mb-3">서교 레트로스페이스</h5>
                
            </div>
            <div class="col-12 col-md-4 p-5 mt-3">
                <a href="#"><img src="assets/img/category_img_02.jpg" class="rounded-circle img-fluid border"></a> <!-- 이미지에 해당 공간 경로 링크 적용 -->
                <h2 class="h5 text-center mt-3 mb-3">신도림 레오의 스튜디오</h2>
                
            </div>
            <div class="col-12 col-md-4 p-5 mt-3">
                <a href="#"><img src="assets/img/category_img_03.jpg" class="rounded-circle img-fluid border"></a> <!-- 이미지에 해당 공간 경로 링크 적용 -->
                <h2 class="h5 text-center mt-3 mb-3">성수 원데이노마드</h2>
            </div>
        </div>
    </section>
    <!-- 이달의 인기 공간 끝 -->
	
	
	



    <!-- 카테고리 시작 -->
<main style="background: #eeebeb">

  <section class="py-5 text-center container" id="categorySec">
    <div class="row py-lg-1">
      <div class="col-lg-6 col-md-8 mx-auto">
        <h1 class="fw-light">카테고리</h1>
        <p style="color: rgb(15, 103, 86)">Come on Space에는 다양한 유형의 공간이 있어요.<br> 원하는 공간을 찾으시길 바랍니다!</p>
      </div>
    </div>
  </section>

  <div class="album py-5 fw-light">
    <div class="container">

      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-4 g-3">
        <div class="col">
          <div class="card shadow-sm">
            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">스튜디오</text></svg>

            <div class="card-body">
              <p class="card-text">조명 맛집은 어디?📸</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>	<!-- view 버튼 클릭 시 해당 카테고리의 공간들 검색창으로 넘어가게. 공간검색창에서 필터 기능 이용? -->
                  
                </div>
                <small class="text-muted">52 곳</small>
              </div>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card shadow-sm">
            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">스터디룸</text></svg>

            <div class="card-body">
              <p class="card-text">절대 집중!👩‍🎓</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                  
                </div>
                <small class="text-muted">46 곳</small>
              </div>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card shadow-sm">
            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">공연장</text></svg>

            <div class="card-body">
              <p class="card-text">꿈을 펼쳐봐!🤟🏼</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                  
                </div>
                <small class="text-muted">18 곳</small>
              </div>
            </div>
          </div>
        </div>

        <div class="col">
          <div class="card shadow-sm">
            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">회의실</text></svg>

            <div class="card-body">
              <p class="card-text">아이디어를 쥐어짜보게..💡</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                  
                </div>
                <small class="text-muted">33 곳</small>
              </div>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card shadow-sm">
            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">공유주방</text></svg>

            <div class="card-body">
              <p class="card-text">갖고 싶은 잇템 다 있는<br> 우리의 주방👩🏼‍🍳</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                  
                </div>
                <small class="text-muted">21 곳</small>
              </div>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card shadow-sm">
            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">오피스</text></svg>

            <div class="card-body">
              <p class="card-text">눈치 X 독립오피스부터 카페<br> 같은 공유오피스까지!👨🏼‍💻</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                  
                </div>
                <small class="text-muted">52 곳</small>
              </div>
            </div>
          </div>
        </div>

        <div class="col">
          <div class="card shadow-sm">
            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">다목적홀</text></svg>

            <div class="card-body">
              <p class="card-text">소규모 강연👩‍🏫부터<br>내 작품 전시👨‍🎨까지 다 가능!</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                  
                </div>
                <small class="text-muted">34 곳</small>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

</main>
    <!-- 카테고리 끝 -->




	<!-- 지도 시작 -->
	
	<!-- 지도에 마커 기능 이용해서 주위 공간 표시해야함 -->
	<!-- 카카오 혹은 네이버 지도 api 이용해보기 -->

<br><br><br>
<div class="mapContainer">
	<div class="row">
		<div class="col-md-1">
			
		</div>
	
		<div class="col-md-3">
			<h2>어느 지역의 공간을<br> 찾으시나요?🕵️‍♂️</h2>	
		</div>
		
    <div class="col-md-7" id="mapid" style="width: 100%; height: 500px;"></div>
    <script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js" integrity="sha512-XQoYMqMTK8LvdxXYG3nZ448hOEQiglfqkJs1NOQV44cWnUrBc8PkAOcXy20w0vlaXaVUearIOBhiXZ5V3ynxwA==" crossorigin=""></script>
    <script>
        var mymap = L.map('mapid').setView([37.499007, 127.032911, 13], 13);

        L.tileLayer('https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw', {
            maxZoom: 18,
            attribution: 'Zay Telmplte | Template Design by <a href="https://templatemo.com/">Templatemo</a> | Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, ' +
                '<a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, ' +
                'Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
            id: 'mapbox/streets-v11',
            tileSize: 512,
            zoomOffset: -1
        }).addTo(mymap);

        L.marker([37.499007, 127.032911, 13]).addTo(mymap)
            .bindPopup("<b>KH</b> 정보 교육원<br />").openPopup();

        mymap.scrollWheelZoom.disable();
        mymap.touchZoom.disable();
    </script>
    	</div>
    </div>
    <!-- 지도 끝 -->   
    
	<br><br><br><br><br>

    <!-- 추천 공간 시작 -->
    <section style="background: #eeebeb">
        <div class="container py-5">
            <div class="row text-center py-3">
                <div class="col-lg-6 m-auto">
                    <h1 class="h1">이 달의 추천 공간🧚‍♀️</h1>
                    <p style="color: rgb(15, 103, 86)">
                                               여러분! 프사 바꿀 때 되지 않았나요?<br>
                                               컴온스페이스에서 인생 프사 건질 수 있는 셀프 스튜디오 3곳을 소개합니다!
                    </p>
                </div>
            </div>
            <div class="row">
                <div class="col-12 col-md-4 mb-4">
                    <div class="card h-100">
                        <a href="shop-single.html">
                            <img src="assets/img/feature_prod_01.jpg" class="card-img-top" alt="..." height=400px;>
                        </a>
                        <div class="card-body">
                            <ul class="list-unstyled d-flex justify-content-between">
                                <li>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-warning fa fa-star"></i>
                                </li>
                                <li class="text-muted text-right">70,000</li>
                            </ul>
                            <a href="shop-single.html" class="h2 text-decoration-none text-dark">Framous(프레이머스)</a>
                            <p class="card-text">
                                '프레이머스'는 손님이 직접 셀프로 촬영하는 스튜디오입니다.

								20분간 갤러리와 계단을<br> 배경으로 하여 자유롭게 셀프 촬영한 뒤 <br>
								20분간 여유롭게 사진들을 선택하시면 됩니다.
                            </p>
                            <p class="text-muted">Reviews (124)</p>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-md-4 mb-4">
                    <div class="card h-100">
                        <a href="shop-single.html">
                            <img src="assets/img/feature_prod_02.jpg" class="card-img-top" alt="..." height=400px;>
                        </a>
                        <div class="card-body">
                            <ul class="list-unstyled d-flex justify-content-between">
                                <li>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-muted fa fa-star"></i>
                                    <i class="text-muted fa fa-star"></i>
                                </li>
                                <li class="text-muted text-right">40,000</li>
                            </ul>
                            <a href="shop-single.html" class="h2 text-decoration-none text-dark">PhotoWeekStudio</a>
                            <p class="card-text">
                                                                포토위크 비비드컬러는 발랄한 컨셉의 다양한 컬러가 준비되어 있습니다.
								비비드컬러 전용<br>소품들도 준비가 되어 있으니 귀엽고,<br>사랑스러운 느낌의 셀프사진을 연출해보세요.
                            </p>
                            <p class="text-muted">Reviews (48)</p>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-md-4 mb-4">
                    <div class="card h-100">
                        <a href="shop-single.html">
                            <img src="assets/img/feature_prod_03.jpg" class="card-img-top" alt="..." height=400px;>
                        </a>
                        <div class="card-body">
                            <ul class="list-unstyled d-flex justify-content-between">
                                <li>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-muted fa fa-star"></i>
                                </li>
                                <li class="text-muted text-right">40,000</li>
                            </ul>
                            <a href="shop-single.html" class="h2 text-decoration-none text-dark">page Of(페이지 오브)</a>
                            <p class="card-text">
                                                               안국역에 위치한 셀프사진관입니다.<br>
								20분간 프라이빗한 스튜디오 내에서 자유롭게 촬영이 가능합니다.
								page of에서 나만의<br> 화보를 만들어보세요!
                            </p>
                            <p class="text-muted">Reviews (74)</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- 추천 공간 끝 -->
    
    <br><br><br><br><br>

	<!-- 이달의 리뷰 시작 -->
	<div class="container">
    <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-5">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script> $('.carousel').carousel({ interval: 2000 //기본 5초 }) </script> <div class="container"><h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;⚜️이 달의 리뷰⚜️</h2></div>
        <div id="demo" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
        
        <!-- 슬라이드 쇼 -->
        <div class="carousel-item active">
        <!--가로-->
        <img class="d-block w-100" height=300px; src="./assets/img/reviewofthemonth1.jpg" alt="First slide">
        <div class="carousel-caption d-none d-md-block"> <h5>후암주방</h5> <p>후암동 공유주방</p> </div> </div>
        <div class="carousel-item"> <img class="d-block w-100" height=300px; src="assets/img/reviewofthemonth2.jpg" alt="Second slide"> </div>
        <div class="carousel-item"> <img class="d-block w-100" height=300px; src="assets/img/reviewofthemonth3.jpg" alt="Third slide"> </div>
        <!-- / 슬라이드 쇼 끝 -->
        
        <!-- 왼쪽 오른쪽 화살표 버튼 -->
        <a class="carousel-control-prev" href="#demo" data-slide="prev"> <span class="carousel-control-prev-icon" aria-hidden="true"></span><!-- <span>Previous</span> --></a>
        <a class="carousel-control-next" href="#demo" data-slide="next"> <span class="carousel-control-next-icon" aria-hidden="true"></span><!-- <span>Next</span> --> </a>
        <!-- / 화살표 버튼 끝 -->
        
        <!-- 인디케이터 -->
        <ul class="carousel-indicators"> <li data-target="#demo" data-slide-to="0" class="active"></li>
        <!--0번부터시작-->
        <li data-target="#demo" data-slide-to="1"></li> <li data-target="#demo" data-slide-to="2"></li>
     	</ul>
        <!-- 인디케이터 끝 --> </div>
		
    </div>
</div>

		<div class="col-md-1"><br><br><br><br><br><br>
        </div>
        
        <div class="col-md-5"><br><br><br><br><br><br>   
        	<h5>'HealthyK' 님의 리뷰</h5>       	
        	<p>
        		후암주방 잘 이용하고 갑니다!
				여자친구와 기념일때 와서 요리<br>만드는데, 덕분에 좋은 추억 남기고 가요.
				주변에서 재료를<br>구매하는데, 후암주방이용하러 왔다고 하니까 잘해주시더라고요.<br>
				공간도 좋고 동네도 좋고 너무 좋았습니다 ^^
        	</p>
        </div>
</div>
</div>
	<!-- 이 달의 리뷰 끝 -->




	<!-- 구분 줄로 프로그레스 바 를 이용하려고 했는데 깔끔해보이지 않아서 뺐습니다.
	
		<div class="progress">
  		<div class="progress-bar bg-success" role="progressbar" style="width: 100%;" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
		</div>
	
	 -->
	 <br><br><br><br>


    <!-- Start Footer -->
    <footer>
      <div class="footer" style="color: rgb(15, 103, 86)">
      <hr>
		<span class="footer-list"><a>회사소개</a></span>      
		<span class="footer-list"><a>이용약관</a></span>      
		<span class="footer-list"><a>메뉴얼</a></span>      
		<span class="footer-list"><a>고객센터</a></span>      
      </div>
    </footer>
    <!-- End Footer -->
	
	<script>
		$('#login').on('click', function(){
			location.href="<%= request.getContextPath() %>/loginForm.me";
		});
		
		$('.btn-member-logout').on('click', function(){
			location.href="<%= request.getContextPath() %>/logout.me";
		});
	</script>
	
	


</body>

</html>