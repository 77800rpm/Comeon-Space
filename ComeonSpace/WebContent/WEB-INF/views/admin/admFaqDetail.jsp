<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList, faq.model.vo.Faq "
	import="faq.model.service.*"%>
<%
	Faq fo = (Faq)request.getAttribute("fo");
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
<style>
	.testTh{padding-bottom: 15px;}
</style>
<body>
	<%@ include file="../common/header.jsp"%>

	<div style="font-family: Sans-serif">

<!-- Sidebar -->
<%@ include file="/WEB-INF/views/admin/admMenubar.jsp" %>

		<!-- Page Content -->
		<div style="margin-left: 15%; margin-right: 100px; padding: 10%">

			<div class="w3-bottombar w3-border-teal" style="text-align: center;">
				<h2>관리자 페이지</h2>
			</div>

			<div>

				<h5 style="padding: 1%">
					<b>게시글 상세보기</b>
				</h5>

				<div class="tableArea">
					<form action="<%=request.getContextPath()%>/boardUpdateForm.bo" id="admFaqDetailForm" method="post">
						<table>
							<tr>
								<th class="testTh" width="10%">제목</th>
								<td colspan="3" class="testTh">
								<input type="text" name="title" value="<%= fo.getBoardFaqTitle() %>">
								</td>
								<td><input type="hidden" value="<%= fo.getBoardFaqNum() %>" name="fo"></td>
								
								
<%-- 								<%= fo.getBoardFaqNum() %> --%>
							</tr>
							<tr>
								<th class="testTh">내용</th>
								<td colspan="3"><textarea rows="15" cols="100"
										name="content" style="resize: none;"><%= fo.getBoardFaqContent() %></textarea></td>
							</tr>
						</table>
						<br>
						<div align="center">
							<input type="button" id="faqDeleteBtn" class="btn btn-outline-secondary" onclick="faqDelete();" value="삭제">&nbsp;
							<input type="submit" id="faqUpdateBtn" class="btn btn-outline-secondary" value="수정">&nbsp;
							<input type="button" class="btn btn-outline-secondary" onclick="location.href='javascript:history.go(-1);'" id="cancelBtn" value="취소">
						</div>
					</form>
				</div>
			</div>
		</div>

	</div>
	<%@ include file="../common/footer.jsp"%>
	
	<script>
     	function faqDelete(){
         	var bool = confirm("정말 삭제하시겠습니까?");
         	
         	if(bool){
         				$("#admFaqDetailForm").attr('action', '<%= request.getContextPath()%>/admDeleteFaq.bo');
         				$("#admFaqDetailForm").submit();									
         	}
     			
         		}
     	// 게시글 수정
     	$(function(){
    		$("#faqUpdateBtn").on("click",function(){
    			location.href="<%= request.getContextPath() %>/boardUpdateForm.bo";
    		});
    	});
     </script>
	
	
</body>

</html>
