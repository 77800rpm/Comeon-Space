<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Common Space - Search Page</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="assets/img/apple-icon.png">
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/templatemo.css">
    <link rel="stylesheet" href="assets/css/custom.css">

    <!-- Load fonts style after rendering the layout styles -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
    <link rel="stylesheet" href="assets/css/fontawesome.min.css">
    
    <link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&family=Jua&family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<!--
    
TemplateMo 559 Zay Shop

https://templatemo.com/tm-559-zay-shop

-->

<style>
	*{font-family: 'Nanum Gothic', sans-serif;}
</style>
</head>

<body>
    <!-- Start Top Nav -->
    <nav class="navbar navbar-expand-lg bg-dark navbar-light d-none d-lg-block" id="templatemo_nav_top">
        <div class="container text-light">
            <div class="w-100 d-flex justify-content-between">
                <div>
                    <i class="fa fa-envelope mx-2"></i>
                    <a class="navbar-sm-brand text-light text-decoration-none" href="mailto:info@company.com">info@company.com</a>
                    <i class="fa fa-phone mx-2"></i>
                    <a class="navbar-sm-brand text-light text-decoration-none" href="tel:010-020-0340">010-020-0340</a>
                </div>
                <div>
                    <a class="text-light" href="https://fb.com/templatemo" target="_blank" rel="sponsored"><i class="fab fa-facebook-f fa-sm fa-fw me-2"></i></a>
                    <a class="text-light" href="https://www.instagram.com/" target="_blank"><i class="fab fa-instagram fa-sm fa-fw me-2"></i></a>
                    <a class="text-light" href="https://twitter.com/" target="_blank"><i class="fab fa-twitter fa-sm fa-fw me-2"></i></a>
                    <a class="text-light" href="https://www.linkedin.com/" target="_blank"><i class="fab fa-linkedin fa-sm fa-fw"></i></a>
                </div>
            </div>
        </div>
    </nav>
    <!-- Close Top Nav -->


    <!-- Header -->
    <nav class="navbar navbar-expand-lg navbar-light shadow">
        <div class="container d-flex justify-content-between align-items-center">

            <a class="navbar-brand text-success logo h1 align-self-center" href="index.html">
                Zay
            </a>

            <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#templatemo_main_nav" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="align-self-center collapse navbar-collapse flex-fill  d-lg-flex justify-content-lg-between" id="templatemo_main_nav">
                <div class="flex-fill">
                    <ul class="nav navbar-nav d-flex justify-content-between mx-lg-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="index.html">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="about.html">About</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="shop.html">Shop</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="contact.html">Contact</a>
                        </li>
                    </ul>
                </div>
                <div class="navbar align-self-center d-flex">
                    <div class="d-lg-none flex-sm-fill mt-3 mb-4 col-7 col-sm-auto pr-3">
                        <div class="input-group">
                            <input type="text" class="form-control" id="inputMobileSearch" placeholder="Search ...">
                            <div class="input-group-text">
                                <i class="fa fa-fw fa-search"></i>
                            </div>
                        </div>
                    </div>
                    <a class="nav-icon d-none d-lg-inline" href="#" data-bs-toggle="modal" data-bs-target="#templatemo_search">
                        <i class="fa fa-fw fa-search text-dark mr-2"></i>
                    </a>
                    <a class="nav-icon position-relative text-decoration-none" href="#">
                        <i class="fa fa-fw fa-cart-arrow-down text-dark mr-1"></i>
                        <span class="position-absolute top-0 left-100 translate-middle badge rounded-pill bg-light text-dark">7</span>
                    </a>
                    <a class="nav-icon position-relative text-decoration-none" href="#">
                        <i class="fa fa-fw fa-user text-dark mr-3"></i>
                        <span class="position-absolute top-0 left-100 translate-middle badge rounded-pill bg-light text-dark">+99</span>
                    </a>
                </div>
            </div>

        </div>
    </nav>
    <!-- Close Header -->

<br><br>

