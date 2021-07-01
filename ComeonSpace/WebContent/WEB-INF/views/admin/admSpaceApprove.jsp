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
<style>
.imgListBox {
	
}

.imgListBox a {
	
}

.imgListBox a img {
	
}

.imgListBox a h5 {
	
}
</style>
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

			<!-- Second Photo Grid-->
			<h5>
				<b>공간 승인/취소</b>
			</h5>
			<div class="w3-row-padding w3-padding-16 w3-left w3-container">
				<%
					for (Product prud : list) {
				%>
				<a class="w3-quarter"
					href="<%=request.getContextPath()%>/spaceApproveDetail.bo?productNum=<%=prud.getProductNum()%>">
					<img
					src="<%=request.getContextPath()%>/img_upload/<%=prud.getImgChange()%>"
					style="width: 200px; height: 200px"
					class="w3-hover-opacity w3-card-3">
					<h5><%=prud.getProductName()%></h5>
				</a>
				<%
					}
				%>

			</div>

<%-- 			<%=pagingInfo%> --%>
			<!-- Pagination -->
			<%
				if (Integer.valueOf(pagingInfo.get("totalCount").toString()) > 0) {
			%>
			<%
				int startPage = Integer.valueOf(pagingInfo.get("startPage").toString());
			%>
			<%
				int endPage = Integer.valueOf(pagingInfo.get("endPage").toString());
			%>
			<%
				int nowPageNo = Integer.valueOf(pagingInfo.get("nowPageNo").toString());
			%>
			<div class="w3-center w3-padding-25">
				<div class="w3-bar">
					<a
						href="<%=request.getContextPath()%>/spaceApproveList.bo?pageNo=1"
						class="w3-bar-item w3-button w3-hover-black">&lt;&lt;</a> <a
						href="<%=request.getContextPath()%>/spaceApproveList.bo?pageNo=<%=startPage - 1%>"
						class="w3-bar-item w3-button w3-hover-black">&lt;</a>
					<%
						for (int p = startPage; p <= endPage; p++) {
					%>
					<%
						if (p == nowPageNo) {
					%>
					<a
						href="<%=request.getContextPath()%>/spaceApproveList.bo?pageNo=<%=p%>"
						class="w3-bar-item w3-button w3-black"><%=p%></a>
					<%
						} else {
					%>
					<a
						href="<%=request.getContextPath()%>/spaceApproveList.bo?pageNo=<%=p%>"
						class="w3-bar-item w3-button"><%=p%></a>
					<%
						}
					%>
					<%
						}
					%>
					<a
						href="<%=request.getContextPath()%>/spaceApproveList.bo?pageNo=<%=endPage + 1%>"
						class="w3-bar-item w3-button w3-hover-black">&gt;</a> <a
						href="<%=request.getContextPath()%>/spaceApproveList.bo?pageNo=<%=pagingInfo.get("totalPageCount")%>"
						class="w3-bar-item w3-button w3-hover-black">&gt;&gt;</a>
				</div>
			</div>
			<%
				}
			%>

			<hr id="about">
		</div>
	</div>
	<%@ include file="../common/footer.jsp"%>
</body>

</html>
