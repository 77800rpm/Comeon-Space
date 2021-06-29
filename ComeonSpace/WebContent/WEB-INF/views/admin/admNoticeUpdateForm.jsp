<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, notice.model.vo.Notice"%>
<%
	ArrayList<Notice> list = (ArrayList<Notice>) request.getAttribute("list");
%>
<%
	Notice no = (Notice) request.getAttribute("no");
%>
<% 
	int num = (Integer)request.getAttribute("num");
	String title = (String)request.getAttribute("title");
	String content = (String)request.getAttribute("content");

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
	

	<%@ include file="../common/header.jsp"%>
	<!-- font -->
	<div style="font-family: Sans-serif">

		<!-- Sidebar -->
		<%@ include file="/WEB-INF/views/admin/admMenubar.jsp" %>

		<!-- Page Content -->
		<div style="margin-left: 25%; margin-right: 100px; padding: 10%">

			<div class="w3-bottombar w3-border-teal" style="text-align: center;">
				<h2>관리자 페이지</h2>
			</div>

			<div>
				<br>
				<h5 style="padding: 1%">
					<b>공지사항 수정</b>
				</h5>
				<br>

				<div class="tableArea">
				<form action ="<%= request.getContextPath()%>/admUpdateNotice.no" id="admNoInsertForm" method="post">
				<table>
					<tr>
						<th>제목</th>
						<td>
						<input type="text" name="title" size='30' placeholder="제목을 입력해주세요" value="<%= title%>">
	       					<input type="hidden" name="number" value="<%= num %>">
						</td>		
					</tr>
					<tr>
						<th>작성자</th>
						<td name="nickName"></td>
						<th>작성일</th>
						<td name="date"></td>
					</tr>
					<tr>
						<th>내용</th>
					</tr>
					<tr>
						<td colspan="4"  name="content" cols="60"></td>
					</tr>
				</table>
			</form>
				
				</div>
			</div>
			
				<div align="center">
					<input type="submit" id="updateAdmNoBtn" value="수정" >
					<input type="button" onclick="location.href='javascript:history.go(-1);'" id="cancelBtn" value="취소">
				</div>


		</div>
	</div>

	<%@ include file="../common/footer.jsp"%>

	 <script>
		$(function(){
			$('#updateAdmNoBtn').onclick(function(){
				$('')
			});
		});
	</script>



</body>

</html>
