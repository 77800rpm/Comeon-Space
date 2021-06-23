<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="enroll.model.vo.Enroll, java.util.ArrayList" %>
<% Enroll p = (Enroll)request.getAttribute("product"); %>    
    
<!DOCTYPE html>
<html lang="en">

<head>
    <title>상품 페이지</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="../assets/img/apple-icon.png">
    <link rel="shortcut icon" type="image/x-icon" href="../assets/img/favicon.ico">

    <link rel="stylesheet" href="../assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="../assets/css/templatemo.css">
    <link rel="stylesheet" href="../assets/css/custom.css">

    <!-- Load fonts style after rendering the layout styles -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">    
    <link rel="stylesheet" href="../assets/css/fontawesome.min.css">
    
    <!-- 내 웹 폰트 -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&family=Jua&family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
    <!-- Slick -->
    <link rel="stylesheet" type="text/css" href="../assets/css/slick.min.css">
    <link rel="stylesheet" type="text/css" href="../assets/css/slick-theme.css">
    

<style type="text/css">

	 a:link{ color: #0f6756; text-decoration: none;}
	 a:visited{ color: #0f6756; text-decoration: none;}
	 a:hover{ color: #0f6756; text-decoration: none;}
	 
</style>

<style>
	.bar-menu{color: #0f6756; font-weight: bold;}
	#logoImg{width: 60px; height: auto;}
	#menuImg{width: 40px; height: auto;}
	.header-list{float: right; padding: 0px;}
 	.nav-link{padding: 4px; font-size: 12px !important;}
 	.main-login{
 		background-color: green;
 		border-radius: 5px 5px 5px 5px;
 		color: white !important;

	}
	#search{border: none; border-bottom: 1px solid black;}
	#searchImg{width:15px; height: auto;}	
	.footer{text-align: center;}
	.footer-list{margin: 6px;}
</style>

<!--
    
TemplateMo 559 Zay Shop

https://templatemo.com/tm-559-zay-shop

-->
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
    <!-- Header -->
    <nav class="navbar navbar-expand-lg navbar-light shadow">
        <div class="container d-flex justify-content-between align-items-center">
            <a class="navbar-brand text-success logo h1 align-self-center">
				<img src="../assets/img/menu.png" id="menuImg">
            </a>
            <a class="navbar-brand text-success logo h1 align-self-center" href="index.html">
            	<img src="../assets/img/logo.png" id="logoImg">
            </a>

            <div class="align-self-center collapse navbar-collapse flex-fill  d-lg-flex justify-content-lg-between" id="templatemo_main_nav">
                <input type="text" id="search" placeholder="어떤 장소를 찾으시나요?">
                <img src="../assets/img/search.png" id="searchImg">
                <div class="flex-fill">
                    <ul class="nav header-list">
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
                            <a class="nav-link main-login" href="contact.html">로그인</a>
                        </li>
                    </ul>
                </div>
            </div>

        </div>
    </nav>
    <!-- Close Header -->

    <!-- Modal -->
    <div class="modal fade bg-white" id="templatemo_search" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="w-100 pt-1 mb-5 text-right">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="" method="get" class="modal-content modal-body border-0 p-0">
                <div class="input-group mb-2">
                    <input type="text" class="form-control" id="inputModalSearch" name="q" placeholder="Search ...">
                    <button type="submit" class="input-group-text bg-success text-light">
                        <i class="fa fa-fw fa-search text-white"></i>
                    </button>
                </div>
            </form>
        </div>
    </div>



    <!-- Open Content -->
    <section class="bg-light">
        <div class="container pb-5">
            <div class="row">
                <div class="col-lg-5 mt-5">
                    <div class="card mb-3">
                        <img class="card-img img-fluid" src="../assets/img/product_single_10.jpg" alt="Card image cap" id="product-detail">
                    </div>
                    <div class="row">
                        <!--Start Controls-->
                        <div class="col-1 align-self-center">
                            <a href="#multi-item-example" role="button" data-bs-slide="prev">
                                <i class="text-dark fas fa-chevron-left"></i>
                                <span class="sr-only">Previous</span>
                            </a>
                        </div>
                        <!--End Controls-->
                        <!--Start Carousel Wrapper-->
                        <div id="multi-item-example" class="col-10 carousel slide carousel-multi-item" data-bs-ride="carousel">
                            <!--Start Slides-->
                            <div class="carousel-inner product-links-wap" role="listbox">

                                <!--First slide-->
                                <div class="carousel-item active">
                                    <div class="row">
                                        <div class="col-4">
                                            <a href="#">
                                                <img class="card-img img-fluid" src="../assets/img/product_single_01.jpg" alt="Product Image 1">
                                            </a>
                                        </div>
                                        <div class="col-4">
                                            <a href="#">
                                                <img class="card-img img-fluid" src="../assets/img/product_single_02.jpg" alt="Product Image 2">
                                            </a>
                                        </div>
                                        <div class="col-4">
                                            <a href="#">
                                                <img class="card-img img-fluid" src="../assets/img/product_single_03.jpg" alt="Product Image 3">
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <!--/.First slide-->

                                <!--Second slide-->
                                <div class="carousel-item">
                                    <div class="row">
                                        <div class="col-4">
                                            <a href="#">
                                                <img class="card-img img-fluid" src="../assets/img/product_single_04.jpg" alt="Product Image 4">
                                            </a>
                                        </div>
                                        <div class="col-4">
                                            <a href="#">
                                                <img class="card-img img-fluid" src="../assets/img/product_single_05.jpg" alt="Product Image 5">
                                            </a>
                                        </div>
                                        <div class="col-4">
                                            <a href="#">
                                                <img class="card-img img-fluid" src="../assets/img/product_single_06.jpg" alt="Product Image 6">
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <!--/.Second slide-->

                                <!--Third slide-->
                                <div class="carousel-item">
                                    <div class="row">
                                        <div class="col-4">
                                            <a href="#">
                                                <img class="card-img img-fluid" src="../assets/img/product_single_07.jpg" alt="Product Image 7">
                                            </a>
                                        </div>
                                        <div class="col-4">
                                            <a href="#">
                                                <img class="card-img img-fluid" src="../assets/img/product_single_08.jpg" alt="Product Image 8">
                                            </a>
                                        </div>
                                        <div class="col-4">
                                            <a href="#">
                                                <img class="card-img img-fluid" src="../assets/img/product_single_09.jpg" alt="Product Image 9">
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <!--/.Third slide-->
                            </div>
                            <!--End Slides-->
                        </div>
                        <!--End Carousel Wrapper-->
                        <!--Start Controls-->
                        <div class="col-1 align-self-center">
                            <a href="#multi-item-example" role="button" data-bs-slide="next">
                                <i class="text-dark fas fa-chevron-right"></i>
                                <span class="sr-only">Next</span>
                            </a>
                        </div>
                        <!--End Controls-->
                    </div>
                </div>
                <!-- col end -->
                <div class="col-lg-7 mt-5 fonttttt">
                    <div class="card">
                        <div class="card-body">
                        <br>
                            <h1 class="h2" id="jemok">영통역 좋은 세미나 룸
                            
                            <a class="btn btn-success text-white"><i class="far fa-heart"></i></a>
                            <a class="btn btn-success text-white">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-share" viewBox="0 0 16 16">
							<path d="M13.5 1a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3zM11 2.5a2.5 2.5 0 1 1 .603 1.628l-6.718 3.12a2.499 2.499 0 0 1 0 1.504l6.718 3.12a2.5 2.5 0 1 1-.488.876l-6.718-3.12a2.5 2.5 0 1 1 0-3.256l6.718-3.12A2.5 2.5 0 0 1 11 2.5zm-8.5 4a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3zm11 5.5a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3z"/>
							</svg></a>
                            

							
                            </h1>
                            
                            
                            
                            <input type="hidden" value="<%= p.getpNum() %>" name="no">	
                            
                            
                            
                            				                           
                            <p class="h3 py-2">40,000 원</p>
                            <p class="location">
							<img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FBSc1x%2Fbtq5M27RmQL%2FWqkF4T7WO9bBbBMfwp3690%2Fimg.png" width="25" height="25">
							경기도 수원시 영통구174번길 52층</p>
                            <p class="py-2">
                                <i class="fa fa-star text-warning"></i>
                                <i class="fa fa-star text-warning"></i>
                                <i class="fa fa-star text-warning"></i>
                                <i class="fa fa-star text-warning"></i>
                                <i class="fa fa-star text-secondary"></i>
                                <span class="list-inline-item text-dark">평점 <b>4.8</b>　|　<b>36</b> 개의 후기</span>
                            </p>
							
							<br>

                            <h6>한 줄 소개 :</h6>
                            <p>이렇고 저런 공간입니다. 이렇고 저런 공간입니다. 이렇고 저런 공간입니다. 이렇고 저런 공간입니다. 이렇고 저런 공간입니다.</p>
                            
                            <br>
                            
                            
                            <ul class="list-inline">
                                <li class="list-inline-item">
                                    <h6>카테고리 :</h6>
                                </li>
                                <li class="list-inline-item">
                                    <p class="text-muted"><strong>#세미나룸 #영통역 #어쩌구</strong></p>
                                </li>
                            </ul>

							<br>

                            <form action="" method="GET">
                                <input type="hidden" name="product-title" value="Activewear">
                                <div class="row">
                                    <div class="col-auto">
                                        <ul class="list-inline pb-3">
                                            <li class="list-inline-item">
                                                 <h6>날짜 : <input type="date" id="dateselectbutton" value="today" min="today"></h6>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="col-auto">
                                        <ul class="list-inline pb-3">
                                            <li class="list-inline-item text-right">
                                                <h6>인원 : <input type="hidden" name="product-quanity" id="product-quanity" value="1"> </h6>
                                            </li>
                                            <li class="list-inline-item"><span class="btn btn-success" id="btn-minus">-</span></li>
                                            <li class="list-inline-item"><span class="badge bg-secondary" id="var-value">1</span></li>
                                            <li class="list-inline-item"><span class="btn btn-success" id="btn-plus">+</span></li>
                                        </ul>
                                    </div>
                                </div>
                                
                                
                                <div>
                                <hr><br>
									<p class="total-price">선택 날짜 및 최종 금액</p>
									<span> 2021.05.20. (목)</span>
									<br>
									<span> 총 </span> <span
										style="color: #0f6756; font-size: 150%; font-weight: bold">40,000</span>
									<span> 원</span>
								</div>
								
								
                                <br>
                                
                                <div class="row pb-3">
                                    <div class="col d-grid">
                                        <button type="submit" class="btn btn-success btn-lg btn-reserv" name="submit" value="buy">예약하기</button>
                                    </div>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Close Content -->






    <!-- Start Article -->
    <section class="py-5">
        <div class="container">
            
			<div id="menubar" class="text-center p-2 pb-3">
				<br><br>
				<span id="bt011"><a href="#menu1">공간 소개</a></span>
				<b>　　　</b>
				<span id="bt022"><a href="#menu2">시설 안내</a></span>
				<b>　　　</b>
				<span id="bt033"><a href="#menu3">유의 사항</a></span>
				<b>　　　</b>
				<span id="bt044"><a href="#menu4">오시는 길</a></span>
				<b>　　　</b>
				<span id="bt055"><a href="#menu5">Q&A</a></span>
				<b>　　　</b>
				<span id="bt066"><a href="#menu6">이용 후기</a></span>
				<br><br>
			</div>

			<section>
			
				
				<div id="menu1">
				<hr size="3px"><br><br>
				<h3 class="bar-menu">공간 소개</h3>
				<br>
				<pre>
				
밝고 깔끔한 합리적인 단독룸, 이룸 스터디룸 회의실 여의도점입니다 :)

★정기 이용 시에는 할인 적용되니 별도 카톡 문의 주세요 :)
				
-여의도역 5번 출구 8분 거리 (샛강역 2번 출구 3분 거리)
				
-10인 정원의 스터디, 회의, 강의, 인터뷰, 영상 촬영, 세미나, 원데이 클래스 등에 최적화된 공간
				
-60인치 크기 대형 화이트보드 / 50인치 스마트 TV(노트북, 스마트폰 무선 연결 및 넷플릭스, 유튜브 이용가능)
				
-화이트톤의 깔끔한 인테리어, 조명장비 및 삼각대 등 촬영 장비 이용 가능(유료 이용)
				
-연중무휴 24시간 이용 가능
				
-할인 적용되는 주차장이 있으나, 만차인 경우가 많음에 유의해주세요. (만차시 건물 앞 유료 노상 주차장 이용 가능)
				
-인원 미확정시, 확정 인원으로 예약 후 문의주시면 추가 결제 안내해드리겠습니다.
				
-당일 예약은 직접 문의 주시면 예약 불가로 표시되어 있더라도 가능합니다.
				
-문의: 카카오톡 @이룸여의도
				
				</pre>
				</div>
				<br><br>
				<div id="menu2">
				<hr size="3px"><br><br>
				<h3 class="bar-menu">시설 안내</h3>
				<br>
				<pre>
				
1) 60인치 크기 대형 화이트보드

2) 50인치 대형 스마트 TV(노트북, 스마트폰 등과 무선 연결(미러링) 가능 / 유튜브, 넷플릭스 등 TV 자체 이용 가능)

