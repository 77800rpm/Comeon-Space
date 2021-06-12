<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>고객센터 메인페이지</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="assets/img/apple-icon.png">
    <link rel="shortcut icon" type="image/x-icon" href="../assets/img/favicon.ico">

    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/templatemo.css">
    <link rel="stylesheet" href="assets/css/custom.css">

    <!-- Load fonts style after rendering the layout styles -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
    <link rel="stylesheet" href="assets/css/fontawesome.min.css">
    
    <script src="assets/js/jquery-1.11.0.min.js"></script>
    <script src="assets/js/jquery-migrate-1.2.1.min.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/templatemo.js"></script>
    <script src="assets/js/custom.js"></script>
<!--
    
TemplateMo 559 Zay Shop

https://templatemo.com/tm-559-zay-shop

-->
</head>
<style>
	*{font-family: 'Jua', sans-serif;}
	.py-5{
		padding-top: 0px;
		padding-bottom: 0px;
	}
	.center-list{
		width: 200px; height: 30px; border-bottom: 1px solid black;
		text-align: left; float: left;
		margin-left: 20px;
		cursor: pointer;
		margin-bottom: 8px;
	}
	.center-profile{
		display: inline-block; width:200px; height: 150px;
		border: 1px solid black;	
		margin-left: 20%;	
	}
	.center-FAQ{
		border: 1px solid black;
		width: 100%;
		height: auto;
		text-align: left;
		padding-left: 10%;
		padding-right: 10%;
		margin-bottom: 25px;
	}
	.center-notice{
		border: 1px solid black;
		width: 100%;
		height: auto;
		text-align: left;
		padding-left: 10%;
		padding-right: 10%;
	}
	.main-div{border-bottom: 2px solid #0F6756;}
	.table-hover{cursor: pointer;}
	.center-board-title{font-decoration: underline; font-size: 30px; 
	border-bottom: 2px solid green; margin-bottom: 30px; }
	.profile-div{margin-bottom: 20px;}
	
	
</style>

<body>
    <section class="py-5">
        <div class="container">
            <div class="row">
                <div class="text-black main-div">
                    <h1 style="text-align: center">고객센터</h1>
                </div>
            </div>
        </div>
    </section>
    <!-- Close Banner -->

    <!-- Start Section -->
    <section class="container">
        <div class="row pb-3 profile-div">
        	<div class="center-profile">프로필</div>
            <div class="col-lg-6">
                <h2 class="h21">홍길동님, 무엇을 도와드릴까요?</h2>
              	<div class="center-list"><a>문의하기</a></div>
              	<div class="center-list"><a>내 질문</a></div>
              	<div class="center-list" id="noList"><a>공지사항</a></div>
              	<div class="center-list"><a>회원탈퇴</a></div>
              	<div class="center-list"><a>자주 묻는 질문</a></div>
            </div>
        </div>
        <div class="center-FAQ">
        	<span class="center-board-title">FAQ 게시판</span><br>
        	<table class="table table-hover">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성날짜</th>
					<th>조회수</th>
				</tr>
				<tr>
					<td>1</td>
					<td>비밀번호 어떻게 바꾸나요?</td>
					<td>Adm</td>
					<td>5.27</td>
					<td>2</td>
				</tr>
			</table>
		</div>
		<div class="center-notice table-hover">
			<span class="center-board-title">Notice 게시판</span><br>
			<table class="table">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성날짜</th>
					<th>조회수</th>
				</tr>
				<tr>
					<td>1</td>
					<td>5.27 코로나 상황</td>
					<td>Adm</td>
					<td>5.27</td>
					<td>2</td>
				</tr>
			</table>
		</div>
		<script>
	    	$(function(){
	    		$("#noList").on("click",function(){
	    			location.href="<%= request.getContextPath() %>/noList.no";
	    		});
	    	})
	    </script>
	</section>
</body>

</html>