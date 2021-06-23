<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList, faq.model.vo.Faq "
	import="faq.model.service.*"%>
<%-- <% ArrayList<Faq> list = (ArrayList<Faq>)request.getAttribute("list"); %> --%>
<%
	Faq f = (Faq)request.getAttribute("Faq");
	FaqService fs = new FaqService();
ArrayList<Faq> list = (ArrayList<Faq>) fs.faqSelect();
%>
<!DOCTYPE html>
<html>
<title>W3.CSS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<body>
	<%@ include file="WEB-INF/views/common/header.jsp"%>

	<div style="font-family: Sans-serif">
		<!-- Sidebar -->

		<div class="w3-sidebar w3-white w3-bar-block"
			style="width: 25%; margin-left: 150px;">
			<br>
			<br>
			<br>
			<br>
			<br>
			<div style="margin-left: 150px">
				<h5 class="w3-bar-item">
					<b>회원관리</b>
				</h5>
				<a href="#" class="w3-bar-item w3-button">전체회원관리</a>
				<h5 class="w3-bar-item">
					<b>시설관리</b>
				</h5>
				<a href="#" class="w3-bar-item w3-button">공간승인/취소</a>
				<h5 class="w3-bar-item">
					<b>게시판 관리</b>
				</h5>
				<a href="<%=request.getContextPath()%>/faqSelect.me"
					class="w3-bar-item w3-button">게시글 관리</a> <a href="#"
					class="w3-bar-item w3-button">공지사항 관리</a>
			</div>
		</div>

		<!-- Page Content -->
		<div style="margin-left: 25%; margin-right: 100px; padding: 10%">

			<div class="w3-bottombar w3-border-teal" style="text-align: center;">
				<h2>관리자 페이지</h2>
			</div>

			<div>

				<h5 style="padding: 1%">
					<b>게시글 상세페이지</b>
				</h5>

					
	<div class="outer">
		<br>
		<h2 align="center">게시판 상세보기</h2>
		<div class="tableArea">
			<form action="<%= request.getContextPath() %>/boardUpdateForm.bo" id="detailForm" method="post">
				<table>
					<tr>
						<th>제목</th>
						<td colspan="3">
						<%= f.getBoardFaqTitle() %><input type="hidden" name="title" value="<%= f.getBoardFaqTitle() %>">
						</td>
					</tr>
					<tr>
						<th>조회수</th>
						<td>
							<%= f.getBoardCount() %>
						</td>
						<th>작성일</th>
						<td>
							<%= f.getCreateDate() %>
							<input type="hidden" name="date" value="<%= f.getCreateDate() %>" >
						</td>
					</tr>
					<tr>
						<th>내용</th>
					</tr>
					<tr>
						<td colspan="6">
							<textarea name="content" cols="60" rows="15" style="resize:none;" readonly><%= f.getBoardFaqContent() %></textarea>
						</td>
					</tr>
				</table>
				
				<div align="center">
					<input type="submit" id="updateBtn" value="수정">
					<input type="button" onclick="deleteBoard();" id="deleteBtn" value="삭제">
					<input type="button" onclick="location.href='<%= request.getContextPath() %>/list.bo'" id="menuBtn" value="메뉴로">
				</div>
			</form>
		</div>
				
				
			</div>
		</div>

	</div>
	<%@ include file="WEB-INF/views/common/footer.jsp"%>
</body>

</html>