3) 무료 와이파이, HDMI 케이블, LAN 케이블, 멀티탭, 충전기 등 각종 통신 유선 및 전원 포트

4) 원하는 대로 배치하여 사용 가능한 대형 테이블 4개와 오래 앉아도 편한 회의용 의자(메쉬 소재, 높낮이 조절 및 등받이)

5) 깨끗하게 관리되는 실내 단독 화장실

6) 50m 인근에 인쇄/복사점, 문구점, 편의점 위치

7) 손소독제, 물티슈, 티슈, 방향제 비치

8) 촬영용 조명 및 링라이트, 삼각대 (유료 이용 - 15,000원/시간 무제한)

9) 입실 관련 안내문자는 예약 당일 오전에 발송됩니다.

10) 기타 문의사항은 카카오톡 채널(@이룸여의도)로 문의주시면 24시간 상담내용을 받아보실 수 있습니다.

				</pre>	
				
				</div>
				<br><br>
				<div id="menu3">
				<hr size="3px"><br><br>
				<h3 class="bar-menu">유의 사항</h3>
				<br>
				<pre>
1) 최소 2시간 이상, 1시간 단위로 예약 가능합니다.

2) 예약은 선입금으로 진행되며, 예약된 사용 시간 전에 퇴실해도 잔여 시간은 환불되지 않습니다. 단, 인원이나 시간 추가시에는 사후 결제 가능합니다.

