<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, enroll.model.vo.Enroll, img.model.vo.Img, review.model.vo.Review"%>
<% 
	ArrayList<Enroll> list = (ArrayList)request.getAttribute("list"); 
	ArrayList<Enroll> topList = (ArrayList)request.getAttribute("topList"); 
	ArrayList<Img> topImg = (ArrayList)request.getAttribute("topImg");
	Review review = (Review)request.getAttribute("review");
	Img reImg = (Img)request.getAttribute("reImg");

%>
<!DOCTYPE html>
<html lang="en">

<!-- 페이지 연결 / 지도 마커 표시 / 카테고리 검색 기능 -->

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

</style>
</head>
<body>
        
	
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
                                <h1 style="color: rgb(15, 103, 86)">뒷마당 스페이스<br> 07/10~08/10</h1>
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
                                <h1 style="color: rgb(15, 103, 86)">월간 스페이스<br>-아마추어 서울-</h1>
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
                                                                       의논하는 호스트 컨퍼런스가 7월에는 줌이 아닌<br><a rel="sponsored" style="color: rgb(15, 103, 86)" href="https://gather.town/" target="_blank">개더타운Gather.Town</a>
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
                <h1 class="h1" id="hotSpace">7월, 가장 뜨거웠던 공간🏆</h1>
                <p>
                   	<a href="">지난 한달 간 가장 인기 있었던 공간 10곳.zip</a> <!-- 인기 공간 10곳 경로 링크 적용... 필수 기능 아님 -->
                </p>
            </div>
        </div>
        <div class="row" id="top3Div">
        	<%if(!topList.isEmpty()){ %>
				<%for(int i = 0; i < topList.size(); i++){ %>
					<div class="col-12 col-md-4 p-5 mt-3">
		            	<input type="hidden" name="top1" value="<%=topList.get(i).getpNum()%>">
		                <a href="#"><img src="<%=request.getContextPath() %>/img_upload/<%=topImg.get(i).getImgChange() %>" class="rounded-circle img-fluid border"></a> <!-- 이미지에 해당 공간 경로 링크 적용 -->
		                <h5 class="text-center mt-3 mb-3"><%=topList.get(i).getpName() %></h5>
		                <h6 class="text-center mt-3 mb-3">카테고리 : <%=topList.get(i).getpCategory() %></h6>
		            </div>
				<%} %>        	
        	<%}else { %>
        		<h2>아직 이용된 공간이 없습니다</h2>
        		<h4>Comeon Space에 등록된 다양한 공간을 즐겨보세요!!</h4>
        	<%} %>
        </div>
    </section>
    <!-- 이달의 인기 공간 끝 -->
	


    <!-- 카테고리 시작 -->
    <!-- 필터 검색 기능 이용해서 카테고리 클릭시 해당 카테고리 필터가 적용된 검색창으로 이동 -->
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
            <img src="assets/img/studio.png" class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img"
            aria-label="Placeholder: assets/img/recommend_prod_01.jpg " preserveAspectRatio="xMidYMid slice" focusable="false">

            <div class="card-body">
              <p class="card-text">스튜디오/조명 맛집은 어디?📸</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary categoryBtn">View</button>	<!-- view 버튼 클릭 시 해당 카테고리의 공간들 검색창으로 넘어가게. 공간검색창에서 필터 기능 이용? -->
                  <input type="hidden" name="catrgory1" value="스튜디오">
                </div>
                <small class="text-muted">
                	<%if(!list.isEmpty()) {%>
                		<%for(Enroll en : list){%>
                			<%if(en.getpCategory().equals("스튜디오")){ %>
                				<%=en.getpCount() %> 곳
                			<%} %>
                		<%} %>
                	<%} %>
				</small>
              </div>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card shadow-sm">
             <img src="assets/img/studyCafe.png" class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img"
            aria-label="Placeholder: assets/img/recommend_prod_01.jpg " preserveAspectRatio="xMidYMid slice" focusable="false">

            <div class="card-body">
              <p class="card-text">스터디카페/절대 집중!👩‍🎓</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary categoryBtn">View</button>
                  <input type="hidden" name="catrgory1" value="스터디룸">
                </div>
                <small class="text-muted">
                	<%if(!list.isEmpty()) {%>
                		<%for(Enroll en : list){%>
                			<%if(en.getpCategory().equals("스터디룸")){ %>
                				<%=en.getpCount() %> 곳
                			<%} %>
                		<%} %>
                	<%} %>
				</small>
              </div>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card shadow-sm">
            <img src="assets/img/concertHall.png" class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img"
            aria-label="Placeholder: assets/img/recommend_prod_01.jpg " preserveAspectRatio="xMidYMid slice" focusable="false">

            <div class="card-body">
              <p class="card-text">공연장/꿈을 펼쳐봐!🤟🏼</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary categoryBtn">View</button>
                  <input type="hidden" name="catrgory1" value="공연장">
                </div>
                <small class="text-muted">
                	<%if(!list.isEmpty()) {%>
                		<%for(Enroll en : list){%>
                			<%if(en.getpCategory().equals("공연장")){ %>
                				<%=en.getpCount() %> 곳
                			<%} %>
                		<%} %>
                	<%} %>
				</small>
              </div>
            </div>
          </div>
        </div>

        <div class="col">
          <div class="card shadow-sm">
             <img src="assets/img/meetingRoom.png" class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img"
            aria-label="Placeholder: assets/img/recommend_prod_01.jpg " preserveAspectRatio="xMidYMid slice" focusable="false">

            <div class="card-body">
              <p class="card-text">회의실/아이디어를 쥐어짜보게..💡</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary categoryBtn">View</button>
                  <input type="hidden" name="catrgory1" value="회의실">
                </div>
                <small class="text-muted">
                	<%if(!list.isEmpty()) {%>
                		<%for(Enroll en : list){%>
                			<%if(en.getpCategory().equals("회의실")){ %>
                				<%=en.getpCount() %> 곳
                			<%} %>
                		<%} %>
                	<%} %>
				</small>
              </div>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card shadow-sm">
             <img src="assets/img/shareKitchen.png" class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img"
            aria-label="Placeholder: assets/img/recommend_prod_01.jpg " preserveAspectRatio="xMidYMid slice" focusable="false">

            <div class="card-body">
              <p class="card-text">공유주방/갖고 싶은 잇템 다 있는<br> 우리의 주방👩🏼‍🍳</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary categoryBtn">View</button>
                  <input type="hidden" name="catrgory1" value="주방">
                </div>
                <small class="text-muted">
                	<%if(!list.isEmpty()) {%>
                		<%for(Enroll en : list){%>
                			<%if(en.getpCategory().equals("주방")){ %>
                				<%=en.getpCount() %> 곳
                			<%} %>
                		<%} %>
                	<%} %>
				</small>
              </div>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card shadow-sm">
            <img src="assets/img/office.png" class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img"
            aria-label="Placeholder: assets/img/recommend_prod_01.jpg " preserveAspectRatio="xMidYMid slice" focusable="false">

            <div class="card-body">
              <p class="card-text">오피스/눈치 X 독립오피스부터 카페<br> 같은 공유오피스까지!👨🏼‍💻</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary categoryBtn">View</button>
                  <input type="hidden" name="catrgory1" value="오피스">
                </div>
                <small class="text-muted">
                	<%if(!list.isEmpty()) {%>
                		<%for(Enroll en : list){%>
                			<%if(en.getpCategory().equals("오피스")){ %>
                				<%=en.getpCount() %> 곳
                			<%} %>
                		<%} %>
                	<%} %>
				</small>
              </div>
            </div>
          </div>
        </div>

        <div class="col">
          <div class="card shadow-sm">
             <img src="assets/img/multiHall.png" class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img"
            aria-label="Placeholder: assets/img/recommend_prod_01.jpg " preserveAspectRatio="xMidYMid slice" focusable="false">

            <div class="card-body">
              <p class="card-text">다목적홀/소규모 강연👩‍🏫부터<br>내 작품 전시👨‍🎨까지 다 가능!</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary categoryBtn">View</button>
                  <input type="hidden" name="catrgory1" value="다목적홀">
                </div>
                <small class="text-muted">
                	<%if(!list.isEmpty()) {%>
                		<%for(Enroll en : list){%>
                			<%if(en.getpCategory().equals("다목적홀")){ %>
                				<%=en.getpCount() %> 곳
                			<%} %>
                		<%} %>
                	<%} %>
				</small>
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
	<!-- 카카오 지도 api 이용 -->

