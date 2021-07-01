<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, member.model.vo.Member"
    import="member.model.service.*" %>
<%--<% ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list"); --%>
<% MemberService ms = new MemberService();
   ArrayList<Member> list = (ArrayList<Member>)ms.adminSelectUser(); %>
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
<%-- <div class="w3-sidebar w3-white w3-bar-block" style="width:25%; margin-left:150px; ">
 	 <br><br><br><br><br>
  <div style="margin-left:150px">
	  <h5 class="w3-bar-item"><b>회원관리</b></h5>
	  <a href="<%= request.getContextPath() %>/selectUser.me" class="w3-bar-item w3-button">전체회원관리</a>
	  <h5 class="w3-bar-item"><b>시설관리</b></h5>
	  <a href="#" class="w3-bar-item w3-button">공간승인/취소</a>
	  <h5 class="w3-bar-item"><b>게시판 관리</b></h5>
	  <a href="#" class="w3-bar-item w3-button">게시글 관리</a>
	  <a href="#" class="w3-bar-item w3-button">공지사항 관리</a>
  </div>
</div> --%>
<%@ include file="/WEB-INF/views/admin/admMenubar.jsp" %>

<!-- Page Content -->
<div style="margin-left:15%; margin-right:100px; padding:10%">

<div class="w3-bottombar w3-border-teal" style="text-align:center;">
  <h2>관리자 페이지</h2>
</div>

<div>
	<br>
  <h5 style="padding:1%"><b>전체회원관리</b></h5>
  	<br>

<div>
  <form action="<%=request.getContextPath()%>/selectUser.me" id="admWithdrawList" method="post">         
  <table class="table table-bordered table-sm" style="text-align:center;">
  	<% if(list == null){ %>
   		<thead class="w3-light-grey">
		   	<tr>
		   		<td> NULL ERROR! </td>
		   	</tr>
		</thead>
   	<% }else if(list.isEmpty()){ %>
   		<thead class="w3-light-grey">
		   	<tr>
		   		<td>가입된 회원이 없습니다.</td>
		   	</tr>
		</thead>
   	<% } else{ %>
   		<thead class="w3-light-grey">
	   		<tr>
		        <th>이름</th>
		        <th>이메일</th>
		        <th>닉네임</th>
		        <th>핸드폰번호</th>
		        <th>강제탈퇴</th>
		      </tr>
		 </thead>
		 <tbody>
   			<% for(Member m : list){ %>
		      <tr>
		        <td><%= m.getUserName() %></td>
		        <td><%= m.getUserEmail() %></td>
		        <td><%= m.getUserNic() %></td>
		        <td><%= m.getUserPhone() %></td>
		        <td>
		        <input type="button" value="탈퇴" id="withdraw">
		        <input type="hidden" value="<%= m.getUserNum() %>" name="userNum"></td>
		      </tr>
   			<% } %>
   		</tbody>
      <% } %>
   </table>
   	</form>
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
	
	
	<script>
     	function withdraw(){
         	var bool = confirm("강제 탈퇴시키겠습니까?");
         	
         	if(bool){
         				$("#admWithdrawList").attr('action', '<%= request.getContextPath()%>/admDeleteMember.me');
         				$("#admWithdrawList").submit();									
         	}
     			
         		}     	
     </script>
</body>

</html>
