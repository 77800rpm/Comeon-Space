<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="enroll.model.vo.Enroll, img.model.vo.*, java.util.ArrayList, member.model.vo.Member, qna.model.vo.Qna" %>
<%
	int bId = (int)request.getAttribute("no");
	Enroll p = (Enroll)request.getAttribute("product");
	Member loginUser = (Member)session.getAttribute("loginUser");

	ArrayList<Qna> qnaList = (ArrayList)request.getAttribute("qnaList");
	ArrayList<Img> fileList = (ArrayList)request.getAttribute("fileList"); 
	Img titleImg = fileList.get(0);
	Img profile = (Img)request.getAttribute("img");
	
	String[] checkedFacility = new String[17];
	String facilityStr = p.getpFacility();
	
	if(!facilityStr.equals("null")) {
		String[] splitStr = facilityStr.split(", ");
		for(String str : splitStr){
			switch(str) {
				case "TV": checkedFacility[0] = "checked"; break;
				case "빔 프로젝트": checkedFacility[1] = "checked"; break;
				case "마이크": checkedFacility[2] = "checked"; break;
				case "주차공간": checkedFacility[3] = "checked"; break;
				case "내부 화장실": checkedFacility[4] = "checked"; break;
				case "PC/노트북": checkedFacility[5] = "checked"; break;
				case "금연": checkedFacility[6] = "checked"; break;
				case "취사시설": checkedFacility[7] = "checked"; break;
				case "복사/인쇄기": checkedFacility[8] = "checked"; break;
				case "화이트보드": checkedFacility[9] = "checked"; break;
				case "전신거울": checkedFacility[10] = "checked"; break;
				case "의자/테이블": checkedFacility[11] = "checked"; break;
				case "공용라운지": checkedFacility[12] = "checked"; break;
				case "테라스/루트탑": checkedFacility[13] = "checked"; break;
				case "탈의실": checkedFacility[14] = "checked"; break;
				case "반려동물 동반가능": checkedFacility[15] = "checked"; break;
				case "음식물 반입가능": checkedFacility[16] = "checked"; break;
			}
		}
	}
%>    
    
<!DOCTYPE html>
<html lang="en">
<head>
    <title>상품 페이지</title>
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
    
    <!-- 내 웹 폰트 -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&family=Jua&family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
    <!-- Slick -->
    <link rel="stylesheet" type="text/css" href="assets/css/slick.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/slick-theme.css">
    
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
   <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    



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
   
   
   
   /* 입력할 부분 클릭 시, 겉에 태두리 생기는 부분*/
   textarea:focus{color:#212529;border-color:rgb(15, 103, 86, 30);outline:0;box-shadow:0 0 0 .1rem rgb(15, 103, 86, 30)}
   
   /* 버튼 클릭 (편의시설/정기휴무일) 디자인 */
   .btn-primary{color:DimGrey; background-color:white; border-color:lightgray;}
   .btn-primary:hover{color:DimGrey; background-color:white; border-color:lightgray;}
   input[type=checkbox]:checked + label {color:white; background-color:rgb(15, 103, 86);}
   
   /*체크박스를 다 안보이게*/
   input[type=checkbox]{display:none;}
   .detailDiv{display:inline-block;}
   .detailDiv:hover{cursor:pointer;}
   .hiddenBtn{display:none;}
   
   .qna-nickname {
      color: #0f6756 !important;
      font-weight: 700;
   }
   
   
   .qna-nickname-host {
      color: #498579 !important;
      font-weight: 700;
   }
   
   #qnaHost {
      color: #0f6756 !important;   
      font-weight: 700;      
       font-size: 20px !important;      
   }
   
   .qna-date {
      color: #829894 !important;
      zoom : 80%;
   }
   
   #qna-all-list {
       font-family: 'Nanum Gothic', sans-serif !important;   
       font-size: 18px !important;   
    }
    
    .qnaBtn {
      zoom: 90%;
    }
    
    .qnaText {
      resize:none;
      line-height: 30px;
      background-color: #eef4f3;      
      border: none;
      border-radius: 10px;
      position: relative;
      top: 4px;
    
    }
    
    .profile-size {
    	zoom: 60%;
    	object-fit: cover;
		border-radius: 100%;
    }
    .profile-size2 {
    	zoom: 60%;
    	object-fit: cover;
		border-radius: 100%;
		width: 200px; height: 200px;
    }
   
    
    .profile-size-host {
       zoom: 65%;
       object-fit: cover;
      position: relative;
      left: 100px;
    }
    
    .startPro{
    	position: fixed;
    	bottom: 25px;
    	right: 35px;
    	zoom: 120%;
    }
    
    .startProBtn{
    	zoom: 150%;
    }
   
  	#logout, #login{
  		cursor: pointer;
  		background-color: #0f6756 !important;  
  	}
