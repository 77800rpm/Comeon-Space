<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, notice.model.vo.Notice"%>
<%
	ArrayList<Notice> list = (ArrayList<Notice>) request.getAttribute("list");
%>
<%
	Notice no = (Notice) request.getAttribute("no");
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
	

	<%@ include file=../common/header.jsp"%>
	<!-- font -->
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
				<a class="w3-bar-item w3-button">전체회원관리</a>
				<h5 class="w3-bar-item">
					<b>시설관리</b>
				</h5>
				<a href="#" class="w3-bar-item w3-button">공간승인/취소</a>
				<h5 class="w3-bar-item">
					<b>게시판 관리</b>
				</h5>
				<a href="#" class="w3-bar-item w3-button">게시글 관리</a> <a
					href="<%=request.getContextPath()%>"
					class="w3-bar-item w3-button">공지사항 관리</a>
			</div>
		</div>

		<!-- Page Content -->
		<div style="margin-left: 25%; margin-right: 100px; padding: 10%">

			<div class="w3-bottombar w3-border-teal" style="text-align: center;">
				<h2>관리자 페이지</h2>
			</div>

			<div>
				<br>
				<h5 style="padding: 1%">
					<b>공지사항 상세페이지</b>
				</h5>
				<br>

				<div class="tableArea">
				<form action ="<%= request.getContextPath()%>/admUpdateNotice.no" id="admNoticeDetailForm" method="post";>
				<table>
					<tr>
						<th>제목</th>
						<td colspan="3">
						<%= no.getnTitle() %>
						<input type="hidden" value="<%= no.getnTitle() %>" name="title">	
						<input type="hidden" value="<%= no.getnNum() %>" name="num">			
					</tr>
					<tr>
						<th>작성자</th>
						<td>
							<%= no.getAdmName() %>
							<input type="hidden" value="<%= no.getAdmName() %>" name="nickName">	
						</td>
						<th>작성일</th>
						<td>
							<%= no.getDate() %>
							<input type="hidden" value="<%= no.getDate() %>" name="date">
						</td>
					</tr>
					<tr>
						<th>내용</th>
					</tr>
					<tr>
						<td colspan="4">
							<textarea name="content" cols="80" rows="15" style="resize:none;" readonly><%= no.getnContent() %></textarea>
						</td>
					</tr>
				</table>
			</form>
				
				</div>
			</div>
			
				<div align="center">
					<input type="submit" id="updateAdmNoBtn" value="수정">
					<input type="button" id="deleteAdmNoBtn" onclick="deleteAdm();" value="삭제">
					<input type="button" onclick="location.href='javascript:history.go(-1);'" id="cancelBtn" value="취소">
				</div>


		</div>
	</div>

	<%@ include file="../common/footer.jsp"%>

	 <script>
     	function deleteAdm(){
         	var bool = confirm("정말 삭제하시겠습니까?");
         	
         	if(bool){
         				$("#admNoticeDetailForm").attr('action', '<%= request.getContextPath()%>/admDeleteNotice.no');
         				$("#admNoticeDetailForm").submit();
         	}
     			
         		}
     </script>


</body>

</html>
