<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, member.model.vo.Member, notice.model.vo.Notice, img.model.vo.Img"%>
<%
	Member profile = (Member)request.getAttribute("profile");
	ArrayList<Notice> noList = (ArrayList)request.getAttribute("noList");
	Img pImg = (Img)request.getAttribute("profileImg");
%>
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
	a { text-decoration:none; color: balck;} 
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
	.center-list:hover{background: #E9EEF2;}
	
	.center-profile{
		display: inline-block; width:200px; height: 150px;
		margin-left: 20%;	
	}
	.center-profile img{
		position: absoute; 
		width:100%;
		height:100%;
		top:0; left:0;
	}
	.center-FAQ{
		width: 100%;
		height: auto;
		text-align: left;
		padding-left: 10%;
		padding-right: 10%;
		margin-bottom: 25px;
	}
	.center-notice{
		width: 100%;
		height: auto;
		text-align: left;
		padding-left: 10%;
		padding-right: 10%;
		margin-bottom: 100px;
	}
	.main-div{border-bottom: 2px solid #0F6756;}
	.table-hover{cursor: pointer;}
	.center-board-title{font-decoration: underline; font-size: 30px; 
	border-bottom: 2px solid green; margin-bottom: 30px; }
	.profile-div{margin-bottom: 20px;}
	#noticeTable:hover{cursor: pointer; background: #E9EEF2;}
	#errorNotice{text-align: center; }
	
</style>
<head>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
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
        <%if(loginUser != null){ %>
	        <div class="row pb-3 profile-div">
	        	<%if(pImg != null){ %>
	        		<div class="center-profile">
	        			<img src="<%= request.getContextPath()%>/img_upload/<%= pImg.getImgChange()%>" width="200px" height="150px">
	        		</div>
	        	<%} else { %>
	        		<div class="center-profile">
	        			<img src="<%= request.getContextPath()%>/resources/image/defaultProfile.png">
	        		</div>
	        	<%} %>
	            <div class="col-lg-6">
	                <h2 class="h21"><%= loginUser.getUserName() %>님, 무엇을 도와드릴까요?</h2>
	              	<div class="center-list" id="myQInsert"><a>문의하기</a></div>
	              	<div class="center-list" id="myQList"><a>내 질문</a></div>
	              	<div class="center-list" id="noList"><a>공지사항</a></div>
	              	<div class="center-list" id="withdrawal">회원탈퇴</div>
	              	<div class="center-list"><a>자주 묻는 질문</a></div>
	            </div>
	        </div>
        <%} %>
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
		<br>
		<hr>
		<br>
		<div class="center-notice">
			<span class="center-board-title">Notice 게시판</span><br><br>
			<table class="table table-striped" id="listArea">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성날짜</th>
				</tr>
				<%if(!noList.isEmpty()){ %>
					<%for(Notice n : noList) {%>
						<tr id="noticeTable">
							<td><%= n.getnNum() %></td>
							<td><%= n.getnTitle() %></td>
							<td><%= n.getnWriter() %></td>
							<td><%= n.getDate() %></td>
						</tr>
					<%} %>
				<%} else {%>
					<tr>
						<td colspan="4" id="errorNotice">등록된 공지사항이 없습니다.</td>
					</tr>
				<%} %>
			</table>
		</div>
		<script>
	    	$(function(){
	    		$("#noList").on("click",function(){
	    			location.href="<%= request.getContextPath() %>/noList.no";
	    		});
	    	})
	    	$(function(){
	    		$("#withdrawal").on("click",function(){
	    			location.href="<%= request.getContextPath() %>/delteForm.ce";
	    		});
	    	})
	    	$(function(){
	    		$("#myQInsert").on("click",function(){
	    			location.href="<%= request.getContextPath() %>/myQInsertForm.ce";
	    		});
	    	})
	    	$(function(){
	    		$("#myQList").on("click",function(){
	    			location.href="<%= request.getContextPath() %>/myQView.ce";
	    		});
	    	})
	    	
	    	$(function(){
	    		$("#listArea td").mouseenter(function(){
					$(this).parent().css({"background": "#E0E5EA" , "cursor" : "pointer"});
				}).mouseout(function(){
					$(this).parent().css({"background":"none"});
				}).click(function(){
					var num = $(this).parent().children().eq(0).text();
					location.href="<%= request.getContextPath() %>/detail.no?no=" + num;
				})
				
				$("#errorNotice").unbind();
	    	})
	    </script>
	</section>
	<%@ include file="../common/footer.jsp" %>
</body>

</html>