</style>
   
   <!-- 지도 api 스크립트 -->
   <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1165f3d77895f712c2f9db5d4f67bb0d&libraries=services,clusterer,drawing"></script>
   <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
   
</head>

<body>

    <!-- Header -->
    <nav class="navbar navbar-expand-lg navbar-light shadow">
        <div class="container d-flex justify-content-between align-items-center">
			<a class="navbar-brand" href="index.jsp"><img src="resources/image/logo.png" id="logoImg"></a>

            <div class="align-self-center collapse navbar-collapse flex-fill  d-lg-flex justify-content-lg-between" id="templatemo_main_nav">
                <div class="flex-fill">
                    <ul class="nav header-list">
                        <li class="nav-item">                
                        <li class="nav-item">
                            <a class="nav-link" href="search.pro">공간보기 |</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="enrollMain.en">공간등록 |</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="<%= request.getContextPath() %>/centerView.ce">고객센터 |</a>
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



    <!-- Open Content -->
    <section class="bg-light">
        <div class="container pb-5" id="startPro">
            <div class="row">
                <div class="col-lg-5 mt-5">
                    <div class="card mb-3">
                        <img class="card-img img-fluid" src="<%= request.getContextPath() %>/img_upload/<%= titleImg.getImgChange() %>" alt="Card image cap" id="product-detail">
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
                                                <img class="card-img img-fluid" src="<%= request.getContextPath() %>/img_upload/<%= fileList.get(1).getImgChange() %>" alt="Product Image 1">
                                            </a>
                                        </div>
                                        
                                        <div class="col-4">
                                            <a href="#">
                                                <img class="card-img img-fluid" src="<%= request.getContextPath() %>/img_upload/<%= fileList.get(2).getImgChange() %>" alt="Product Image 2">
                                            </a>
                                        </div>
                                        <div class="col-4">
                                            <a href="#">
                                                <img class="card-img img-fluid" src="<%= request.getContextPath() %>/img_upload/<%= fileList.get(3).getImgChange() %>" alt="Product Image 3">
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
                                                <img class="card-img img-fluid" src="<%= request.getContextPath() %>/img_upload/<%= fileList.get(1).getImgChange() %>" alt="Product Image 1">
                                            </a>
                                        </div>
                                        
                                        <div class="col-4">
                                            <a href="#">
                                                <img class="card-img img-fluid" src="<%= request.getContextPath() %>/img_upload/<%= fileList.get(2).getImgChange() %>" alt="Product Image 2">
                                            </a>
                                        </div>
                                        <div class="col-4">
                                            <a href="#">
                                                <img class="card-img img-fluid" src="<%= request.getContextPath() %>/img_upload/<%= fileList.get(3).getImgChange() %>" alt="Product Image 3">
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
                                                <img class="card-img img-fluid" src="<%= request.getContextPath() %>/img_upload/<%= fileList.get(1).getImgChange() %>" alt="Product Image 1">
                                            </a>
                                        </div>
                                        
                                        <div class="col-4">
                                            <a href="#">
                                                <img class="card-img img-fluid" src="<%= request.getContextPath() %>/img_upload/<%= fileList.get(2).getImgChange() %>" alt="Product Image 2">
                                            </a>
                                        </div>
                                        <div class="col-4">
                                            <a href="#">
                                                <img class="card-img img-fluid" src="<%= request.getContextPath() %>/img_upload/<%= fileList.get(3).getImgChange() %>" alt="Product Image 3">
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
                            <h1 class="h2" id="jemok"><%= p.getpName() %><input type = "hidden" id="api-name" value="<%= p.getpName() %>">
                            
                            

                     
                            </h1>
                            
                           
                            <input type="hidden" value="<%= p.getpNum() %>">   
                            <input type="hidden" value="<%= p.getUserNum() %>" name="hostNum" id="hostQnaNum">   
                            <input type="hidden" value="<%= bId %>" name="bId" id="bId">
                            
                            
                                                                   
                            <p class="location">
                     <img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FBSc1x%2Fbtq5M27RmQL%2FWqkF4T7WO9bBbBMfwp3690%2Fimg.png" width="25" height="25">
                     <span id="location-api"><%= p.getpLocation() %></span></p><input type = "hidden" id="api-adrr" value="<%= p.getpLocation() %>">
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
                            <p><%= p.getpIntro() %></p>
                            
                            <br>
                            
                            
                            <ul class="list-inline">
                                <li class="list-inline-item">
                                    <h6>카테고리 :</h6>
                                </li>
                                <li class="list-inline-item">
                                    <p class="text-muted"><strong>#<%= p.getpName() %>　#<%= p.getpCategory() %>　#최대인원_<%= p.getpLimit() %>　#휴무일_<%= p.getHoliday() %></strong></p>
                                </li>
                            </ul>

                     <br>

                            <form action="" method="GET">
                                <input type="hidden" name="product-title" value="Activewear">
                                <div class="row">
                                    <div class="col-auto">
                                        <ul class="list-inline pb-3">
                                            <li class="list-inline-item">
                                                 <h6>날짜 : <input type="date" id="dateselectbutton" name="select-date" min="today"></h6>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="col-auto">
                                        <ul class="list-inline pb-3">
                                            <li class="list-inline-item text-right">
                                                <h6>인원 : <input type="hidden" name="product-quanity" id="product-quanity" value="1" max="<%= p.getpLimit() %>">  </h6>
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
                           <span class="dateResult">날짜를 지정해 주세요.</span><span> </span><span class="dateWeekResult"></span>
                           <br>
                           <span> 총 </span> <span
                              style="color: #0f6756; font-size: 150%; font-weight: bold"><%= p.getProductPrice() %></span>
                           <span> 원</span>
                        </div>
                           </form>
                           <% if(loginUser == null){ %>
 							<input style="width: 30%" type="submit" class="btn btn-success btn-lg btn-reserv" name="goLogin" value="로그인"></button>
 							<%} else { %>
 							      <form action="<%=request.getContextPath()%>/realPay.me" method="post">
                               	   <input type="hidden" name="prodName" value="<%=p.getpName()%>" />
                               	   <input type="hidden" name="totalPrice" value="<%=p.getProductPrice()%>" />
                               	   <input type="hidden" name="buyerEmail" value="<%=loginUser.getUserEmail()%>"/>
                               	   <input type="hidden" name="buyerName" value="<%=loginUser.getUserName()%>"/>
                               	   <input type="hidden" name="buyerPhone" value="<%=loginUser.getUserPhone()%>"/>
                               	   <input type="hidden" name="prodNum" value="<%=p.getpNum()%>"/>
                               	   <input type="hidden" name="hostNum" value="<%=p.getUserNum()%>"/>
                                   <input style="width: 30%" type="submit" class="btn btn-success btn-lg btn-reserv" name="submit" value="예약"></button>
 								  </form>
 							<% } %>
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
            <span id="bt022"><a href="#menu2">편의 시설</a></span>
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
            <pre id="p-Detail">
            
