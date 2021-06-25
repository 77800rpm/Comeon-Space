<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, enroll.model.vo.Enroll, img.model.vo.*" %>
<% ArrayList<Enroll> list = (ArrayList)request.getAttribute("list"); %>    
<% ArrayList<Img> fList = (ArrayList)request.getAttribute("fList"); %>    
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



<style>
	*{font-family: 'Nanum Gothic', sans-serif;}
</style>
</head>

<body>



    <!-- Header -->
	<%@ include file="../common/header.jsp" %>
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
        	<!-- 검색 -->
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
    
    <!-- 상품 리스트 출력 if문 -->
    
<% if(list.isEmpty() || fList.isEmpty()) { %>

<p>존재하는 공간이 없습니다.</p>

<% } else { %>
	<% for(int i = 0 ; i < list.size(); i++) { %>
	<% Enroll p = list.get(i); %>

    <div class="row pro-list" id="pro-list-1">
    	   	
	    <div class="pro-photo col-md-3">  
		      
		   	<% for(int j = 0 ; j < fList.size(); j++){ %>
		   	<% Img f = fList.get(j); %> 
		   	<% if(p.getpNum() == f.getImgBoardId()) { %>
			        <img class="card-img img-fluid" src="<%= request.getContextPath() %>/img_upload/<%= f.getImgChange() %>" alt="Card image cap" id="product-detail">	 
			<%	 } %>
			<% } %>	               
	    </div>
	  		        
	    <div class="pro-desc col-md-6 pro-list-title" >
	        	<p class="pro-desc-title"><%= p.getpName() %></p>
	        	<p class="pro-desc-lo">
		        	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-geo-alt-fill" viewBox="0 0 16 16">
					<path d="M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10zm0-7a3 3 0 1 1 0-6 3 3 0 0 1 0 6z"/>
					</svg>
					<%= p.getpLocation() %>
	        	<p class="pro-intro"><%= p.getpIntro() %></p>
	    </div>
	    
	    <div class="pro-price col-md-2 pro-list-text" id="pro-list-text-id1"><span class="pro-list-price"><%= p.getProductPrice() %></span><span class="pro-font"> 원</span></div>

	    <div class="pro-wish col-md-1 pro-list-text">
	    <a class="btn btn-success text-white"><i class="far fa-heart"></i></a>
		</div>
		
		<input type = "hidden" class="pronum" value="<%= p.getpNum() %>">
		
    </div><br><hr><br>



<%	} %>
<% } %>  

</div>

 


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
				var num = $(this).parent().children('input').val();
				location.href="<%= request.getContextPath() %>/productDetail.no?no=" + num;
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