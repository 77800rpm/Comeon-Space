<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="notice.model.vo.Notice"%>
<% Notice no = (Notice)request.getAttribute("no"); %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>공지사항</title>
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
		<%if(loginUser != null){ %>
			<%@ include file="../center/centerMenubar.jsp" %>
		<%} %>
       <div class="center-align center-vertical" id="center-qTitle">
       		<h2>공지사항</h2>
       </div>
       <div class="center-content center-align center-vertical">
       		<form action="updateNoticeForm.no" id="noticeDetailForm">
       			<table class="table">
       				<tr class="table-success">
       					<td>번호</td>
       					<td>제목</td>
       					<td>작성날짜</td>
       				</tr>
       				<tr>
       					<td>
       						<%= no.getnNum() %>
       						<input type="hidden" name="num" value="<%= no.getnNum() %>">
       					</td>
       					<td>
	       					<%= no.getnTitle() %>
	       					<input type="hidden" name="title" value="<%= no.getnTitle() %>">	
	       				</td>
       					<td>
       						<%= no.getDate() %>
       						<input type="hidden" name="date" value="<%= no.getDate() %>">
       					</td>
       				</tr>
       				<tr>
       					<td colspan="3" id="FAQ-content">
       					<p><%=no.getnContent() %><input type="hidden" name="content" value="<%= no.getnContent() %>"></p>
       					</td>
       				</tr>
       				<tr>
       					<td colspan="3" style="text-align: center;">
       					<input type="button" value="목록으로" class="btn btn-outline-success" onclick="location.href='javascript:history.go(-1)'">
       					</td>
       				</tr>
       			</table>
       			
	       	</form>  
       </div>
        <div id="test"></div>
       <%@ include file="../common/footer.jsp" %>
     <script>
     		$(function(){
     			$("#deleteBtn").on("click",function(){
         			if(confirm("정말 삭제하시겠습니까?")){
         				$("#noticeDetailForm").attr('action', '<%= request.getContextPath()%>/deleteNotice.no');
         			}
         		})
     		})
     </script>
    </section>
</body>

</html>