<%= p.getpDetail() %>
            
            </pre>
            </div>
            <br><br>
            <div id="menu2">
            <hr size="3px"><br><br>
            <h3 class="bar-menu">편의 시설</h3>
            <br>

            
         <div class="row">
            <div class="mb-3">
            <label class="mb-2"></label><br>
               <input type="checkbox" id="chk1" value="TV" name="facility" <%= checkedFacility[0] %> disabled>
               <label for="chk1" class="btn btn-primary">TV</label>
               <input type="checkbox" id="chk2" value="빔 프로젝트" name="facility" <%= checkedFacility[1] %> disabled>
               <label for="chk2" class="btn btn-primary">빔 프로젝트</label>
               <input type="checkbox" id="chk3" value="마이크" name="facility" <%= checkedFacility[2] %> disabled>
               <label for="chk3" class="btn btn-primary">마이크</label>
               <input type="checkbox" id="chk4" value="주차공간" name="facility" <%= checkedFacility[3] %> disabled>
               <label for="chk4" class="btn btn-primary">주차공간</label>
               <input type="checkbox" id="chk5" value="내부 화장실" name="facility" <%= checkedFacility[4] %> disabled>
               <label for="chk5" class="btn btn-primary">내부 화장실</label>
               <input type="checkbox" id="chk6" value="PC/노트북" name="facility" <%= checkedFacility[5] %> disabled>
               <label for="chk6" class="btn btn-primary">PC/노트북</label>
               <input type="checkbox" id="chk7" value="금연" name="facility" <%= checkedFacility[6] %> disabled>
               <label for="chk7" class="btn btn-primary">금연</label>
               <input type="checkbox" id="chk8" value="취사시설" name="facility" <%= checkedFacility[7] %> disabled>
               <label for="chk8" class="btn btn-primary">취사시설</label>
               <input type="checkbox" id="chk9" value="복사/인쇄기" name="facility" <%= checkedFacility[8] %> disabled>
               <label for="chk9" class="btn btn-primary">복사/인쇄기</label>
               <input type="checkbox" id="chk10" value="화이트보드" name="facility" <%= checkedFacility[9] %> disabled>
               <label for="chk10" class="btn btn-primary">화이트보드</label>
               <input type="checkbox" id="chk11" value="전신거울" name="facility" <%= checkedFacility[10] %> disabled>
               <label for="chk11" class="btn btn-primary">전신거울</label>
               <input type="checkbox" id="chk12" value="의자/테이블" name="facility" <%= checkedFacility[11] %> disabled>
               <label for="chk12" class="btn btn-primary">의자/테이블</label>
               <input type="checkbox" id="chk13" value="공용라운지" name="facility" <%= checkedFacility[12] %> disabled>
               <label for="chk13" class="btn btn-primary">공용라운지</label>
               <input type="checkbox" id="chk14" value="테라스/루트탑" name="facility" <%= checkedFacility[13] %> disabled>
               <label for="chk14" class="btn btn-primary">테라스/루트탑</label>
               <input type="checkbox" id="chk15" value="탈의실" name="facility" <%= checkedFacility[14] %> disabled>
               <label for="chk15" class="btn btn-primary">탈의실</label>
               <input type="checkbox" id="chk16" value="반려동물 동반가능" name="facility" <%= checkedFacility[15] %> disabled>
               <label for="chk16" class="btn btn-primary">반려동물 동반가능</label>
               <input type="checkbox" id="chk17" value="음식물 반입가능" name="facility" <%= checkedFacility[16] %> disabled>
               <label for="chk17" class="btn btn-primary">음식물 반입가능</label>
            </div>
         </div>
   
            
            </div>
            <br><br>
            <div id="menu3">
            <hr size="3px"><br><br>
            <h3 class="bar-menu">유의 사항</h3>
            <br>
            <pre>
