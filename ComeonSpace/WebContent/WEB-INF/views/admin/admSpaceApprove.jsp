<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.ArrayList, product.model.vo.Product"%>
<% ArrayList<Product> list = (ArrayList)request.getAttribute("list"); %>
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

<body>
<!-- font -->
<div style="font-family:Sans-serif">

<!-- Sidebar -->
<%@ include file="/WEB-INF/views/admin/admMenubar.jsp" %>


<!-- Page Content -->
<div style="margin-left:25%; margin-right:50px; padding:10%">
<div class="w3-bottombar w3-border-teal" style="text-align:center;">
  <h2>관리자 페이지</h2>
  </div><br>
  <h5><b>공간 승인/취소</b></h5>

<!-- Second Photo Grid-->
  <div class="w3-row-padding w3-padding-16 w3-center">
  	<% for(Product prud:list){ %>
  		<div class="w3-quarter">
    		<img src="../admin_jpg/space1.jpg" style="width:100%">
    		<h5><%= prud.getProductName() %></h5>
    	</div>
    <% } %>
    <!-- <div class="w3-quarter">
      <img src="../admin_jpg/space1.jpg" style="width:100%">
      <h5>메종블랑쉬 스튜디오</h5>
      <p>간단한 설명이나 호스트 이름쓰거나 안쓰거나</p>
    </div>
    <div class="w3-quarter">
      <img src="../admin_jpg/space2.jpg" style="width:100%">
      <h5>2인 독립 오피스</h5>
      <p>간단한 설명이나 호스트 이름쓰거나 안쓰거나</p>
    </div>
    <div class="w3-quarter">
      <img src="../admin_jpg/space3.jpg" style="width:100%">
      <h5>한성대역 다목적홀</h5>
      <p>간단한 설명이나 호스트 이름쓰거나 안쓰거나</p>
    </div>
    <div class="w3-quarter">
      <img src="../admin_jpg/space1.jpg" style="width:100%">
      <h5>메종블랑쉬 스튜디오</h5>
      <p>간단한 설명이나 호스트 이름쓰거나 안쓰거나</p>
    </div>
    <div class="w3-quarter">
      <img src="../admin_jpg/space1.jpg" style="width:100%">
      <h5>메종블랑쉬 스튜디오</h5>
      <p>간단한 설명이나 호스트 이름쓰거나 안쓰거나</p>
    </div>
    <div class="w3-quarter">
      <img src="../admin_jpg/space1.jpg" style="width:100%">
      <h5>메종블랑쉬 스튜디오</h5>
      <p>간단한 설명이나 호스트 이름쓰거나 안쓰거나</p>
    </div>
    <div class="w3-quarter">
      <img src="../admin_jpg/space1.jpg" style="width:100%">
      <h5>메종블랑쉬 스튜디오</h5>
      <p>간단한 설명이나 호스트 이름쓰거나 안쓰거나</p>
    </div>
    <div class="w3-quarter">
      <img src="../admin_jpg/space1.jpg" style="width:100%">
      <h5>메종블랑쉬 스튜디오</h5>
      <p>간단한 설명이나 호스트 이름쓰거나 안쓰거나</p>
    </div> -->
  </div>

  <!-- Pagination -->
  <div class="w3-center w3-padding-25">
    <div class="w3-bar">
      <a href="#" class="w3-bar-item w3-button w3-hover-black">«</a>
      <a href="#" class="w3-bar-item w3-black w3-button">1</a>
      <a href="#" class="w3-bar-item w3-button w3-hover-black">2</a>
      <a href="#" class="w3-bar-item w3-button w3-hover-black">3</a>
      <a href="#" class="w3-bar-item w3-button w3-hover-black">4</a>
      <a href="#" class="w3-bar-item w3-button w3-hover-black">5</a>
      <a href="#" class="w3-bar-item w3-button w3-hover-black">»</a>
    </div>
  </div>
  
  <hr id="about">

<%=list%>






</div>
</div>      
</body>

</html>
