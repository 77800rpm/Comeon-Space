<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, faq.model.vo.Faq"%>
<% ArrayList<Faq> fList = (ArrayList)request.getAttribute("fList"); %>
<!DOCTYPE html>
<html lang="en">
<meta charset="UTF-8">
<head>
    <title>공지사항 보기</title>
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
    
    <script src="assets/js/jquery-1.11.0.min.js"></script>
    <script src="assets/js/jquery-migrate-1.2.1.min.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/templatemo.js"></script>
    <script src="assets/js/custom.js"></script>

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
	.side-list{
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
	.center-align{float:left;}
	#center-nTitle{
		margin-top: 20px;
		display: inline-block;
	
	}
	.center-vertical{
		vertical-align: middle;
		width: 71%;
		margin-left: 60px;
		
	}
	.notice-button{
		display: inline-block;
		text-align: right;
	}
	.button-style{
		border-radius: 5px;
		background: green;
		color: white;
		border-color: white;
		padding: 5px;
	}
	.table-hover{cursor:pointer; width: 100%;}
	 .pagination {
      width: 90%;
      list-style-type: none;
      display: block;
      text-align: center;
      margin-top: 50px;      
      margin-left: 55px;  
    }
    
    .page-item {
      display: inline-block;
       padding: 0.2rem;
             
    }    
    .main-div{border-bottom: 2px solid green;}
    .page-link {
      text-decoration: none; 
      color: #20921B; 
      font-weight: bold;
      border: 1px solid lightgrey;
      padding: 0.5rem 0.75rem;
      margin-left: -1px;
      line-height: 1.25;
    }
    
     .page-link:hover {
        color: lightgrey; 
        text-decoration: underline;
     }
     .section-div{padding-top: 1rem; padding-bottom: 1rem;} 
	#errorNotice{text-align: center; }
	.body-div{margin-top: 50px;}
	.center-body-div{margin-bottom: 100px;}
</style>

<body>
	<%@ include file="../common/header.jsp" %>
    <section class="section-div body-div">
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
    <section class="container center center-body-div">
       <form>
<!-- 	       <div class="center-sideList center-align"> -->
<!-- 	       		<span class="sideList-top">고객센터</span><br> -->
<!-- 	       		<span class="side-list"><a>문의하기</a></span><br> -->
<!-- 	       		<span class="side-list" id="noList"><a>공지사항</a></span><br> -->
<!-- 	       		<span class="side-list"><a>FAQ</a></span><br> -->
<!-- 	       		<span class="side-list"><a>내 질문</a></span><br> -->
<!-- 	       		<span class="side-list"><a>회원탈퇴</a></span> -->
<!-- 	       </div> -->
			<%@ include file="centerMenubar.jsp" %>
	       <div class="center-align center-vertical" id="center-nTitle">
	       		<h2>자주 묻는 질문</h2>
	       		<br>
	       		<span>여러분이 자주 겪는 어려움을 해결해 드리겠습니다.</span>
	       </div>
	       <div class="center-content center-align center-vertical">
	       		<table class="table table-striped" id="listArea">
	       			<tr>
	       				<th>번호</th>
	       				<th>제목</th>
	       				<th>작성자</th>
	       				<th>작성날짜</th>
	       				<th>조회수</th>
	       			</tr>
	       			<%if(fList.isEmpty()){ %>
						<tr>
							<td colspan="5" id="errorNotice">존재하는 FAQ가 없습니다.</td>
						</tr>
						<%} else{ %>
						<%		for(Faq f : fList){ %>
									<tr>
										<td><%= f.getBoardFaqNum()%></td>
										<td><%= f.getBoardFaqTitle()%></td>
										<td>Comeon Space</td>
										<td><%= f.getCreateDate()%></td>
										<td><%= f.getBoardCount()%></td>
									</tr>
						<%		} %>
						<%} %>
	       		</table>
	       </div>
	       <div class="center-sideList"></div>
	       
	       <script>
	       		$(function(){
	       			
	       			$("#listArea td").mouseenter(function(){
						$(this).parent().css({"background": "#E0E5EA" , "cursor" : "pointer"});
					}).mouseout(function(){
						$(this).parent().css({"background":"none"});
					}).click(function(){
						var num = $(this).parent().children().eq(0).text();
						location.href="<%= request.getContextPath() %>/detail.no?no=" + num;
					})
					
					$(document).ready(function(){
						$("#errorNotice").unbind();
					})
	       		})
	       		
	       </script>
		</form>	
	       
    </section>
    <%@ include file="../common/footer.jsp" %>
    
</body>

</html>