1) 하루 단위로 예약 가능합니다.

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


<div id="map" style="width:100%;height:550px;"></div>

				</div>
				<br><br><br><br>
				<div id="menu5">
				<hr size="3px"><br><br>
				<h3 class="bar-menu">Q&A</h3>
				<br><br><br>
				<%if(loginUser != null){ %>
					<input type="hidden" id="userNum" value="<%=loginUser.getUserNum()%>">
					<input type="hidden" id="userEmail" value="<%=loginUser.getUserEmail()%>">
					<input type="hidden" id="pName" value="<%= p.getpName()%>">
					<%if(profile != null){ %>
						<input type="hidden" id="profile" value="<%=profile.getImgChange()%>">
					<%} %>
				<%} %>
				<div id="qna-all-list">
					<div id="qnaSelectTable">
					<%if(qnaList.isEmpty()){ %>
							<div>등록된 Q&A가 없습니다.</div>
					<%} else { %>
						<%for(Qna qna : qnaList){ %>
							<div class="row">
								<div class="pro-photo col-md-1 profile-size">
									<%if(qna.getUserProfile() == null){ %>
										<img class="profile-size" src="resources/image/defaultProfile.png">
									<%} else {%>
										<img class="profile-size2" src="<%=request.getContextPath()%>/img_upload/<%=qna.getUserProfile()%>">
									<%} %>
								</div>
								<div class="pro-desc col-md-6" id="qnaList">					
									<p class="qna-nickname"><%=qna.getUserNick() %>　<span class="qna-date"><%=qna.getQnaDate() %></span></p>
									<p><%=qna.getQnaContent() %></p><br>														
								</div>
							</div>	
							
							<div class="row">
								<%if(qna.getQnaAnswer() != null){ %>
								<div class="pro-photo col-md-1 profile-size"><img class="profile-size-host" src="resources/image/arrow.png"></div>
								<div class="pro-desc col-md-6" id="qnaList">					
									<p class="qna-nickname-host">'<%=p.getpName() %>' 호스트의 답글　<span class="qna-date"><%=qna.getAnsDate() %></span></p>
									<p><%=qna.getQnaAnswer() %></p><br><br>														
								</div>
								<%} %>
							</div>	
						<%} %>
					<%} %>
					</div>
				</div>
				<br>
				<div>
				<br>
					<table>
						<%if(loginUser != null){ %>
							<tr>
								<td id="qnaHost">호스트에게 질문하기</td>
							</tr>
							<tr>
								<td><textarea rows="1" cols="80" id="qnaContent" class="qnaText"></textarea></td>
								<td>&nbsp;<input type="button" id="browser5" class="qnaBtn" value="문의하기"></td>
							</tr>
						<%} %>
					</table>
				</div>
				
				</div>		
								
				<br><br>
				<div id="menu6">
				<hr size="3px"><br><br>
				<h3 class="bar-menu">이용 후기</h3>
				
				<br>
				
				밥을 청춘의 인간의 가진 얼음과 커다란 운다. 트고, 발휘하기 없는 못할 그러므로 못할 같지 영원히 있다. 생의 얼마나 커다란 실현에 힘차게 하였으며, 원질이 영원히 것이다. 방황하여도,
				이것은 우리의 피고, 봄바람이다. 같은 무엇이 천지는 황금시대다. 창공에 긴지라 천지는 미묘한 그것을 우리 없는 길을 투명하되 피다. 위하여서, 피고 것이다.보라, 이상의 기관과 위하여, 이것이다.
				못할 풀이 피고, 그들의 설산에서 봄바람을 피가 이는 심장의 것이다. 그들은 공자는 끝에 구하지 가치를 풍부하게 바이며, 가슴에 말이다. 이것을 발휘하기 피고, 별과 봄바람이다. 심장의 못하다 위하여,
				피어나는 것이다.보라, 사는가 운다. 능히 발휘하기 꽃 풀밭에 것이다.보라, 노래하며 거선의 없으면 창공에 약동하다. 용기가 우리의 끓는 듣기만 같이, 돋고, 이는 그것은 교향악이다. 품으며,
				같이 피는 설레는 그리하였는가? 피어나는 찬미를 우리 불어 없으면 이것이다. 방지하는 바이며, 무한한 말이다. 따뜻한 장식하는 그들의 온갖 이상의 발휘하기 가는 심장의 교향악이다. 구하지 든 트고,
				무엇을 실로 것이다. 그들을 대한 인생의 그들은 아름다우냐? 싶이 수 아름답고 쓸쓸한 할지니, 피어나는 불러 부패뿐이다. 오직 하여도 같은 무엇을 사라지지 있는가? 두손을 밝은 장식하는 오아이스도 같이,
				약동하다. 위하여, 가는 생의 내려온 생생하며, 쓸쓸하랴? 그들의 투명하되 귀는 사는가 시들어 청춘 피고 미묘한 부패뿐이다. 보이는 인생에 이성은 크고 사라지지 그들의 하여도 가는 사막이다.
				피가 같이 발휘하기 품으며, 구하지 과실이 그들에게 위하여서, 그리하였는가? 이상 방황하였으며, 그들은 쓸쓸하랴? 고동을 노년에게서 석가는 끝까지 웅대한 보이는 꽃이 황금시대를 아니다.
				노래하며 인생의 살 고동을 미묘한 청춘의 공자는 같이, 보는 봄바람이다. 열락의 대한 그들을 피에 놀이 얼마나 시들어 칼이다. 그들에게 풍부하게 우는 그들은 피다.
				그들에게 놀이 창공에 가는 천자만홍이 우리 바로 봄바람이다. 얼마나 설산에서 끓는 많이 그들에게 속잎나고, 그들을 그들은 사라지지 사막이다. 밥을 과실이 그들의 청춘은 노래하며 없으면, 용기가 하는 것이다.
				그러므로 그림자는 풍부하게 그들에게 구하지 말이다. 장식하는 품고 뛰노는 심장의 찬미를 살았으며, 노년에게서 끓는다. 대중을 풀이 없으면 긴지라 황금시대다. 따뜻한 이상 뭇 반짝이는 이상을 때문이다.
				산야에 맺어, 끓는 피고 이상 같으며, 가지에 위하여, 있으랴? 그들에게 목숨을 인생의 앞이 길을 용기가 지혜는 심장은 그들의 있는가? 살 소리다.이것은 있을 봄날의 가지에 있는가?
				영원히 고행을 어디 소담스러운 위하여, 군영과 인간이 교향악이다. 끓는 뭇 열락의 쓸쓸하랴? 이상의 이 반짝이는 너의 피어나기 같은 끓는 위하여서. 따뜻한 이 있는 크고 별과 것이다. 
				는 이상 새 맺어, 방지하는 역사를 굳세게 그리하였는가? 따뜻한 그들의 있는 동산에는 간에 것이다. 그림자는 같은 청춘의 천고에 주며, 길지 우리 사막이다. 그들에게 전인 긴지라 때문이다.
				눈에 부패를 방황하였으며, 귀는 우는 것이다.보라, 든 행복스럽고 간에 보라.
            
            </div>
            <br><br><br><br><hr><br><br><br><br>
         </section>
      


        </div>
    </section>
    <!-- End Article -->



	<!-- 위로 가기 -->
	<div class="startPro">
	<a href="#startPro">
	<span class="startProBtn">
		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-up-square-fill" viewBox="0 0 16 16">
		<path d="M2 16a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2zm6.5-4.5V5.707l2.146 2.147a.5.5 0 0 0 .708-.708l-3-3a.5.5 0 0 0-.708 0l-3 3a.5.5 0 1 0 .708.708L7.5 5.707V11.5a.5.5 0 0 0 1 0z"/>
		</svg>
	</span>
	TOP
	</a>
