<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>Zay Shop - Product Listing Page</title>
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
    
    <script src="assets/js/jquery-1.11.0.min.js"></script>
    <script src="assets/js/jquery-migrate-1.2.1.min.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/templatemo.js"></script>
    <script src="assets/js/custom.js"></script>
</head>
<style>
	.myP-main{
		border-bottom: 3px solid green;
		text-align: center;
		padding-bottom: 10px; 
	}
	.list-text{
		font-size: 13px !important;
	}
	.title{margin-bottom: 5px;}
	.myP-pag{margin-left: 30%;}
	.myP-pag1{margin-left: 30%;}
	.review-img{text-align: center;}
	.review-content{
		padding-top: 10px;
		padding-bottom: 10px;
		border: 1px solid black;
		margin-top: 5px;
	}
	.review-btn{
		border-radius: 5px;
		background-color: rgb(15, 103, 86);
		color: white;
		font-size: 13px !important;
	}
	.content-div{margin-bottom: 10px;}
	
	
</style>
<header>
    <%@ include file="../common/header.jsp" %>
</header>
<body>
    <!-- Start Content -->
    <div class="container py-5">
        <div class="row">
			<!-- 메뉴바 시작 -->
            <%@include file="menubar.jsp" %>
			<!-- 메뉴바 끝 -->
            <div class="col-lg-9">
                <div class="myP-main h2">
                    	마이페이지
                </div>
                
            <div class="col-lg-9">
                <div class="myP-main h2">
                    	작성된 후기
                </div>
                <div class="review-img" style="border: 1px solid black;">
                	<img src="../resources/image/logo.png">
                </div>
                <br>
                <div class="content-div">
                	<div>별점 평가</div>
                	<div class="review-content">
                		생각보다 시설이 좋아서 리뷰 남겨요
                	</div>
                	<input type="button" class="review-btn" value="답글달기">
                </div>
                <div class="content-div">
                	<div>별점 평가</div>
                	<div class="review-content">
                		생각보다 시설이 좋아서 리뷰 남겨요
                	</div>
                	<input type="button" class="review-btn" value="답글달기">
                </div>
                <div class="content-div">
                	<div>별점 평가</div>
                	<div class="review-content">
                		생각보다 시설이 좋아서 리뷰 남겨요
                	</div>
                	<input type="button" class="review-btn" value="답글달기">
                </div>
                <div class="content-div">
                	<div>별점 평가</div>
                	<div class="review-content">
                		생각보다 시설이 좋아서 리뷰 남겨요
                	</div>
                	<input type="button" class="review-btn" value="답글달기">
                </div>
                
            </div>

        </div>
    </div>

    
    <!-- Start Script -->
    <script src="../assets/js/jquery-1.11.0.min.js"></script>
    <script src="../assets/js/jquery-migrate-1.2.1.min.js"></script>
    <script src="../assets/js/bootstrap.bundle.min.js"></script>
    <script src="../assets/js/templatemo.js"></script>
    <script src="../assets/js/custom.js"></script>
    <!-- End Script -->
</body>

</html>