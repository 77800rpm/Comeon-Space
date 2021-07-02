<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList, faq.model.vo.Faq "
	import="faq.model.service.*, common.pageInfo.model.vo.PageInfo"%>
<%-- <% ArrayList<Faq> list = (ArrayList<Faq>)request.getAttribute("list"); %> --%>
<%
	ArrayList<Faq> list = (ArrayList) request.getAttribute("list");
PageInfo fPi = (PageInfo) request.getAttribute("fPi");

int fStartPage = fPi.getStartPage();
int fEndPage = fPi.getEndPage();
int fCurrentPage = fPi.getCurrentPage();
int fMaxPage = fPi.getMaxPage();
%>
<!DOCTYPE html>
<html>
<title>W3.CSS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
	#pageDiv{text-align:center;}
</style>
<body>
	<%@ include file="../common/header.jsp"%>

	<div style="font-family: Sans-serif">

		<!-- Sidebar -->
		<%@ include file="/WEB-INF/views/admin/admMenubar.jsp"%>

		<%-- <%@ include file="admMenubar.jsp" %> --%>



		<!-- Page Content -->
		<form action="<%=request.getContextPath() %>/writeFaqForm.bo" method="post">
		<div style="margin-left: 15%; margin-right: 100px; padding-top: 10%; padding-left: 10%; padding-right: 10%;">

			<div class="w3-bottombar w3-border-teal" style="text-align: center;">
				<h2>관리자 페이지</h2>
			</div>
			<hr>
			<div>

				<h5 style="padding: 1%">
					<b>게시글 관리</b>
				</h5>
				<div>
					<table class="table table-bordered table-sm"
						style="text-align: center;" id="listArea">
						<%
							if (list.isEmpty()) {
						%>
						<thead class="w3-light-grey">
							<tr>
								<td>조회된 게시글이 없습니다.</td>
							</tr>
						</thead>
						<%
							} else {
						%>
						<thead class="w3-light-grey">
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성일</th>
								<th>조회수</th>
							</tr>
						</thead>
						<tbody>
							<%
								for (Faq fo : list) {
							%>
							<tr>
								<td><%=fo.getBoardFaqNum()%></td>
								<td><%=fo.getBoardFaqTitle()%></td>
								<td><%=fo.getCreateDate()%></td>
								<td><%=fo.getBoardCount()%>
							</tr>
							<%
								}
							%>
						</tbody>
						<%
							}
						%>
					</table>
					<div align="right">
						<input type="submit" id="writeBoBtn" class="btn btn-outline-secondary" value="글쓰기">
					</div>
				</div>
			</div>

		</div>
		</form>
		<%if(!list.isEmpty()){ %>
			<!-- 페이징 시작 -->
			<div id="pageDiv">
				<!-- 맨 처음으로 -->
				<button onclick="location.href='<%=request.getContextPath()%>/list.bo?fCurrentPage=1'" class="btn btn-outline-success">맨처음</button>
				<!-- 이전 페이지 -->
				<button onclick="location.href='<%=request.getContextPath() %>/list.bo?fCurrentPage=<%=fCurrentPage - 1%>'" id="beforeBtn" class="btn btn-outline-success">이전</button>
				<script>
					if(<%=fCurrentPage%> <= 1){
						$("#beforeBtn").prop("disabled",true);
					};
				</script>
				<!-- 숫자 페이지 -->
				<%for(int p = fStartPage; p <= fEndPage; p++){ %>
					<%if(fCurrentPage == p){ %>
						<button disabled><%=p %></button>
					<%} else { %>
						<button onclick="location.href='<%=request.getContextPath()%>/list.bo?fCurrentPage=<%=p%>'" class="btn btn-outline-success"><%= p %></button>
					<%} %>
				<%} %>
				<!-- 다음 페이지 -->
				<button onclick="location.href='<%=request.getContextPath()%>/list.bo?fCurrentPage=<%=fCurrentPage + 1%>'"id="afterBtn" class="btn btn-outline-success">다음</button>
				<script>
		         	if(<%=fCurrentPage%> >= <%=fMaxPage%>){
		         		$("#afterBtn").prop("disabled",true);
		         	}
	         	</script>
				<!-- 맨끝 으로 -->
				<button onclick="location.href='<%=request.getContextPath() %>/list.bo?fCurrentPage=<%=fMaxPage %>'" id="lastBtn" class="btn btn-outline-success">맨끝</button>
				<script>
		         	if(<%=fCurrentPage%> >= <%=fMaxPage%>){
		         		$("#lastBtn").prop("disabled",true);
		         	}
	         	</script>
			</div>
			<!-- 페이징 끝 -->
		<%} %>
	<br><br><br><br>
	</div>
	
	<script>
		$(function(){
			$('#listArea td').mouseenter(function(){
				$(this).parent().css({'background':'darkgrey', 'cursor':'pointer'});
			}).mouseout(function(){
				$(this).parent().css('background','none');
			}).click(function(){
				var bId=$(this).parent().children().eq(0).text();
				if('<%=loginUser%>' != 'null'){
					location.href='<%=request.getContextPath()%>/faqDetail.bo?fo=' + bId;
				} 
// 				else {
// 					alert('관리자만 이용할 수 있는 서비스입니다.');
// 				}
			})
		});
		
//     	$(function(){
//     		$("#selectUserBtn").on("click",function(){
//     			console.log(1)
<%--     			location.href="<%= request.getContextPath() %>/selectUser.me"; --%>
//      		});
//     	});
    	
//     	$(function(){
//     		$("#listBoBtn").on("click",function(){
<%--     			location.href="<%= request.getContextPath() %>/list.bo"; --%>
//     		});
//     	});
    	
//     	$(function(){
//     		$("#admListNoBtn").on("click",function(){
<%--     			location.href="<%= request.getContextPath() %>/admList.no"; --%>
//     		});
//     	});

	</script>
	<%@ include file="../common/footer.jsp"%>
</body>

</html>