</div>



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
    <script src="assets/js/jquery-1.11.0.min.js"></script>
    <script src="assets/js/jquery-migrate-1.2.1.min.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/templatemo.js"></script>
    <script src="assets/js/custom.js"></script>
    <!-- End Script -->

    <!-- Start Slider Script -->
    <script src="assets/js/slick.min.js"></script>
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
    
    <!-- 지도 api -->
    <script>
    // 주소를 이용해 좌표 값 받아 오기
    var apiadrr = $('#api-adrr').val();
    // 장소 이름 받아 오기
    var apiname = $('#api-name').val();
    
    var geocoder = new kakao.maps.services.Geocoder();
    var callback = function(result, status) {
        if (status === kakao.maps.services.Status.OK) {
            console.log(result);
        }
    };
    // apiadrr에 x,y값 제대로 담긴 것 확인
    geocoder.addressSearch(apiadrr, callback);
    
    
    
    
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  
    
    var map = new kakao.maps.Map(mapContainer, mapOption); 
    geocoder.addressSearch(apiadrr, function(result, status) {
        // 정상적으로 검색이 완료됐으면 
         if (status === kakao.maps.services.Status.OK) {
            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
            // 결과값으로 받은 위치를 마커로 표시합니다
            var marker = new kakao.maps.Marker({
                map: map,
                position: coords
            });
            // 인포윈도우로 장소에 대한 설명을 표시합니다
            var infowindow = new kakao.maps.InfoWindow({
                content: apiname
            });
            infowindow.open(map, marker);
            // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
            map.setCenter(coords);
        } 
    });  
    //Q&A 등록하기
    $("#browser5").on("click",function(){
    	var hostNum = $("#hostQnaNum").val();
    	var userNum = $("#userNum").val();
    	var bId = $("#bId").val();
    	var profile = $("#profile").val();
    	var content = $("#qnaContent").val();
    	var userEmail = $("#userEmail").val();
    	var pName = $("#pName").val();

    	if(content.length == 0){
    		alert("Q&A를 입력해주세요.");
    	} else {
	    	$.ajax({
	    		url:"insertQna.qa",
	    		data:{hostNum:hostNum, userNum:userNum, bId:bId, content:content, userEmail:userEmail, pName:pName, profile:profile},
	    		success:function(data){
	    				$replyTable = $("#qnaSelectTable");
						$replyTable.html('');
						
						for(i in data){
							var $startDiv = $("<div>").attr("class","row");
							var $div = $("<div>").html("<img class='profile-size' src='resources/image/defaultProfile.png'>").attr("class","pro-photo col-md-1 profile-size");
							var $div2 = $("<div>").html("<p class='qna-nickname'>"+data[i].userNick+"<span class='qna-date'>"+data[i].qnaDate+"<span></p><br><p>"+data[i].qnaContent+"</p>").attr("class","pro-desc col-md-6");
							
							$startDiv.append($div);
							$startDiv.append($div2);
							$replyTable.append($startDiv);
						}
					$("#qnaContent").val('');
					location.reload();
    			}, error:function(data){
    				console.log("실패");
    			}
    			
    		}); 
    	}	
    })
    
    
    
    

// 오늘 날짜

var today = new Date();
today.setDate(today.getDate());

// 최종 날짜
    $(document).ready(function(){
       $("#dateselectbutton").change(function(){
          var value = $(this).val();
          console.log(value);
          var weekName = new Array('일','월','화','수','목','금','토'); 
          var day = new Date(value).getDay();
          var dateWeek = weekName[day];
          console.log(dateWeek);
          
         $(".dateResult").text(value);
         $(".dateWeekResult").text("(" + dateWeek + ")");
       });
    })
    

 $('#login').on('click', function(){
		location.href="<%= request.getContextPath() %>/loginForm.me";
	});
	
	$('#logout').on('click', function(){
		location.href="<%= request.getContextPath() %>/logout.me";
	});

   </script>   

</body>
</html>