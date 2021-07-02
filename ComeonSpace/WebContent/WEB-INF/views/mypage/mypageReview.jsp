<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, img.model.vo.Img, review.model.vo.Review, common.pageInfo.model.vo.PageInfo"%>
<%
	ArrayList<Review> list = (ArrayList)request.getAttribute("re");
	ArrayList<Img> img = (ArrayList)request.getAttribute("img");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
%>	

<!DOCTYPE html>
<html lang="en">

<head>
    <title>Zay Shop - Product Listing Page</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="assets/img/apple-icon.png">
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/templatemo.css">
    <link rel="stylesheet" href="assets/css/custom.css">

    <!-- Load fonts style after rendering the layout styles -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
    <link rel="stylesheet" href="assets/css/fontawesome.min.css">
    
    <script src="assets/js/jquery-1.11.0.min.js"></script>
    <script src="assets/js/jquery-migrate-1.2.1.min.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/templatemo.js"></script>
    <script src="assets/js/custom.js"></script>
</head>
<style>
	.myP-main{
		border-bottom: 3px solid green;
		text-align: center;
		padding-bottom: 10px; 
	}
	.list-text{
		font-size: 13px !important;
	}
	.title{margin-bottom: 5px;}
	.myP-pag{margin-left: 30%;}
	.myP-pag1{margin-left: 30%;}
	.review-img{text-align: center;}
	.review-content{
		padding-top: 10px;
		padding-bottom: 10px;
		border: 1px solid black;
		margin-top: 5px;
	}
	.review-btn{
		border-radius: 5px;
		background-color: rgb(15, 103, 86);
		color: white;
		font-size: 13px !important;
	}
	.content-div{margin-bottom: 10px;}
	#centerDiv{display:inline-block; width:70%;}
	#titleH3{text-align: center;}
	.contentRowDiv{padding-left: 20px;}
	.tableTitle{height: 70px;}
	.tableStar{height: 50px;}
	.tableContent{height: 200px;}
	.tableBlank{height: 40px;}
	.tdImg{max-width: 100%; max-height:100%; }
	.titleTd{font-size: 30px;}
	.titleTd:hover{cursor:pointer; border-bottom: 1px solid black;}
	.underTitleTd{font-size: 23px;}
	.starSpan{color: green;}
	.dateTd{color: gray;}
	
	#pageDiv{text-align:center;}
</style>
<header>
    <%@ include file="../common/header.jsp" %>
</header>
<body>
    <!-- Start Content -->
    <div class="container py-5">
        <div class="row">
			<!-- 메뉴바 시작 -->
            <%@include file="menubar.jsp" %>
			<!-- 메뉴바 끝 -->
        	<div class="container" id="centerDiv">
        		<hr><br>
        		<h3 id="titleH3">나의 리뷰 관리</h3>
        		<br><hr><br>
				<div class="row contentRowDiv">
					<table>
						<%if(!list.isEmpty()){ %>
							<%for(int i = 0; i < list.size(); i++){ %>
								<tr>
									<td class="tableTitle" >
										<input type="hidden" id="pNum" value=<%=list.get(i).getProdNum() %>>
										<span class="titleTd"><%=list.get(i).getProdName()%>[<%=list.get(i).getRevTitle() %>]</span>
										<br>
										<span class="underTitleTd starSpan">
											<%if(list.get(i).getStar() == 0){ %>
												☆☆☆☆☆
											<%} else if(list.get(i).getStar() ==1){ %>
												★☆☆☆☆
											<%} else if(list.get(i).getStar() ==2){ %>
												★★☆☆☆
											<%} else if(list.get(i).getStar() ==3){ %>
												★★★☆☆
											<%} else if(list.get(i).getStar() ==4){ %>
												★★★★☆
											<%} else if(list.get(i).getStar() ==5){ %>
												★★★★★
											<%} %>
										</span>
										<span class="dateTd"><%=list.get(i).getRevDate() %> <small>작성됨</small></span>
										<br><br>
										<span><%=list.get(i).getRevContent() %></span>
									</td>
									<%for(int j = 0; j < img.size(); j++){ %>
										<%if(list.get(i).getReviewNum() == img.get(j).getImgBoardId()) {%>
											<td width="35%;">
												<img class="tdImg" src="<%=request.getContextPath()%>/img_upload/<%=img.get(j).getImgChange()%>">
											</td>
										<%} %>
									<%} %>
								</tr>
								<tr class="tableBlank">
									<td style="width:100%; font-weight:lighter;">-</td>
								</tr>
							<%} %>
						<%} %>
					</table>
					<!-- 페이징 시작 -->
					<div id="pageDiv">
						<!-- 맨 처음으로 -->
						<button onclick="location.href='<%=request.getContextPath()%>/reviewList.my?currentPage=1'" class="btn btn-outline-success">맨처음</button>
						<!-- 이전 페이지 -->
						<button onclick="location.href='<%=request.getContextPath() %>/reviewList.my?currentPage=<%=currentPage - 1%>'" id="beforeBtn" class="btn btn-outline-success">이전</button>
						<script>
							if(<%=currentPage%> <= 1){
								$("#beforeBtn").prop("disabled",true);
							};
						</script>
						<!-- 숫자 페이지 -->
						<%for(int p = startPage; p <= endPage; p++){ %>
							<%if(currentPage == p){ %>
								<button class="ansBtn btn btn-outline-success btn-sm" disabled><%=p %></button>
							<%} else { %>
								<button onclick="location.href='<%=request.getContextPath()%>/reviewList.my?currentPage=<%=p%>'" class="btn btn-outline-success"><%= p %></button>
							<%} %>
						<%} %>
						<!-- 다음 페이지 -->
						<button onclick="location.href='<%=request.getContextPath()%>/reviewList.my?currentPage=<%=currentPage + 1%>'" id="afterBtn" class="btn btn-outline-success">다음</button>
						<script>
				         	if(<%=currentPage%> >= <%=maxPage%>){
				         		$("#afterBtn").prop("disabled",true);
				         	}
				         </script>
						<!-- 맨끝 으로 -->
						<button onclick="location.href='<%=request.getContextPath() %>/reviewList.my?currentPage=<%=maxPage %>'" id="lastBtn"class="btn btn-outline-success">맨끝</button>
						<script>
				         	if(<%=currentPage%> >= <%=maxPage%>){
				         		$("#lastBtn").prop("disabled",true);
				         	}
				         </script>
					</div>
					<!-- 페이징 끝 -->
				</div>
	    	</div>
		</div>
	</div>
    <br><br><br>
</body>
<script>
	$(".titleTd").on("click",function(){
		var num = $(this).prev('input').val();
		location.href="<%=request.getContextPath()%>/productDetail.no?no=" + num;
	})
</script>
<footer>
	<%@ include file="../common/footer.jsp" %>
</footer>

</html>