<!-- ㅇㅇ으로 검색한 결과입니다 -->
<div>
	<span>　　　　　　　　　　　　　　　　　　　</span>
	<span id="search-result">스터디룸</span><span class=""> 으로 검색한 결과입니다.</span>
	
</div>

<br>

<!-- 상품 list -->        
<div class="container">
    <div class="row">
        <div class="dummy col-md-3"></div>
        <div class="pro-menu col-md-8">
              <form>              
				<div class="dropdown3">               
				<select id="browsers2" class="dropdownn" name="browsers">
				    <option value="모든공간" selected>모든 공간</option>
				    <option value="오피스">오피스</option>
				    <option value="스터디룸">스터디룸</option>
				    <option value="공연장">공연장</option>
				    <option value="주방">주방</option>
				    <option value="스튜디오">스튜디오</option>
				    <option value="다목적홀">다목적홀</option>
				    <option value="회의실s">회의실</option>
				</select>
				<select id="browsers3" class="dropdownn" name="browsers">
				    <option value="모든지역" selected>모든 지역</option>
				    <option value="경기도">경기도</option>
				    <option value="서울">서울</option>
				    <option value="인천">인천</option>
				    <option value="강원">강원</option>
				    <option value="대전충청">대전/충청</option>
				    <option value="부산울산">부산/울산</option>
				    <option value="경상">경상</option>
				    <option value="광주전라제주">광주/전라/제주</option>
				</select>				
				<input type="date" id="browser4" name="search-date" min="today">
				<button type="submit" id="browser5">search</button>				
				</div>   
			</form> 
        </div>
    </div>
    
    <span class="menu_under_img">
    <img class="menu_under_img" src="assets/img/space_3_img.jpg">
    </span>
    
    <hr>
    <br>
    
    <div class="row pro-list" id="pro-list-1">
        <div class="pro-photo col-md-3">
	        <img class="card-img img-fluid" src="assets/img/product_single_10.jpg" alt="Card image cap" id="product-detail">	        
        </div>
        <div class="pro-desc col-md-6 pro-list-title" >
        	<p class="pro-desc-title">신촌 24시 스터디룸 [주야창천]</p>
        	<p class="pro-desc-lo">
	        	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-geo-alt-fill" viewBox="0 0 16 16">
				<path d="M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10zm0-7a3 3 0 1 1 0-6 3 3 0 0 1 0 6z"/>
				</svg>
				서울특별시 서대문구 창천동 112-12 지층
        	<p class="pro-intro">쉐어니도 직영 신촌/홍대 24시간 스터디카페입니다.<br>
        	[주야창천]은 공유주거 전문기업 쉐어니도가 운영하는 모임공간입니다.<br>
        	좋으니까 오세요. 알겠죠??</p>
        </div>
        <div class="pro-price col-md-2 pro-list-text"><span class="pro-list-price">40,000</span><span class="pro-font"> 원</span></div>
        <div class="pro-wish col-md-1 pro-list-text">
        	<a class="btn btn-success text-white"><i class="far fa-heart"></i></a>
		</div>
    </div><br><hr><br>
    <div class="row pro-list" id="pro-list-2">
        <div class="pro-photo col-md-3">
	        <img class="card-img img-fluid" src="assets/img/product_single_02.jpg" alt="Card image cap" id="product-detail">	        
        </div>
        <div class="pro-desc col-md-6 pro-list-title">
        	<p class="pro-desc-title">공간명입니다아</p>
        	<p class="pro-desc-lo">공간 위치다</p>
        	<p class="pro-intro">공간매우나길게설명해보아요ㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛ</p>
        </div>
        <div class="pro-price col-md-2 pro-list-text"><span class="pro-list-price">40,000</span> 원</div>
        <div class="pro-wish col-md-1 pro-list-text">
        	<a class="btn btn-success text-white"><i class="far fa-heart"></i></a>
		</div>
    </div><br><hr><br>
    <div class="row pro-list" id="pro-list-3">
        <div class="pro-photo col-md-3">
	        <img class="card-img img-fluid" src="assets/img/product_single_03.jpg" alt="Card image cap" id="product-detail">	        
        </div>
        <div class="pro-desc col-md-6 pro-list-title">
        	<p class="pro-desc-title">공간명입니다아</p>
        	<p class="pro-desc-lo">공간 위치다</p>
        	<p class="pro-intro">공간을매우길게설명해보아요ㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛ</p>
        </div>
        <div class="pro-price col-md-2 pro-list-text"><span class="pro-list-price">40,000</span> 원</div>
        <div class="pro-wish col-md-1 pro-list-text">
        	<a class="btn btn-success text-white"><i class="far fa-heart"></i></a>
		</div>
    </div><br><hr><br>
    <div class="row pro-list" id="pro-list-4">
        <div class="pro-photo col-md-3">
	        <img class="card-img img-fluid" src="assets/img/product_single_10.jpg" alt="Card image cap" id="product-detail">	        
        </div>
        <div class="pro-desc col-md-6 pro-list-title">
        	<p class="pro-desc-title">공간명입니다아</p>
        	<p class="pro-desc-lo">공간 위치다</p>
        	<p class="pro-intro">공간을매우길게설명해보아요ㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛ</p>
        </div>
        <div class="pro-price col-md-2 pro-list-text"><span class="pro-list-price">40,000</span> 원</div>
        <div class="pro-wish col-md-1 pro-list-text">
        	<a class="btn btn-success text-white"><i class="far fa-heart"></i></a>
		</div>
    </div><br><hr><br>
    <div class="row pro-list" id="pro-list-5">
        <div class="pro-photo col-md-3">
	        <img class="card-img img-fluid" src="assets/img/product_single_10.jpg" alt="Card image cap" id="product-detail">	        
        </div>
        <div class="pro-desc col-md-6 pro-list-title">
        	<p class="pro-desc-title">공간명입니다아</p>
        	<p class="pro-desc-lo">공간 위치다</p>
        	<p class="pro-intro">공간을매우길게설명해보아요ㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛㅛ</p>
        </div>
        <div class="pro-price col-md-2 pro-list-text"><span class="pro-list-price">40,000</span> 원</div>
        <div class="pro-wish col-md-1 pro-list-text">
        	<a class="btn btn-success text-white"><i class="far fa-heart"></i></a>
		</div>
    </div><br><br>
