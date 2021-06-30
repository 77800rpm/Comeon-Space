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
<style>
	#testDiv2{float:left; display:inline-block;}
</style>
<body>


<div style="font-family:Sans-serif" id="testDiv2">
<!-- Sidebar -->
	<div class="w3-white w3-bar-block" style="width:100%;">
	  <br><br><br><br><br>
	  <div style="margin-left:150px">
	  <h5 class="w3-bar-item"><b>회원관리</b></h5>
	  <a href="<%= request.getContextPath() %>/selectUser.me" class="w3-bar-item w3-button" id="selectUserBtn">전체회원관리</a>
	  <h5 class="w3-bar-item"><b>시설관리</b></h5>
	  <a href="<%= request.getContextPath() %>/spaceApproveList.bo" class="w3-bar-item w3-button">공간승인/취소</a>
	  <h5 class="w3-bar-item"><b>게시판 관리</b></h5>
	  <a href="<%= request.getContextPath() %>/list.bo" class="w3-bar-item w3-button" id="listBoBtn" >게시글 관리</a>
	  <a href="<%= request.getContextPath() %>/admList.no" class="w3-bar-item w3-button" id="admListNoBtn">공지사항 관리</a>
	  </div>
	</div>


</div>

<script>
    	$(function(){
    		$("#selectUserBtn").on("click",function(){
    			location.href="<%= request.getContextPath() %>/selectUser.me";
    		});
    	});
    	
    	$(function(){
    		$("#listBoBtn").on("click",function(){
    			location.href="<%= request.getContextPath() %>/list.bo";
    		});
    	});
    	
    	$(function(){
    		$("#admListNoBtn").on("click",function(){
    			location.href="<%= request.getContextPath() %>/admList.no";
    		});
    	});
</script>


   
</body>

</html>
    