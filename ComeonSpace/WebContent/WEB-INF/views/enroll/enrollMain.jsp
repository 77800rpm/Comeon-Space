<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member, java.util.ArrayList, notice.model.vo.Notice"%>
<%
	ArrayList<Notice> list = (ArrayList)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Come on Space 공간등록</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="assets/css/bootstrap.min.css"> <!-- 배너 레이아웃, 폰트 // 가운데 정렬 -->
<link rel="stylesheet" href="assets/css/templatemo.css"> <!-- 배너 배경 색상과 공간홍보 터치감 -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
<link rel="stylesheet" href="assets/css/fontawesome.min.css"> <!-- 공간등록 홍보 아이콘 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style>
	#enrollButton{background: orange; color: white; border: none; padding: 12px 30px; border-radius:40px; font-weight:bold;}
	#button_moreNotice{border: 1px solid black; padding: 12px 30px; font-size: 15px;
					width: 300px; margin-left:auto; margin-right:auto;}
 	button:focus{outline:0px;}
	
	#banner_image{width: 400px;}
	/* 배너 색상 */
	.bg-success { background-color:rgb(15, 103, 86) !important;}
	.bg-light { background-color: #F5F5F5 !important;}
	
	.table>tbody>tr>td:hover{--bs-table-accent-bg:var(--bs-table-striped-bg);}
</style>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	<!-- 배너 -->
	<section class="bg-success py-5">
        <div class="container">
            <div class="row align-items-center py-5">
                <div class="col-md-7 text-white">
                    <h1>Come on Space</h1>
                    <h1><strong>공간 등록하기</strong></h1>
                    <p>
                    	비어있는 시간이 더 많은 내 공간,<br>
                    	간편하게 다른 사람과 공유해보세요<br>
                    </p>
                    <small>모임 | 촬영 | 스터디 | 연습실 | 행사장 | 공유 오피스 등 다양한 공간 등록 가능</small><br><br>
<!-- 	                <button id="enrollButton">공간 등록</button>  -->
					<input type="button" id="enrollButton" value="공간 등록">
					<input type="hidden" id="userDiv" value="<%=loginUser.getUserDiv()%>">					
	                <!-- input으로 하면 나머지 디자인 CSS는 되지만, font 크기나 굵기 변경 X
	                	  정보를 가져가거나 저장하지 않고, 그냥 페이지 이동이니까 괜찮지 않을까?-->               	 
                </div>
                <div class="col-md-4" >
                    <img src="<%=request.getContextPath()%>/resources/image/test1.png" alt="Image"  id="banner_image">
                </div>
            </div>
        </div>
    </section>
	<!-- 배너 끝 -->
	
	<!-- 공간등록 홍보 시작 -->
   <section class="container py-5">
        <div class="row text-center pt-5 pb-3">
            <div class="col-lg-7 m-auto">
                <h2>비어있는 공간으로 수익 창출하기</h2>
                <p>
                   	 비어있는 내 공간, 효율적으로 활용하기
                </p>
            </div>
        </div>
        <br>
        <div class="row">
            <div class="col-md-6 col-lg-3 pb-5">
                <div class="h-100 py-5 services-icon-wap shadow">
                    <div class="h1 text-success text-center">
                    <i class="fa fa-file-invoice fa-lg"></i></div> <!-- fontawesome.min.css에서 fa "____" 여기만 바꾸면 아이콘 변경 가능 / 아이콘은 webfonts랑도 연관 -->
                    <h2 class="h5 mt-4 text-center">간편한 공간등록</h2>
                </div>
            </div>

            <div class="col-md-6 col-lg-3 pb-5">
                <div class="h-100 py-5 services-icon-wap shadow">
                    <div class="h1 text-success text-center">
                    <i class="fas fa-calendar"></i></div>
                    <h2 class="h5 mt-4 text-center">손쉬운 공간관리</h2>
                </div>
            </div>
            <div class="col-md-6 col-lg-3 pb-5">
                <div class="h-100 py-5 services-icon-wap shadow">
                    <div class="h1 text-success text-center">
                    <i class="fa fa-user-lock"></i></div>
                    <h2 class="h5 mt-4 text-center">전문 관리체제</h2>
                </div>
            </div>

            <div class="col-md-6 col-lg-3 pb-5">
                <div class="h-100 py-5 services-icon-wap shadow">
                    <div class="h1 text-success text-center">
                    <i class="fa fa-hand-holding-usd"></i></div>
                    <h2 class="h5 mt-4 text-center">수익 창출</h2>
                </div>
            </div>
        </div>
    </section>
    <!-- 공간등록 홍보 끝 -->
    

    
    <!-- 공지사항 시작 -->
	<section class="bg-light py-5">
    <div class="row text-center pt-5 pb-3">
		<h2>공지사항</h2>
	</div>
	<table class="table" id="enrollNotice" style="width:1030px; margin-left:auto; margin-right:auto;">
		<thead>
			<tr>
				<th width="130px">번호</th>
				<th width="800px">제목</th>
				<th width="130px">작성 날짜</th>
			</tr>
		</thead>
		<tbody>
			<%if(list.isEmpty()){ %>
				<tr>
					<th colspan="3" style="text-align:center;">등록된 공지사항이 없습니다.</th>
				</tr>
			<%} else {%>
				<%for(Notice n : list){ %>
					<tr>
						<td><%= n.getnNum() %></td>
						<td><%= n.getnTitle() %></td>
						<td><%= n.getDate() %></td>
					</tr>
				<%} %>
			<%} %>
		</tbody>
	</table>
	<%if(!list.isEmpty()){ %>
		<div class="row text-center pt-3 pb-3">
			<button id="button_moreNotice">더보기 +</button>
		</div>
	<%} %>
	<br><br><br>
	<%@ include file="../common/footer.jsp" %>
    </section>

    <script>
   		 
   		$("#enrollButton").on("click",function(){
   			var check = $("#userDiv").val();
   			console.log(check);
   			if(check == 'host'){
   				location.href="<%=request.getContextPath()%>/enrollForm.en";
   			} else {
   				alert("호스트만 이용 가능합니다.");
   			}
   		});
   		
   		$("#enrollNotice td").mouseenter(function(){
   			$(this).parent().css({"background": "#E0E5EA" , "cursor" : "pointer"});
   		}).mouseout(function(){
   			$(this).parent().css({"background":"none"});
   		}).click(function(){
   			var num = $(this).parent().children().eq(0).text();
   			location.href="<%=request.getContextPath()%>/detail.no?no=" + num;
   		});
   		
   		$("#button_moreNotice").on("click", function(){
   			location.href="<%=request.getContextPath()%>/noList.no";
   		})
   	</script>
</body>
</html>