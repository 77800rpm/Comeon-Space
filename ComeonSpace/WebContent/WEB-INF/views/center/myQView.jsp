<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, center.myQ.model.vo.MyQuestion"%>
<%
	ArrayList<MyQuestion> list = (ArrayList)request.getAttribute("list");
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>내 질문 보기</title>
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
	.center-align{float:left;}
	#center-qTitle{
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
		border-radius: 20px;
	}
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
     .main-div{border-bottom: 2px solid green;}
     .section-div{padding-top: 1rem; padding-bottom: 1rem;}
    #tableTop{background: #E3F8E7;} 
	
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
       		<h2>내 질문</h2>
       		<br>
       		<span>여러분의 불편함을 해결하기 위해 최선을 다하겠습니다.</span>
       </div>
       <div class="center-content center-align center-vertical">
       		<table class="table" id="myQuestionList">
       			<tr id="tableTop">
       				<th>번호</th>
       				<th>문의유형</th>
       				<th>제목</th>
       				<th>작성날짜</th>
       				<th>답변상태</th>
       			</tr>
       			<%if(!list.isEmpty()){ %>
       				<%for(MyQuestion my : list){ %>
       					<tr>
       						<td><%= my.getMyQNum() %></td>
       						<td><%= my.getMyQCategory() %></td>
       						<td><%= my.getMyQTitle() %></td>
       						<td><%= my.getMyQCreate() %></td>
       						<td>
       							<%if(my.getMyQAnswer() == null){ %>
       								답변대기
       							<%} else {%>
       								답변완료
       							<%} %>
       						</td>
       					</tr>
       				<%} %>
       			<%} else { %>
       				<tr>
       					<td colspan="5">등록된 내 질문이 없습니다.</td>
       				</tr>
       			<%} %>
       		</table>
       		<ul class="pagination">
	             <li class="page-item">
	               <a class="page-link" href="#">&laquo;</a>
	             </li>
	             <li class="page-item">
	               <a class="page-link" href="#">1</a>
	             </li>
	             <li class="page-item">
	               <a class="page-link" href="#">2</a>
	             </li>
	             <li class="page-item">
	               <a class="page-link" href="#">3</a>
	             </li>
	             <li class="page-item">
	               <a class="page-link" href="#">4</a>
	             </li>
	             <li class="page-item">
	               <a class="page-link" href="#">5</a>
	             </li>
	             <li class="page-item">
	               <a class="page-link" href="#">&raquo;</a>
	             </li>             
	         </ul>
       </div>
       
    </section>
	<script>
		$(function(){
			$("#myQuestionList td").mouseenter(function(){
				$(this).parent().css({"background":"#E9EEF2", "cursor":"pointer"})
			}).mouseout(function(){
				$(this).parent().css("background", "none");
			}).click(function(){
				var bId = $(this).parent().children().eq(0).text();
				location.href="<%= request.getContextPath()%>/myQDetail.ce?bId=" + bId;
			})
		})
		
	</script>
    
</body>

</html>