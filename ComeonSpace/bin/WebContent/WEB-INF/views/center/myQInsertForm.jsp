<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>문의 작성 페이지</title>
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
	*{font-family: 'Jua', sans-serif !important;}
	.center-sideList{display: inline-block; width: 15%;}
	.center-sideList>ul{list-style-type:none;}
	.sideList-top{
		font-size: 35px;
		margin-top: 20px;
		margin-bottom: 10px;
		display:inline-block;
	}
	.sideList{
		width: 100px;
		border-bottom: 1px solid black;
		display: inline-block;		
		margin-bottom: 12px;
		cursor: pointer;
	}
	.center-content{
		display: inline-block;
		margin-left: 40px;
		margin-top: 20px;
		margin-bottom: 20px;
		
		background: #EFF4F8;
	}
	.question-table th{
		padding: 10px;
	}
	#table-button{
		text-align: center;
		padding-top: 60px;
	}
	#submit-button{
		margin-right: 25px;
	}
	.center-align{float:left;}
	#center-qTitle{
		margin-top: 20px;
		display: inline-block;
	
	}
	.center-vertical{
		vertical-align: middle;
		width: 75%;
		margin-left: 40px;
		
	}
	.question-button{
		box-shadow: 1px 1px 1px black;
	}
	.main-div{border-bottom: 2px solid green;}
     .section-div{padding-top: 1rem; padding-bottom: 1rem;}
	#test{clear:both;}
</style>

<body>
	<%@ include file="../common/header.jsp" %>
    <section class="section-div">
        <div class="container">
            <div class="row">
                <div class="text-black main-div">
                    <h1 style="text-align: center">고객 센터</h1>
                </div>
            </div>
        </div>
    </section>
    <!-- Close Banner -->

    <!-- Start Section -->
    <section class="container center">
<!--        <div class="center-sideList center-align"> -->
<!--        		<span class="sideList-top">고객센터</span><br> -->
<!--        		<span class="sideList"><a>문의하기</a></span><br> -->
<!--        		<span class="sideList"><a>공지사항</a></span><br> -->
<!--        		<span class="sideList"><a>FAQ</a></span><br> -->
<!--        		<span class="sideList"><a>내 질문</a></span><br> -->
<!--        		<span class="sideList"><a>회원탈퇴</a></span> -->
<!--        </div> -->
		<%@ include file="centerMenubar.jsp" %>
       <div class="center-align center-vertical" id="center-qTitle">
       		<h2>문의하기</h2>
       		<h4>Comeon Space의 중심은 여러분 입니다. </h4>
       		<span>불편하신 사항이나 바라는 점을 알려주세요.</span><br>
       		<span>고객의 목소리에 귀 기울이는 Comeon Space가 되겠습니다.</span>
       </div>
       <div class="center-content center-align center-vertical">
       		<form action="<%=request.getContextPath()%>/insertMyQ.my" method="post" encType="multipart/form-data">
       			<br>
	       		<table class="question-table">
	       			<tr>
	       				<th>제목</th>
	       				<td><input type="text" size='30' name="myQtitle" placeholder="제목을 입력해주세요" required></td>
	       			</tr>
	       			<tr>
	       				<th>문의유형</th>
	       				<td>
	       					<select name="myQCategory" required>
		       					<option>문의 유형</option>
		       					<option value="환불">환불</option>
		       					<option value="공간 등록">공간 등록</option>
		       					<option value="예약">예약</option>
		       					<option value="기타">기타</option>
	       					</select>
	       				</td>
	       			</tr>
	       			<tr>
	       				<th>내용</th>
	       				<td>
	       					<textarea cols="60" name="myQContent" rows="15" placeholder="내용을 입력해주세요" required></textarea>
	       				</td>
	       			</tr>
	       			<tr>
	       				<th>사진 첨부</th>
	       				<td><input type="file" name="myQImg" value="파일 첨부"></td>
	       			</tr>
	       			<tr>
	       				<td></td>
	       				<td id="table-button">
	       					<input type="submit" class="btn btn-success text-white btn-block rounded-2 question-button" id="submit-button" value="작성하기">
							<a href="<%= request.getContextPath() %>/centerView.ce"><input type="button" class="btn btn-success text-white btn-block rounded-2 question-button" value="취소"></a>	       				
	       				</td>
	       			</tr>
	       		</table>
	       		
	       	</form>  
       </div>
       <div id="test"></div>
       <br><br>
       <%@ include file="../common/footer.jsp" %>
    </section>
    <!-- End Section -->

   

   
</body>

</html>