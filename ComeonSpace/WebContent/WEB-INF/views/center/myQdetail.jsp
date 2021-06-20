<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="center.myQ.model.vo.MyQuestion, img.model.vo.Img"%>
<%
	MyQuestion my = (MyQuestion)request.getAttribute("my");
	Img img = (Img)request.getAttribute("img");
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>FAQ 내부</title>
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
		margin-left: 60px;
		margin-top: 20px;
		margin-bottom: 20px;
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
		margin-left: 60px;
		
	}
	.question-button{
		box-shadow: 1px 1px 1px black;
	}
	.main-div{border-bottom: 2px solid green;}
	.section-div{padding-top: 1rem; padding-bottom: 1rem;}
	#FAQ-content{white-space: pre-line;}
	
	
</style>

<body>
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
       <div class="center-sideList center-align">
       		<span class="sideList-top">고객센터</span><br>
       		<span class="sideList"><a>문의하기</a></span><br>
       		<span class="sideList"><a>공지사항</a></span><br>
       		<span class="sideList"><a>FAQ</a></span><br>
       		<span class="sideList"><a>내 질문</a></span><br>
       		<span class="sideList"><a>회원탈퇴</a></span>
       </div>
       <div class="center-align center-vertical" id="center-qTitle">
       		<h2>내 질문 </h2>
       </div>
       <div class="center-content center-align center-vertical">
       		<form>
       			<table class="table">
       				<tr class="table-success">
       					<td>번호</td>
       					<td>문의유형</td>
       					<td>제목</td>
       					<td>작성 날짜</td>
       					<td>답변 날짜</td>
       				</tr>
       				<tr>
       					<td><%= my.getMyQNum()%></td>
       					<td><%= my.getMyQCategory()%></td>
       					<td><%= my.getMyQTitle()%></td>
       					<td><%= my.getMyQCreate()%></td>
<!--        					답변날짜 정하고 수정 -->
       					<td><%= my.getMyQCreate()%></td>
       				</tr>
       				<tr>
       					<td colspan="5" id="FAQ-content">
       					<p><%= my.getMyQContent() %>
       						<%if(img != null){ %>
       							<img src="<%=request.getContextPath()%>/img_upload/<%=img.getImgChange()%>" width="300px" height="200px">
       						<%} %>
       					</p>
       					</td>
       				</tr>
       				<tr>
       					<td colspan="5" style="text-align: center;">
       					<input type="button" value="목록으로">
       					</td>
       				</tr>
       			</table>
       			
	       	</form>  
       </div>
    </section>
    <!-- End Section -->

   

   
</body>

</html>