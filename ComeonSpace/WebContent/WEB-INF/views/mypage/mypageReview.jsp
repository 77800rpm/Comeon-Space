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
	#centerDiv{display:inline-block; width:70%;}
	#titleH3{text-align: center;}
	.contentRowDiv{padding-left: 20px;}
	.tableTitle{height: 70px;}
	.tableStar{height: 50px;}
	.tableContent{height: 200px;}
	.tableBlank{height: 40px;}
	table tr td{border:1px solid black;}
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
        	<div class="container" id="centerDiv">
        		<hr><br>
        		<h3 id="titleH3">나의 리뷰 관리</h3>
        		<br><hr><br>
				<div class="row contentRowDiv">
					<table>
						<tr>
							<td class="tableTitle" colspan="3">제목이 들어갈곳</td>
							<td rowspan="3">사진이 들어갈 곳</td>
						</tr>
						<tr>
							<td class="tableStar">별점 들어갈 곳</td>
							<td>날짜 들어갈 곳</td>
							<td>작성 됨</td>
						</tr>
						<tr>
							<td colspan="3" class="tableContent">내용이 들어갈 곳</td>
						</tr>
						<tr class="tableBlank"></tr>
					</table>
				</div>
	    	</div>
		</div>
	</div>
    <br><br><br>
</body>
<footer>
	<%@ include file="../common/footer.jsp" %>
</footer>

</html>