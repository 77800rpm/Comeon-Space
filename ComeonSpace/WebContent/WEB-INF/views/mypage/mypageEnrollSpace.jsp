<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, enroll.model.vo.Enroll, img.model.vo.Img, common.pageInfo.model.vo.PageInfo"%>
<%
	ArrayList<Enroll> list = (ArrayList)request.getAttribute("list");
	ArrayList<Img> imgList = (ArrayList)request.getAttribute("imgList");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int currentPage = pi.getCurrentPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/templatemo.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
<link rel="stylesheet" href="assets/css/fontawesome.min.css">

<!-- Start Script -->
<script src="assets/js/jquery-1.11.0.min.js"></script>
<script src="assets/js/jquery-migrate-1.2.1.min.js"></script>
<script src="assets/js/bootstrap.bundle.min.js"></script>
<script src="assets/js/templatemo.js"></script>
<script src="assets/js/custom.js"></script>
<!-- End Script -->
<title>내 공간 목록</title>

<style>
	/* 검색창 */
	.form-control:focus{color:#212529;background-color:#fff;border-color:rgb(15, 103, 86, 30);outline:0;box-shadow:none;}
	.bg-success{background-color: rgb(15, 103, 86) !important; border:none; border-top-right-radius: 5px; border-bottom-right-radius: 5px;}
	::placeholder{ font-size: 0.9em;}
	
	/* 더보기*/
	#button_moreSpace{border: 1px solid black; padding: 12px 30px; font-size: 15px; width: 300px; margin-left:auto; margin-right:auto; background: white;}
	
	/* 버튼 */
	.button-ok{background: rgb(15, 103, 86); color: white; border: none; padding: 6px; border-radius:40px; font-weight:bold; font-size: 14px; width:150px; pointer-events: none;}
	.button-no{background: gray; color: white; border: none; padding: 6px; border-radius:40px; font-weight:bold; font-size: 14px; width:150px; pointer-events: none;}
	.button-ing{background: orange; color: white; border: none; padding: 6px; border-radius:40px; font-weight:bold; font-size: 14px; width:150px; pointer-events: none;}
	
	/* 이미지 크기 조절 */
	img{height: 220px;}
	.contentDiv{display:inline-block;}
	#testDiv{width:7%;}
	#testBtn{margin-bottom: 7px; background: rgb(15, 103, 86); color: white; border: none; padding: 6px; border-radius:40px; font-weight:bold; font-size: 14px; width:150px;}
	#pageDiv{text-align:center;}
</style>
</head>
<header>
	<%@ include file="../common/header.jsp" %>
</header>
<body>
	<!-- sideBar -->
	<!-- title -->
<!-- 	<div class="m-auto"> -->
<!-- 		<div class="row text-center mb-2"> -->
<!-- 			<h2>My Come on Space</h2> -->
<!-- 		</div> -->
<!-- 	</div> -->
	<!-- title -->
	
	<!-- 공간 목록 -->
	<div class="contailner py-5">
		<div class="row">
			<!-- 메뉴바 시작 -->
			<div id="testDiv"></div>
			<!-- 메뉴바 끝 -->
			<%@include file="menubar.jsp" %>
				<div class="contentDiv col-lg-7 lg-4">
					<div>
					<h2 style="text-align: center;">My Comeon Space</h2>
					</div>
					<hr>
					<br>
					<div class="row" id="rowDiv">
						<%if(!list.isEmpty()){ %>
							<%for(Enroll e : list){ %>
								<div class="col-md-4 contentDiv">
									<div class="card mb-2">
										<%for(int i = 0; i < imgList.size(); i++){ %>
											<%if(e.getpNum() == imgList.get(i).getImgBoardId()){ %>
												<img class="rounded-2" src="<%=request.getContextPath()%>/img_upload/<%=imgList.get(i).getImgChange()%>">
											<%} %>
										<%} %>
									</div>
									<div class="card-body text-center">
										<div class="col-md-8 m-auto text-center">
											<input type="button" id="testBtn" class="" value="공간 보기">
										</div>
										<h5><%=e.getpName() %></h5>
										<small><%=e.getpIntro() %></small>
						            </div>
						            <input type="hidden" class="enrollNum" value="<%=e.getpNum()%>">
								</div>
							<%} %>
						<%} else { %>
							<h4 style="text-align:center;">" 등록한 공간이 없습니다 "</h4>
						<%} %>
					</div>
					<%if(!list.isEmpty()){ %>
						<!-- 페이징 시작 -->
						<div id="pageDiv">
							<!-- 맨처음으로 -->
							<button class="ansBtn btn btn-outline-success btn-sm" onclick="location.href='<%=request.getContextPath()%>/enrollSpace.my?currentPage=1'">맨처음</button>
							<!-- 이전 페이지 -->
							<button class="ansBtn btn btn-outline-success btn-sm" id="beforeBtn"onclick="location.href='<%=request.getContextPath()%>/enrollSpace.my?currentPage=<%=currentPage -1%>'">이전</button>
							<script>
								if(<%=currentPage%> <= 1){
									$("#beforeBtn").prop("disabled",true);
								}
							</script>
							<!-- 숫자 페이징 -->
							<%for(int p = startPage; p <= endPage; p++){ %>
								<%if(currentPage == p) {%>
									<button class="ansBtn btn btn-outline-success btn-sm" disabled><%=p %></button>
								<%} else {%>
									<button class="ansBtn btn btn-outline-success btn-sm" onclick="location.href='<%=request.getContextPath()%>/enrollSpace.my?currentPage=<%=p%>'"><%=p %></button>
								<%} %>
							<%} %>
							<!-- 다음 페이지 -->
							<button class="ansBtn btn btn-outline-success btn-sm" id="afterBtn" onclick="location.href='<%=request.getContextPath()%>/enrollSpace.my?currentPage=<%=currentPage + 1%>'">다음</button>
							<script>
								if(<%=currentPage%> >= <%=maxPage%>){
									$("#afterBtn").prop("disabled",true);
								}
							</script>
							<button class="ansBtn btn btn-outline-success btn-sm" id="endBtn" onclick="location.href='<%=request.getContextPath()%>/enrollSpace.my?currentPage=<%=maxPage%>'">맨끝</button>
							<script>
								if(<%=currentPage%> == <%=maxPage%>){
									$("#endBtn").prop("disabled",true);
								}
							</script>
						</div>
						<!-- 페이징 끝 -->
					<%} %>
<!-- 					enrollSpace.my -->
					
				</div>
				<!-- 공간 목록 끝 -->
		</div>	
	</div>
	<br><br><br>
</body>
<script>
	$(document).ready(function(){
		$("#rowDiv input[type=button]").on("click",function(){
			var num = $(this).parent().parent().next('input').val();
			location.href="<%=request.getContextPath()%>/productDetail.no?no=" + num;
		});
	})
</script>
<footer>
	<%@ include file="../common/footer.jsp" %>
</footer>
</html>