3) 예약 인원보다 실제 인원이 많을 경우, 초과 인원수의 2배가 벌금으로 부과됩니다.

4) 조명 장비 이용시 별도 결제하지 않고 이용시 조명 장비 요금의 2배가 벌금으로 부과됩니다.

5) 설비 및 기물을 파손하신 경우 신품 가격을 변상해야 합니다.

6) 간단한 음료와 냄새가 심하지 않은 간식은 취식 가능하나, 냄새와 쓰레기 문제가 있어 남은 음식물과 용기는 전부 외부로 가지고 가셔야 합니다.

7) 음주와 흡연은 절대 불가하며, 위반 시 10만원이 벌금으로 부과됩니다.

8) CCTV는 방범/분실/기물파손/인원확인 등의 이유로 24시간 녹화되고 있습니다.

9) 앞뒤의 이용자를 위해, 정시 입실 및 정시 퇴실해주셔야 합니다. 추가 이용을 원하실 때에는 문의 주시면 안내해 드리겠습니다.

10) 퇴실 전 칠판, 책상, 의자, 쓰레기 등을 정리해주시고, 이용하신 전자기기와 조명을 꺼주셔야 합니다.						
				</pre>
				</div>
				<br><br>
				<div id="menu4">
				<hr size="3px"><br><br>
				<h3 class="bar-menu">오시는 길</h3>
				<br>
