<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, faq.model.vo.Faq " 
    import="faq.model.service.*" %>
<%-- <% ArrayList<Faq> list = (ArrayList<Faq>)request.getAttribute("list"); %> --%>
<% FaqService fs = new FaqService();
	ArrayList<Faq> list = (ArrayList<Faq>)fs.faqSelect(); %>
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
<%@ include file="WEB-INF/views/common/header.jsp" %>

<div style="font-family:Sans-serif">
<!-- Sidebar -->

<div class="w3-sidebar w3-white w3-bar-block" style="width:25%; margin-left:150px; ">
  <br><br><br><br><br>
  <div style="margin-left:150px">
  <h5 class="w3-bar-item"><b>회원관리</b></h5>
  <a href="#" class="w3-bar-item w3-button">전체회원관리</a>
  <h5 class="w3-bar-item"><b>시설관리</b></h5>
  <a href="#" class="w3-bar-item w3-button">공간승인/취소</a>
  <h5 class="w3-bar-item"><b>게시판 관리</b></h5>
  <a href="<%= request.getContextPath() %>/list.bo" class="w3-bar-item w3-button">게시글 관리</a>
  <a href="#" class="w3-bar-item w3-button">공지사항 관리</a>
  </div>
</div>

<!-- Page Content -->
<div style="margin-left:25%; margin-right:100px; padding:10%">

<div class="w3-bottombar w3-border-teal" style="text-align:center;">
  <h2>관리자 페이지</h2>
</div>

<div>

  <h5 style="padding:1%"><b>게시글 관리</b></h5>

<div>           
  <table class="table table-bordered table-sm" style="text-align:center;" id="listArea">
  	<% if(list == null){ %>
    <thead class="w3-light-grey">
       <tr>
          <td> NULL ERROR! </td>
       </tr>
    </thead>
    <%} else if(list.isEmpty()){ %>
    <thead class="w3-light-grey">
       <tr>
          <td>조회된 게시글이 없습니다.</td>
       </tr>
    </thead>
    <% } else{ %>
    <thead class="w3-light-grey">
      <tr>
        <th>번호</th>
        <th>제목</th>
        <th>내용</th>
        <th>작성일</th>
        <th>조회수</th>        
      </tr>
    </thead>
    <tbody>
       <% for(Faq f : list){ %>
      <tr>
        <td><%= f.getBoardFaqNum() %></td>
        <td><%= f.getBoardFaqTitle() %></td>
        <td><%= f.getBoardFaqContent() %></td>
        <td><%= f.getCreateDate() %></td>
        <td><%= f.getBoardCount() %>
      </tr>
         <% } %>
    </tbody>
      <% } %>
   </table>
   </div>
</div>

<div class="buttonArea" align="right">
				<button onclick="location.href='<%= request.getContextPath() %>/writeBoardForm.bo'">작성하기</button>
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
<script>
		$(function(){
			$('#listArea td').mouseenter(function(){
				$(this).parent().css({'background':'darkgrey', 'cursor':'pointer'});
			}).mouseout(function(){
				$(this).parent().css('background','none');
			}).click(function(){
				var bId=$(this).parent().children().eq(0).text();
				if('<%= loginUser %>' != 'null'){
					location.href='<%= request.getContextPath() %>/detail.bo?bId=' + bId;
				} else {
					alert('회원만 이용할 수 있는 서비스입니다.');
				}
			})
		});
	</script>



<%@ include file="WEB-INF/views/common/footer.jsp" %>      
</body>

</html>
    