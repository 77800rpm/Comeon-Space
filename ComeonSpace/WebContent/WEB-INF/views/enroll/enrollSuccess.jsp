<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/templatemo.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
<link rel="stylesheet" href="assets/css/fontawesome.min.css">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<title>공간 등록 완료</title>

<style>
	/* 버튼 디자인 */
	#button{background: rgb(15, 103, 86); color: white; border: none; padding: 10px 30px; border-radius:40px; font-weight:bold !important;}

</style>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	<br><br><br>

	<!-- 공간 등록 -->
	<div class="container col-md-6 m-auto">
		<div class="row text-center mb-4">
			<h2>공간 등록을 완료했습니다</h2>
			<p>공간명 : <%= request.getAttribute("name") %></p>
		</div>

		<div class="row border">
		<div class="text-center px-xxl-3 py-xxl-4">
				공간을 등록하신 것을 축하드립니다!<br>
				공간 승인 결과는 공간 등록 날짜로부터 2주 안에 확인하실 수 있습니다.<br><br>
				공간이 승인된 후 부터 공간 목록에서 조회 및 예약이 가능합니다.<br><br>
				공간을 이용하는 사용자, 공간을 공유하는 호스트가 모두 기쁜 Comeon Space입니다.
				더 나은 Comeon Space가 될 수 있도록 고객분들과 함께 노력하겠습니다.
				<br><br>
				감사합니다.
			</div>
		</div>
	</div>
	<!-- 공간 등록 -->
	
	<!-- 확인 버튼 -->
	<div class="container mt-4">
		<div class="col-md-6 m-auto text-center">
			<input type="button" id="button" value="확인">
		</div>
	</div>
	<br><br><br>
	<%@ include file="../common/footer.jsp" %>
	<script>
		$(function(){
			$("#button").on("click",function(){
				location.href="<%=request.getContextPath()%>/enrollMain.en";
			})
		})
	</script>
	<!-- 확인 버튼 -->
</body>
</html>