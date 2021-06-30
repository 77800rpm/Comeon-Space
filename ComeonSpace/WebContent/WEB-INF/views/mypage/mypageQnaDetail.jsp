<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import=" qna.model.vo.Qna"%>
<%
	Qna q = (Qna)request.getAttribute("q");
%>
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
	.h-inline{display:inline-block;}
	.mypage-profile{display:inline-block;}
	#noQnaTd{text-align: center;}
	
</style>
<header>
    <%@ include file="../common/header.jsp" %>
</header>
<body>
    <!-- Start Content -->
    <div class="container py-5">
        <div class="row">
			<!-- 메뉴바 시작 -->
            <%@include file="menubar.jsp"%>
			<!-- 메뉴바 끝 -->
            <div class="col-lg-9">
                <div class="myP-main h2">
                    	마이페이지
                </div>
                <br>
                <form action="<%=request.getContextPath()%>/answerQna.my">
                <div class="row">
					<div id="mypageProfileImg">
						<table class="table" id="tableArea">
							<tr>
								<th width="10%;">번호</th>
								<th width="15%;">작성자</th>
								<th width="20%;">공간명</th>
								<th width="15%;">작성날짜</th>
							</tr>
							<%if(loginUser.getUserDiv().equals("host")){ %>
								<tr>
									<td><%=q.getQnaNum() %><input type="hidden" name="qnaNum" value="<%=q.getQnaNum() %>"></td>
									<td><%=q.getUserNick() %></td>
									<td><%=q.getpName() %></td>
									<td><%=q.getQnaDate() %></td>
								</tr>
								<tr>
									<th>문의내용 </th>
									<td colspan="4"><%=q.getQnaContent() %></td>
								</tr>
								<tr>
									<th rowspan="4" style="vertical-align:center">답변내용</th>
									<td colspan="3"><textarea rows="10" cols="95" name="answerContent" id="qnaContent" style="resize:none;"><%if(q.getQnaAnswer() == null){%><%} else {%><%=q.getQnaAnswer() %><%} %></textarea></td>
								</tr>
								<tr>
									<td colspan="4" style="text-align:center"><input type="submit" class="btn btn-outline-success" value="답변하기">&nbsp;&nbsp;&nbsp;<input type="button" class="btn btn-outline-success" id="goMainBtn" value="목록으로"></td>
								</tr>
							<%} else {%>
								<tr>
									<td><%=q.getQnaNum() %><input type="hidden" name="qnaNum" value="<%=q.getQnaNum() %>"></td>
									<td><%=q.getUserNick() %></td>
									<td><%=q.getpName() %></td>
									<td><%=q.getQnaDate() %></td>
								</tr>
								<tr>
									<th>문의내용 </th>
									<td colspan="4"><%=q.getQnaContent() %></td>
								</tr>
								<tr>
									<th rowspan="4" style="vertical-align:center">답변내용</th>
									<td colspan="3"><textarea rows="10" cols="95" name="answerContent" id="qnaContent" style="resize:none;" readonly><%if(q.getQnaAnswer() == null){%><%} else {%><%=q.getQnaAnswer() %><%} %></textarea></td>
								</tr>
								<tr>
									<td colspan="4" style="text-align:center"><input type="button" class="btn btn-outline-success" id="goMainBtn" value="목록으로"></td>
								</tr>
							
							<%} %>
						</table>
					</div>
					<div>
						<br>
						<br>
						<hr>
						<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
					</div>
                </div>
                </form>
            </div>

        </div>
    </div>
    <script>
    	$("#goMainBtn").on("click",function(){
    		location.href="<%=request.getContextPath()%>/qnaList.my";
    	})
    </script>
</body>
<footer>
	<%@ include file="../common/footer.jsp" %>
</footer>

</html>