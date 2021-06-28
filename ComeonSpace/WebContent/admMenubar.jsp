<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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


<div style="font-family:Sans-serif">
<!-- Sidebar -->

<div class="w3-sidebar w3-white" style="width:25%; margin-left:150px; ">
  <br><br><br><br><br>
  <div style="margin-left:150px">
  <h5 class="w3-bar-item"><b>회원관리</b></h5>
  <a href="<%= request.getContextPath() %>/selectUser.me" class="w3-bar-item w3-button">전체회원관리</a>
  <h5 class="w3-bar-item"><b>시설관리</b></h5>
  <a href="<%= request.getContextPath() %>" class="w3-bar-item w3-button">공간승인/취소</a>
  <h5 class="w3-bar-item"><b>게시판 관리</b></h5>
  <a href="<%= request.getContextPath() %>/list.bo" class="w3-bar-item w3-button">게시글 관리</a>
  <a href="<%= request.getContextPath() %>/admList.no" class="w3-bar-item w3-button">공지사항 관리</a>
  </div>
</div>


</div>


   
</body>

</html>
    