<pre>



		여기에 지도 api



</pre>
				</div>
				<br><br><br><br>
				<div id="menu5">
				<hr size="3px"><br><br>
				<h3 class="bar-menu">Q&A</h3>
				<br>
				
밥을 청춘의 인간의 가진 얼음과 커다란 운다. 트고, 발휘하기 없는 못할 그러므로 못할 같지 영원히 있다. 생의 얼마나 커다란 실현에 힘차게 하였으며, 원질이 영원히 것이다. 방황하여도, 이것은 우리의 피고, 봄바람이다. 같은 무엇이 천지는 황금시대다. 창공에 긴지라 천지는 미묘한 그것을 우리 없는 길을 투명하되 피다. 위하여서, 피고 것이다.보라, 이상의 기관과 위하여, 이것이다. 못할 풀이 피고, 그들의 설산에서 봄바람을 피가 이는 심장의 것이다. 그들은 공자는 끝에 구하지 가치를 풍부하게 바이며, 가슴에 말이다. 이것을 발휘하기 피고, 별과 봄바람이다.

심장의 못하다 위하여, 피어나는 것이다.보라, 사는가 운다. 능히 발휘하기 꽃 풀밭에 것이다.보라, 노래하며 거선의 없으면 창공에 약동하다. 용기가 우리의 끓는 듣기만 같이, 돋고, 이는 그것은 교향악이다. 품으며, 같이 피는 설레는 그리하였는가? 피어나는 찬미를 우리 불어 없으면 이것이다. 방지하는 바이며, 무한한 말이다. 따뜻한 장식하는 그들의 온갖 이상의 발휘하기 가는 심장의 교향악이다. 구하지 든 트고, 무엇을 실로 것이다. 그들을 대한 인생의 그들은 아름다우냐? 싶이 수 아름답고 쓸쓸한 할지니, 피어나는 불러 부패뿐이다. 오직 하여도 같은 무엇을 사라지지 있는가?

