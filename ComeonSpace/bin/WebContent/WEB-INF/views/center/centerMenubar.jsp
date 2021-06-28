<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.center-sideList{display: inline-block; width: 15%;}
	.center-sideList>ul{list-style-type:none;}
	.sideList-top{
		font-size: 35px;
		margin-top: 20px;
		margin-bottom: 10px;
		display:inline-block;
	}
	.sideList{
		width: 100px;
		border-bottom: 1px solid black;
		display: inline-block;		
		margin-bottom: 12px;
		cursor: pointer;
	}
	.center-align{float:left;}
</style>
</head>
<body>
	<div class="center-sideList center-align">
  		<span class="sideList-top" id="sideCenterView">고객센터</span><br>
  		<span class="sideList" id="sideMyQInsert"><a>문의하기</a></span><br>
  		<span class="sideList" id="sideNoticeList"><a>공지사항</a></span><br>
  		<span class="sideList" id="sideFAQList"><a>FAQ</a></span><br>
  		<span class="sideList" id="sideMyQView"><a>내 질문</a></span><br>
  		<span class="sideList" id="sideWithdrawal"><a>회원탈퇴</a></span>
    </div>
</body>
<script>
	$(function(){
		$("#sideMyQInsert").on("click",function(){
			location.href="<%= request.getContextPath() %>/myQInsertForm.ce";
		});
	})
	$(function(){
		$("#sideNoticeList").on("click",function(){
			location.href="<%= request.getContextPath() %>/noList.no";
		});
	})
	$(function(){
		$("#sideFAQList").on("click",function(){
			location.href="<%= request.getContextPath() %>/faqList.ce";
		});
	})
	$(function(){
		$("#sideMyQView").on("click",function(){
			location.href="<%= request.getContextPath() %>/myQView.ce";
		});
	})
	$(function(){
		$("#sideWithdrawal").on("click",function(){
			location.href="<%= request.getContextPath() %>/delteForm.ce";
		});
	})
</script>
</html>