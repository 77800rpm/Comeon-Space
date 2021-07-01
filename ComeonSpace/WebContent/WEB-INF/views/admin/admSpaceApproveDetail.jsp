<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.ArrayList, product.model.vo.Product, java.util.HashMap"%>
<% ArrayList<Product> list = (ArrayList)request.getAttribute("list"); %>
<% HashMap<String, Object> pagingInfo = (HashMap<String, Object>)request.getAttribute("pagingInfo"); %>
<!DOCTYPE html>
<html>
<title>W3.CSS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<style>
	#div-bg{background-color:Gainsboro; width: 100%;}
</style>

<body>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!-- font -->
<div style="font-family:Sans-serif">

<!-- Sidebar -->
<%@ include file="/WEB-INF/views/admin/admMenubar.jsp" %>


<!-- Page Content -->
<div style="margin-left:15%; margin-right:50px; padding:10%">
<div class="w3-bottombar w3-border-teal" style="text-align:center;">
  <h2>관리자 페이지</h2>
  </div><br>
  <h5><b>공간 승인/취소 페이지</b></h5>
  <br>
  <div class="tableArea" id="div-bg" style="padding:5%">
					<form action="<%=request.getContextPath()%>/admSpaceApproveDetailForm.bo" id="admFaqDetailForm" method="post">
						<table >
							<tr>
								<th>공간이름 : </th>
							</tr>
							<tr>
								<th>금액 : </th>
							</tr>
							<tr>
								<th>카테고리 : </th>
							</tr>
							<tr>
								<th>한줄소개 : </th>
							</tr>
							<tr>
								<th>상세 소개 : </th>
							</tr>
							<tr>
								<th>주소 : </th>
							</tr>
							<tr>
								<th>공간 상세 이미지 : </th>
							</tr>
						</table>
						<br>
						<div align="center">
							<!-- 공간 db에 Approve가 default값으로 N 으로 되어있음
								목록은 Product_approve가 N인거 사진이라 내용 가져와서 List로 뿌리고 
								승인시 product_approve가 'Y'으로 바뀌게하기,
								취소시엔 삭제되게 하기-->
							<input class="w3-button w3-teal w3-round-xlarge" id="faqDeleteBtn" onclick=""type="button" value="승인">
							<input class="w3-button w3-red w3-round-xlarge" id="cancelBtn" onclick=""type="button" value="삭제">
						</div>
					</form>
	</div>

  <hr id="about">
</div>
</div>  
<%@ include file="/WEB-INF/views/common/footer.jsp" %>    
</body>

</html>