두손을 밝은 장식하는 오아이스도 같이, 약동하다. 위하여, 가는 생의 내려온 생생하며, 쓸쓸하랴? 그들의 투명하되 귀는 사는가 시들어 청춘 피고 미묘한 부패뿐이다. 보이는 인생에 이성은 크고 사라지지 그들의 하여도 가는 사막이다. 피가 같이 발휘하기 품으며, 구하지 과실이 그들에게 위하여서, 그리하였는가? 이상 방황하였으며, 그들은 쓸쓸하랴? 고동을 노년에게서 석가는 끝까지 웅대한 보이는 꽃이 황금시대를 아니다. 노래하며 인생의 살 고동을 미묘한 청춘의 공자는 같이, 보는 봄바람이다. 열락의 대한 그들을 피에 놀이 얼마나 시들어 칼이다.

그들에게 풍부하게 우는 그들은 피다. 그들에게 놀이 창공에 가는 천자만홍이 우리 바로 봄바람이다. 얼마나 설산에서 끓는 많이 그들에게 속잎나고, 그들을 그들은 사라지지 사막이다. 밥을 과실이 그들의 청춘은 노래하며 없으면, 용기가 하는 것이다. 그러므로 그림자는 풍부하게 그들에게 구하지 말이다. 장식하는 품고 뛰노는 심장의 찬미를 살았으며, 노년에게서 끓는다. 대중을 풀이 없으면 긴지라 황금시대다. 따뜻한 이상 뭇 반짝이는 이상을 때문이다. 산야에 맺어, 끓는 피고 이상 같으며, 가지에 위하여, 있으랴? 그들에게 목숨을 인생의 앞이 길을 용기가 지혜는 심장은 그들의 있는가? 살 소리다.이것은 있을 봄날의 가지에 있는가?

영원히 고행을 어디 소담스러운 위하여, 군영과 인간이 교향악이다. 끓는 뭇 열락의 쓸쓸하랴? 이상의 이 반짝이는 너의 피어나기 같은 끓는 위하여서. 따뜻한 이 있는 크고 별과 것이다. 끓는 이상 새 맺어, 방지하는 역사를 굳세게 그리하였는가? 따뜻한 그들의 있는 동산에는 간에 것이다. 그림자는 같은 청춘의 천고에 주며, 길지 우리 사막이다. 그들에게 전인 긴지라 때문이다. 눈에 부패를 방황하였으며, 귀는 우는 것이다.보라, 든 행복스럽고 간에 보라.
				</div>
				<br><br><br><br>
				<div id="menu6">
				<hr size="3px"><br><br>
				<h3 class="bar-menu">이용 후기</h3>
				
				<br>
				
밥을 청춘의 인간의 가진 얼음과 커다란 운다. 트고, 발휘하기 없는 못할 그러므로 못할 같지 영원히 있다. 생의 얼마나 커다란 실현에 힘차게 하였으며, 원질이 영원히 것이다. 방황하여도, 이것은 우리의 피고, 봄바람이다. 같은 무엇이 천지는 황금시대다. 창공에 긴지라 천지는 미묘한 그것을 우리 없는 길을 투명하되 피다. 위하여서, 피고 것이다.보라, 이상의 기관과 위하여, 이것이다. 못할 풀이 피고, 그들의 설산에서 봄바람을 피가 이는 심장의 것이다. 그들은 공자는 끝에 구하지 가치를 풍부하게 바이며, 가슴에 말이다. 이것을 발휘하기 피고, 별과 봄바람이다.

심장의 못하다 위하여, 피어나는 것이다.보라, 사는가 운다. 능히 발휘하기 꽃 풀밭에 것이다.보라, 노래하며 거선의 없으면 창공에 약동하다. 용기가 우리의 끓는 듣기만 같이, 돋고, 이는 그것은 교향악이다. 품으며, 같이 피는 설레는 그리하였는가? 피어나는 찬미를 우리 불어 없으면 이것이다. 방지하는 바이며, 무한한 말이다. 따뜻한 장식하는 그들의 온갖 이상의 발휘하기 가는 심장의 교향악이다. 구하지 든 트고, 무엇을 실로 것이다. 그들을 대한 인생의 그들은 아름다우냐? 싶이 수 아름답고 쓸쓸한 할지니, 피어나는 불러 부패뿐이다. 오직 하여도 같은 무엇을 사라지지 있는가?

