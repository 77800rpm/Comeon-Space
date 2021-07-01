<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, product.model.vo.Product, java.util.HashMap"%>
<%
	ArrayList<Product> list = (ArrayList) request.getAttribute("list");
%>
<%
	HashMap<String, Object> pagingInfo = (HashMap<String, Object>) request.getAttribute("pagingInfo");
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
		<%@ include file="/WEB-INF/views/admin/admMenubar.jsp"%>


		<!-- Page Content -->
		<div style="margin-left: 15%; margin-right: 50px; padding: 10%">
			<div class="w3-bottombar w3-border-teal" style="text-align: center;">
				<h2>관리자 페이지</h2>
			</div>
			<br>
			<h5>
				<b>공간 승인/취소</b>
			</h5>

			<div class="tableArea">
				<form action="<%=request.getContextPath()%>/boardUpdateForm.bo"
					id="admFaqDetailForm" method="post">
					<table>
						<tr>
							<th class="testTh" width="10%">공간이름</th>
							<td colspan="3" class="testTh"><input type="text"
								name="title" value=""></td>
							<td><input type="hidden" value="" name="fo"></td>
						</tr>
						<tr>
							<th class="testTh">내용</th>
							<td colspan="3"><textarea rows="15" cols="100"
									name="content" style="resize: none;"></textarea></td>
						</tr>
					</table>
					<br>
					<div align="center">
						<input type="button" id="faqDeleteBtn" onclick="faqDelete();"
							value="삭제"> <input type="submit" id="faqUpdateBtn"
							value="수정"> <input type="button"
							onclick="location.href='javascript:history.go(-1);'"
							id="cancelBtn" value="취소">
					</div>
				</form>
			</div>





			<hr id="about">
		</div>
	</div>
	<%@ include file="../common/footer.jsp"%>
</body>

</html>