</div>



<br><br>

  <ul class="pagination justify-content-center">
    <li class="page-item"><a class="page-link" href="javascript:void(0);">Previous</a></li>
    <li class="page-item"><a class="page-link" href="javascript:void(0);">1</a></li>
    <li class="page-item"><a class="page-link" href="javascript:void(0);">2</a></li>
    <li class="page-item"><a class="page-link" href="javascript:void(0);">3</a></li>
    <li class="page-item"><a class="page-link" href="javascript:void(0);">Next</a></li>
  </ul>

	<br><br>

 


    <!-- End Footer -->

    <!-- Start Script -->
    <script src="assets/js/jquery-1.11.0.min.js"></script>
    <script src="assets/js/jquery-migrate-1.2.1.min.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/templatemo.js"></script>
    <script src="assets/js/custom.js"></script>
    <!-- End Script -->
    
    <script>
    
    // 상품 위에 마우스 커서 댔을 시 색상 변경 및 클릭 활성화
    
	    	$(function(){
			$('#pro-list-1 div').mouseenter(function(){
				$(this).parent().css({'background':'#F2FFED', 'cursor':'pointer'});
			}).mouseout(function(){
				$(this).parent().css({'background':'none'});
			}).click(function(){
				var num = $(this).parent().children().eq(0).text();
				location.href="<%= request.getContextPath() %>/detail.no?no=" + num;
			});
		});
    	
    
    // 검색 최소 날짜 : 오늘
    
	    	$(document).ready(function() {
	    	    var date = new Date();

	    	    var day = date.getDate();
	    	    var month = date.getMonth() + 1;
	    	    var year = date.getFullYear();

	    	    if (month < 10) month = "0" + month;
	    	    if (day < 10) day = "0" + day;

	    	    var today = year + "-" + month + "-" + day;       
	    	    $("#browser4").attr("value", today);
	    	});    
    </script>
</body>

</html>