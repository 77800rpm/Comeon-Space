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
				공간 승인 결과는 공간 등록 날짜로부터 2주 안에 확인하실 수 있습니다.<br>
				우리는 무엇 때문에 글을 쓰는 것인가에 대한 문제를 이야기하기 위해서는 먼저 문장의 종류를 살펴볼 필요가 있다. 
				우리가 쓰는 문장은 크게 두 가지로 나눌 수 있다. 하나는 우리가 일상생활을 하면서 필요해서 쓰는 문장, 
				즉 편지·일기·기행문·축사·조사 등 실용적인 목적으로 쓰는 실용문과, 또 하나는 그저 쓰고 싶어서 쓰는 글, 
				즉 시·수필 따위 예술적인 문예문이다. 실용문은 쓰는 목적이 분명하기 때문에 새삼스레 왜 글을 쓰느냐의 문제를 물을 필요가 없다.
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