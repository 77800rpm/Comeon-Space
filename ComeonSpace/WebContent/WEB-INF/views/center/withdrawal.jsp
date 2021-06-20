<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>회원탈퇴</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="assets/img/apple-icon.png">
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/templatemo.css">
    <link rel="stylesheet" href="assets/css/custom.css">

    <!-- Load fonts style after rendering the layout styles -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
    <link rel="stylesheet" href="assets/css/fontawesome.min.css">
    
     <!-- Start Script -->
    <script src="assets/js/jquery-1.11.0.min.js"></script>
    <script src="assets/js/jquery-migrate-1.2.1.min.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/templatemo.js"></script>
    <script src="assets/js/custom.js"></script>
    <!-- End Script -->
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
	.main-div{border-bottom: 2px solid green;}
	.withdraw-div{text-align: center;}	
	.withdraw-content{
		text-align: center;
		border: 1px solid black;
		margin-left: 25%;
		margin-right: 25%;
		padding-top: 20px;
		vertical-align: middle;
	}
	.withdraw-checkbox{margin-bottom: 7px; text-align: center;}
 	.withdraw-notice{
 		color: red;
 		font-weight: bold !important;
 		font-size: 25px !important;
 		text-align: center;
 	} 
 	.withdraw-btn{text-align: center;}
 	.withdraw-okBtn{margin-right: 20px;}
	
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
	        <div class="row pb-3 withdraw-div">
	           	<h1>회원 탈퇴전에 꼭 확인하세요</h1>
	        </div>
	        <br>
	        <div class="withdraw-content">
	        	<P>회원 탈퇴 시 회원님의 프로필, 사용 내역, 프로필 등<br>
	        	기타 내역들이 전부 삭제되며 복구할 수 없습니다.</P>			
			</div>
			<br><br>
			<div class="withdraw-checkbox">
				<input type="checkbox" name="withdraw_Y" required>&nbsp;
				위의 내용을 숙지 했으며 회원 탈퇴에 동의합니다.
			</div>
			<div class="withdraw-notice">
				회원 동의는 필수 입니다.
			</div>
			<br><br>
			<div class="withdraw-btn">
				<input type="button" class="withdraw-okBtn" id="deleteBtn" value="확인">
				<input type="button" onclick="location.href='<%= request.getContextPath() %>'" value="취소">
			</div>
	<script>
		$("#deleteBtn").on("click",function(){
			if(confirm("정말 탈퇴하시겠습니까?")){
				location.href="<%=request.getContextPath()%>/delete.me";
			}
		});
	</script>
	</section>
	
  
   
</body>

</html>