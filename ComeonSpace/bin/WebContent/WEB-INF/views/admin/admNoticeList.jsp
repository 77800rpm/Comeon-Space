<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, notice.model.vo.Notice"%>
<% ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list"); %>
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
<%-- <form action="<%= request.getContextPath() %>/selectUser.me"> --%>

<%@ include file="../common/header.jsp" %>
<!-- font -->
<div style="font-family:Sans-serif">

<!-- Sidebar -->
<div class="w3-sidebar w3-white w3-bar-block" style="width:25%; margin-left:150px; ">
 	 <br><br><br><br><br>
  <div style="margin-left:150px">
	  <h5 class="w3-bar-item"><b>회원관리</b></h5>
	  <a class="w3-bar-item w3-button">전체회원관리</a>
	  <h5 class="w3-bar-item"><b>시설관리</b></h5>
	  <a href="#" class="w3-bar-item w3-button">공간승인/취소</a>
	  <h5 class="w3-bar-item"><b>게시판 관리</b></h5>
	  <a href="#" class="w3-bar-item w3-button">게시글 관리</a>
	  <a href="<%= request.getContextPath() %>/admList.no" class="w3-bar-item w3-button">공지사항 관리</a>
  </div>
</div>

<!-- Page Content -->
<div style="margin-left:25%; margin-right:100px; padding:10%">

<div class="w3-bottombar w3-border-teal" style="text-align:center;">
  <h2>관리자 페이지</h2>
</div>

<div>
	<br>
  <h5 style="padding:1%"><b>공지사항관리</b></h5>
  	<br>

<div>           
  <table class="table table-bordered table-sm" style="text-align:center;" id="listArea">
  	<% if(list == null){ %>
   		<thead class="w3-light-grey">
		   	<tr>
		   		<td> NULL ERROR! </td>
		   	</tr>
		</thead>
   	<% }else if(list.isEmpty()){ %>
   		<thead class="w3-light-grey">
		   	<tr>
		   		<td>공지사항이 없습니다.</td>
		   	</tr>
		</thead>
   	<% } else{ %>
   		<thead class="w3-light-grey">
	   		<tr>
				<th>번호</th>
		        <th>제목</th>
		        <th>작성자</th>
		        <th>작성날짜</th>
		      </tr>
		 </thead>
		 <tbody>
  		<% for(Notice no : list){ %>
		      <tr>
		        <td><%= no.getnNum()%></td>
				<td><%= no.getnTitle()%></td>
				<td><%= no.getAdmName()%></td>
				<td><%= no.getDate()%></td>
		      </tr>
		      <% } %>
	<% } %>
   		</tbody>
   </table>
	</div>
	
	<div align="right">
		<% if(loginUser != null && loginUser.getUserEmail().equals("admin123@cs.com")){ %>
			<input type="button" onclick="location.href='admNoticeWriteForm.jsp'" id="writeNoBtn" value="글쓰기">
		<% } %>			
		</div>
	
	
</div>

<!-- page-button -->
<div class="w3-center">
<div class="w3-bar">
  <a href="#" class="w3-bar-item w3-button">&laquo;</a>
  <a href="#" class="w3-button w3-teal">1</a>
  <a href="#" class="w3-button">2</a>
  <a href="#" class="w3-button">3</a>
  <a href="#" class="w3-button">4</a>
  <a href="#" class="w3-button">5</a>
  <a href="#" class="w3-button">&raquo;</a>
</div>
</div>

</div>
</div>

<%@ include file="../common/footer.jsp" %>

<!-- </form> -->
<!-- 상세조회 -->
		<script>
		$(function(){
			$('#listArea td').mouseenter(function(){	
				$(this).parent().css({'background':'darkgray','cursor':'pointer'});
			}).mouseout(function(){
				$(this).parent().css({'background':'none'});
			}).click(function(){
				var num = $(this).parent().children().eq(0).text(); 
				location.href="<%=request.getContextPath() %>/admDetail.no?no=" + num;
			});
		});
		</script>


</body>

</html>
