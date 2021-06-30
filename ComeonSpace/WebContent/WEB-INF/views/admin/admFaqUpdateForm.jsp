<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList, faq.model.vo.Faq "
	import="faq.model.service.*"%>
<%-- <% ArrayList<Faq> list = (ArrayList<Faq>)request.getAttribute("list"); %> --%>
<%
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
	<%@ include file="../common/header.jsp"%>

	<div style="font-family: Sans-serif">

<%@ include file="/WEB-INF/views/admin/admMenubar.jsp" %>

		<!-- Page Content -->
		<div style="margin-left: 25%; margin-right: 100px; padding: 10%">

			<div class="w3-bottombar w3-border-teal" style="text-align: center;">
				<h2>관리자 페이지</h2>
			</div>

			<div>

				<h5 style="padding: 1%">
					<b>게시글 작성</b>
				</h5>

				<div class="tableArea">
					<form action="<%=request.getContextPath()%>/faqInsert.bo"
						method="post">
						<table>
							<tr>
								<th>제목</th>
								<td colspan="3"><input type="text" size="100" name="title"></td>
							</tr>
							<tr>
								<th>내용</th>
								<td colspan="3"><textarea rows="15" cols="100"
										name="content" style="resize: none;"></textarea></td>
							</tr>
						</table>
						<br>
						<div align="center">
							<input type="submit" id="insertBtn" value="등록하기">
							<input type="button" onclick="location.href='javascript:history.go(-1);'" id="cancelBtn" value="취소">
						</div>
					</form>
				</div>
			</div>
		</div>

	</div>
	<%@ include file="../common/footer.jsp"%>
</body>

</html>