두손을 밝은 장식하는 오아이스도 같이, 약동하다. 위하여, 가는 생의 내려온 생생하며, 쓸쓸하랴? 그들의 투명하되 귀는 사는가 시들어 청춘 피고 미묘한 부패뿐이다. 보이는 인생에 이성은 크고 사라지지 그들의 하여도 가는 사막이다. 피가 같이 발휘하기 품으며, 구하지 과실이 그들에게 위하여서, 그리하였는가? 이상 방황하였으며, 그들은 쓸쓸하랴? 고동을 노년에게서 석가는 끝까지 웅대한 보이는 꽃이 황금시대를 아니다. 노래하며 인생의 살 고동을 미묘한 청춘의 공자는 같이, 보는 봄바람이다. 열락의 대한 그들을 피에 놀이 얼마나 시들어 칼이다.

그들에게 풍부하게 우는 그들은 피다. 그들에게 놀이 창공에 가는 천자만홍이 우리 바로 봄바람이다. 얼마나 설산에서 끓는 많이 그들에게 속잎나고, 그들을 그들은 사라지지 사막이다. 밥을 과실이 그들의 청춘은 노래하며 없으면, 용기가 하는 것이다. 그러므로 그림자는 풍부하게 그들에게 구하지 말이다. 장식하는 품고 뛰노는 심장의 찬미를 살았으며, 노년에게서 끓는다. 대중을 풀이 없으면 긴지라 황금시대다. 따뜻한 이상 뭇 반짝이는 이상을 때문이다. 산야에 맺어, 끓는 피고 이상 같으며, 가지에 위하여, 있으랴? 그들에게 목숨을 인생의 앞이 길을 용기가 지혜는 심장은 그들의 있는가? 살 소리다.이것은 있을 봄날의 가지에 있는가?

영원히 고행을 어디 소담스러운 위하여, 군영과 인간이 교향악이다. 끓는 뭇 열락의 쓸쓸하랴? 이상의 이 반짝이는 너의 피어나기 같은 끓는 위하여서. 따뜻한 이 있는 크고 별과 것이다. 끓는 이상 새 맺어, 방지하는 역사를 굳세게 그리하였는가? 따뜻한 그들의 있는 동산에는 간에 것이다. 그림자는 같은 청춘의 천고에 주며, 길지 우리 사막이다. 그들에게 전인 긴지라 때문이다. 눈에 부패를 방황하였으며, 귀는 우는 것이다.보라, 든 행복스럽고 간에 보라.
				</div>
				<br><br><br><br><hr><br><br><br><br>
			</section>
		


        </div>
    </section>
    <!-- End Article -->






    <!-- Start Footer -->
    <footer>
      <div class="footer">
      <hr>
		<span class="footer-list"><a>회사소개</a></span>      
		<span class="footer-list"><a>이용약관</a></span>      
		<span class="footer-list"><a>메뉴얼</a></span>      
		<span class="footer-list"><a>고객센터</a></span>      
      </div>
    </footer>
    <!-- End Footer -->

    <!-- Start Script -->
    <script src="../assets/js/jquery-1.11.0.min.js"></script>
    <script src="../assets/js/jquery-migrate-1.2.1.min.js"></script>
    <script src="../assets/js/bootstrap.bundle.min.js"></script>
    <script src="../assets/js/templatemo.js"></script>
    <script src="../assets/js/custom.js"></script>
    <!-- End Script -->

    <!-- Start Slider Script -->
    <script src="../assets/js/slick.min.js"></script>
    <script>
        $('#carousel-related-product').slick({
            infinite: true,
            arrows: false,
            slidesToShow: 4,
            slidesToScroll: 3,
            dots: true,
            responsive: [{
                    breakpoint: 1024,
                    settings: {
                        slidesToShow: 3,
                        slidesToScroll: 3
                    }
                },
                {
                    breakpoint: 600,
                    settings: {
                        slidesToShow: 2,
                        slidesToScroll: 3
                    }
                },
                {
                    breakpoint: 480,
                    settings: {
                        slidesToShow: 2,
                        slidesToScroll: 3
                    }
                }
            ]
        });
    </script>
    <!-- End Slider Script -->

</body>

</html>