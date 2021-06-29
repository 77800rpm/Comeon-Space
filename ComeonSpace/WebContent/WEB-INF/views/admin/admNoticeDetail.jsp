<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, notice.model.vo.Notice" %>
<%
	Notice no = (Notice) request.getAttribute("notice");
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
	

	<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%-- 	<%@ include file="../common/header.jsp" %> --%>
	<!-- font -->
	<div style="font-family: Sans-serif">

		<!-- Sidebar -->
		<%@ include file="/WEB-INF/views/admin/admMenubar.jsp" %>
		<%-- <%@ include file="admMenubar.jsp" %> --%>

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
				<form action ="<%= request.getContextPath()%>/admUpdateNotice.no" id="admNoticeDetailForm" method="post">
				<table>
					<tr>
						<th>제목</th>
						<td colspan="3">
						<%= no.getnTitle() %>
						<input type="hidden" value="<%= no.getnTitle() %>" name="title">	
						<input type="hidden" value="<%= no.getnNum() %>" name="no">			
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
<!-- 					<input type="submit" id="updateAdmNoBtn" value="수정"> -->
					<input type="button" id="deleteAdmNoBtn" onclick="deleteAdm();" value="삭제">
					<input type="button" onclick="location.href='javascript:history.go(-1);'" id="cancelBtn" value="취소">
				</div>


		</div>
	</div>

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>

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