<br><br><br>
<div class="mapContainer">
	<div class="row">
		<div class="col-md-1">
			
		</div>
	
		<div class="col-md-3">
			<h2>어느 지역의 공간을<br> 찾으시나요?🕵️‍♂️</h2>	
		</div>
		
    <div class="col-md-7" id="mapid" style="width: 80%; height: 500px; margin: 0 auto;"></div>
    <%@ include file="mainPage_map.jsp" %>
    
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
                        <a href="<%=request.getContextPath()%>/productDetail.no?no=23">
                            <img src="assets/img/recommend_prod_01.jpg" class="card-img-top" alt="..." height=400px;>
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
                                <li class="text-muted text-right">43,000</li>
                            </ul>
                            <a href="<%=request.getContextPath()%>/productDetail.no?no=23" class="h2 text-decoration-none text-dark">레드 클로버</a>
                            <p class="card-text">
					                  레드클로버는 크지 않은 공간이예요.<br>
							그래서 규모가 크고 화려한 파티 보다는<br>
							우리만의 프라이빗한 시간을 보내기 좋은 곳 입니다
                            </p>
                            <p class="text-muted">Reviews <%= review.getCountReview() %></p>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-md-4 mb-4">
                    <div class="card h-100">
                        <a href="<%=request.getContextPath()%>/productDetail.no?no=17">
                            <img src="assets/img/recommend_prod_02.jpg" class="card-img-top" alt="..." height=400px;>
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
                                <li class="text-muted text-right">55,000</li>
                            </ul>
                            <a href="<%=request.getContextPath()%>/productDetail.no?no=17" class="h2 text-decoration-none text-dark">스튜디오 탁월 호리존</a>
                            <p class="card-text">
                                                                스튜디오 탁월 호리존은 발랄한 컨셉의 다양한 컬러가 준비되어 있습니다.
								비비드컬러 전용<br>소품들도 준비가 되어 있으니 귀엽고,<br>사랑스러운 느낌의 셀프사진을 연출해보세요.
                            </p>
                            <p class="text-muted">Reviews <%= review.getCountReview() %></p>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-md-4 mb-4">
                    <div class="card h-100">
                        <a href="<%=request.getContextPath()%>/productDetail.no?no=22">
                            <img src="assets/img/recommend_prod_03.jpg" class="card-img-top" alt="..." height=400px;>
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
                                <li class="text-muted text-right">70,000</li>
                            </ul>
                            <a href="<%=request.getContextPath()%>/productDetail.no?no=22" class="h2 text-decoration-none text-dark">자연광 호코네 스튜디오</a>
                            <p class="card-text">
                                                              한남동에 위치한 셀프사진관입니다.<br>
								20분간 프라이빗한 스튜디오 내에서 자유롭게 촬영이 가능합니다.
								호코네 스튜디오에서 나만의<br> 화보를 만들어보세요!
                            </p>
                            <p class="text-muted">Reviews 3</p>
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
	        <script> $('.carousel').carousel({ interval: 2000  }) </script> <div class="container"><h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;⚜️이 달의 리뷰⚜️</h2></div>
        		<div id="demo" class="carousel slide" data-ride="carousel">
			        <div class="carousel-inner">
			        	<%if(review != null){ %>
					        <img class="d-block w-100" height=300px; src="<%=request.getContextPath() %>/img_upload/<%=reImg.getImgChange() %>" alt="First slide">
			        	<%} else{ %>
			        		<br>
							<h4 style="margin-left: 30px;">[여러분의 리뷰를 기다리고 있습니다.]</h4>
							<br>
	        				<h5 style="margin-left: 47px;">Comeon Space에 등록된 다양한 공간을 이용하고 후기를 남겨주세요.</h5> 	
			        	<%} %>
				        <!-- 인디케이터 -->
			         </div>
			        <!-- 인디케이터 끝 -->
		
   				</div>
			</div>

		<div class="col-md-1"><br><br><br><br><br><br>
        </div>
        <%if(review != null){ %>
	        <div class="col-md-5"><br><br><br><br>
	        	<h3>[<%=review.getProdName() %>]</h3>
	        	<h4> '<%=review.getRevTitle() %>'</h4>
	        	<br>
	        	<h5>'<%=review.getBuyerNic() %>' 님의 리뷰</h5>       	
	        	<p>
					<%=review.getRevContent() %>
	        	</p>
	        </div>
        <%} else {%>
	        <div class="col-md-5"><br><br><br><br>
	        	
	        </div>
        <%} %>
</div>
</div>
	<!-- 이 달의 리뷰 끝 -->
<br><br>
<script>
	$(document).ready(function(){
		$(".categoryBtn").on("click",function(){
			var category = $(this).next().val();
			location.href="<%=request.getContextPath()%>/search.ca?category="+category;
		})
	})
	
	$("#top3Div a").on("click",function(){
		var num = $(this).prev('input').val();
		location.href="<%=request.getContextPath()%>/productDetail.no?no=" + num;
	})
	
</script>
</body>
</html>