<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, notice.model.vo.Notice"%>
<%
	Notice no = (Notice) request.getAttribute("notice");
%>
<%
	ArrayList<Notice> list = (ArrayList<Notice>) request.getAttribute("list");
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
.testTr {
	padding-bottom: 10px;
}
#tableArea{padding-left: 15%;}
</style>
<body>


	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<%-- 	<%@ include file="../common/header.jsp" %> --%>
	<!-- font -->
	<div style="font-family: Sans-serif">

		<!-- Sidebar -->
		<%@ include file="/WEB-INF/views/admin/admMenubar.jsp"%>
		<%-- <%@ include file="admMenubar.jsp" %> --%>

		<!-- Page Content -->
	<form action="<%=request.getContextPath()%>/admUpdateNotice.no"	id="admNoticeDetailForm" method="post">
		<div style="margin-left: 15%; margin-right: 100px; padding: 10%">

			<div class="w3-bottombar w3-border-teal" style="text-align: center;">
				<h2>관리자 페이지</h2>
			</div>

			<div>
				<br>
				<h5 style="padding: 1%">
					<b>공지사항 상세페이지</b>
				</h5>
				<br>

				<div id="tableArea">
						<table>

							<tr class="testTr">
								<th class="testTr">제목</th>
								<td colspan="3" class="testTr"><input type="text"
									value="<%=no.getnTitle()%>" size="50" name="title"> <input
									type="hidden" value="<%=no.getnNum()%>" name="num"></td>
							</tr>
							<tr class="testTr">
								<th class="testTr">작성자</th>
								<td class="testTr">Comeon Space</td>
								<th class="testTr">작성일</th>
								<td class="testTr"><%=no.getDate()%> <input type="hidden"
									value="<%=no.getDate()%>" name="date"></td>
							</tr>
							<tr class="testTr">
								<th class="testTr">내용</th>
							</tr>
							<tr>
								<td colspan="4"><textarea name="content" cols="80"
										rows="15" style="resize: none;"><%=no.getnContent()%></textarea>
								</td>
							</tr>

						</table>
				</div>
			</div>
			<br>
			<div align="center">
				<input type="submit" id="updateAdmNoBtn" class="btn btn-outline-success" value="수정">&nbsp;&nbsp;
				<input type="button" id="deleteAdmNoBtn" class="btn btn-outline-success" onclick="deleteAdm();" value="삭제">&nbsp;&nbsp;
				<input type="button" onclick="location.href='javascript:history.go(-1);'" class="btn btn-outline-success" id="cancelBtn" value="취소">
			</div>


		</div>
	</form>
	</div>

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>

	<script>
     	function deleteAdm(){
         	var bool = confirm("정말 삭제하시겠습니까?");
         	
         	if(bool){
         				$("#admNoticeDetailForm").attr('action', '<%=request.getContextPath()%>
		/admDeleteNotice.no');
				$("#admNoticeDetailForm").submit();
			}

		}
	</script>


</body>

</html>
