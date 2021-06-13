<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member"%>
<% Member loginUser = (Member)session.getAttribute("loginUser"); %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>로그인</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="assets/img/apple-icon.png">
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

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
	
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
	
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Courgette&display=swap" rel="stylesheet">

	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="assets/js/jquery-1.11.0.min.js"></script>
    <script src="assets/js/jquery-migrate-1.2.1.min.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/templatemo.js"></script>
    <script src="assets/js/custom.js"></script>
	
	
</head>
<style>

	*{margin: 0; padding: 0; box-sizing: border-box;}
	
	body {
		font-family: 'Noto Sans KR', sans-serif !important;
		display: flex;
		justify-content: center;
		align-items: center;
		height: 100vh;
		background: url("<%= request.getContextPath() %>/resources/image/loginbackground2.jpg") no-repeat center;
		background-size: cover;
	}
	
	body::before {
		content: "";
		position: absolute; z-index: 1;
		top: 0; right: 0; bottom: 0; left: 0;
		background-color: rgba(0,0,0,.7);
	}
	
	.login-form {position: relative; z-index: 2;}
	
	.login-form h1 {
		font-size: 120px; color: #0f6756;
		text-align: center;
		margin-bottom: 60px;
		font-family: 'Bebas Neue', cursive !important;
		line-height: 80%;
	}
	

	
	.int-area {
		width: 400px; position: relative;
		margin-top: 20px;
		
	}
	
	.int-area:first-child {margin-top: 0;}
	
	.int-area input {
		width: 100%;
		padding: 20px 10px 10px;
		background-color: transparent;
		border: none;
		border-bottom: 1px solid #999;
		font-size: 18px; color: #fff;
		outline: none;
	}
	
	.int-area label {
		position: absolute; left: 10px; top: 15px;
		font-size: 18px; color: #999;
		transition: all .5s ease;
	}

	
	.int-area label.warning {
		color: red !important;
		animaition: warning .3s ease;
		animaition-iteration-count: 3;
	}
	
	.int-area input:focus + label,
	.int-area input:valid + label {
		top: -2px;		
		font-size: 13px; color: #0f6756;
	}
	
	.btn-area {margin-top: 30px;}
	
	#btn-area2, #btn-area-kakao, #btn-area-naver {margin-top: 15px !important;}
	
	.btn-area button {
		width: 100%; height: 50px;
		background: #0f6756;
		color: #fff;
		font-size: 20px;
		border: none;
		border-radius: 20px;
	}
	
	#btn-area2 button {
		background: gray !important;
	}
	
	#btn-area-kakao button	{

	 	background: white !important;
	 	color: black !important;
	}
	
	#btn-area-naver button {

		background: white !important;
		color: black !important;
	}
	
	.kakao-font {
		color: #FEE500 !important;
	}
	
	.naver-font {
		color: #2DB400;
	}
	

	

</style>
<body>

 
 	<section class="login-form">
 
 		<h1>COMEON<br>SPACE</h1>
 		<form id="loginForm" action="<%= request.getContextPath() %>/login.me" method="post">
 			<div class="int-area">
 				<input type="text" name="userEmail" id="userEmail" autocomplete="off" required>
 				<label for="userEmail">아이디(이메일)</label>
 			</div>
 			<div class="int-area">
 				<input type="password" name="userPwd" id="userPwd" autocomplete="off" required>
 				<label for="userPwd">비밀번호</label>
 			</div>
 			<div class="btn-area" id="btn-area1">
 				<button id="loginBtn" type="submit">로그인</button>
 			</div>
 		</form>	
 		
 			 <div class="btn-area" id="btn-area2">
 				<button id="joinBtn" type="button">회원가입</button>
 			</div>
<!--	 			
 			<br>
 			<br>
 			<br>
 			<br>
 	

 			<div class="btn-area" id="btn-area-kakao">
 				<button id="loginbtn" type="submit"><span class="kakao-font">카카오</span> 로그인</button>
 			</div>
 			<div class="btn-area" id="btn-area-naver">
 				<button id="joinbtn" type="submit"><span class="naver-font">네이버</span> 로그인</button>
 			</div>
-->			




 	</section>
 
 	<script>
 		let userEmail = $('#userEmail');
 		let userPwd = $('#userPwd');
 		let loginBtn = $('#loginBtn');
 		
 		$(loginBtn).on('click', function() {
 			if($(id).val() == "") {
 				$(id).next('label').addClass('warning');
 				setTimeout(function() {
 					$('label').removeClass('warning');
 				},1500);
 			}
 			else if($(userpwd).val() == "") {
 				$(userPwd).next('label').addClass('warning');
 				setTimeout(function() {
 					$('label').removeClass('warning');
 				},1500);
 			}
 		});
 		
		$('#joinBtn').on('click', function(){
			location.href='<%= request.getContextPath() %>/signUp.me';	
		});
 		
 	</script>
 

 

</body>

</html>