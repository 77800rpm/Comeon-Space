<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, order.model.vo.Order, common.pageInfo.model.vo.PageInfo"%>
<%
	ArrayList<Order> list = (ArrayList)request.getAttribute("list");

	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int noStartPage = pi.getStartPage();
	int noEndPage = pi.getEndPage();
	int noCurrentPage = pi.getCurrentPage();
	int noMaxPage = pi.getMaxPage();
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
    
    <link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&family=Jua&family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
	<!-- Start Script -->
    <script src="assets/js/jquery-1.11.0.min.js"></script>
    <script src="assets/js/jquery-migrate-1.2.1.min.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/templatemo.js"></script>
    <script src="assets/js/custom.js"></script>
    <!-- End Script -->
	
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

	.review-title{
		text-align: center;
	}
	
	.hr-height{
		height: 3px solid;
	}

	
	
	.td-menu{
    	background-color: #EAEAEA !important;
        font-weight: bold;
        text-align: center;
        width: 170px;
        height: 80px;
    }
    
    .td-content{
    	width: 800px;
    }
    
    .td-content-detail{
    	height: 150px;
    }
    
    .review-submit{
    	position: relative;
    	left: 450px;
    }
    
    td, th{
	    border: 1px solid lightgray;    
	    padding: 20px;	
    }
    
    table{
	    border: 2px solid lightgray;
	    border-collapse: collapse;
	    margin-left: auto;
   		margin-right: auto;
    }


	.td-pay{
		font-weight: 30px !important;
	}
	#pageDiv{text-align: center;}
	
</style>
<header>
	 <%@ include file="../common/header.jsp" %>
</header>
<body>
    <!-- Start Content -->
    <div class="container py-5">
        <div class="row">

			<%@ include file="menubar.jsp" %>

            <div class="col-lg-9">
                <div class="myP-main h2">
                    	마이페이지
                </div>
                <div class="container">
               		<br><br><hr><br>
               		<h3 class="review-title">판매 결제 내역</h3>
                	<br><hr><br>	
						<form name="체크박스" action="#">
						<button type="button" class="btn btn-success btn-sm" id="select-delete">선택 삭제</button>
						  <table class="table box" id="tableArea">
						    <thead class="thead-light mytable-color">
						      <tr>
						        <th><input type="checkbox" class="checkbox-select" value="something"></th>
						        <th width="10%">번호</th>
						        <th width="15%">구매 일자</th>
						        <th width="50%">구매 상품 정보</th>
						        <th width="15%">결제 금액</th>
						        <th width="10%">비고</th>
						      </tr>
						    </thead>
						    <tbody>
						    	<%if(!list.isEmpty()){ %>
							      <%for(Order o : list){ %>
								      <tr>
								        <td class="hh-content"><input type="checkbox" name="selectCheck" class="checkbox-select" value="<%=o.getOrderNum()%>"></td>
								      	<td class="hh-content"><%= o.getOrderNum() %></td>
								        <td class="hh-content"><%=o.getOrderDate() %></td>
								        <td style="width:400px;">
								        	<p style="color: #0f6756; font-size: 105%; font-weight: bold"><%=o.getProdName() %></p>
											<p>구매자 : <%=o.getBuyerName() %></p>
								        </td>
								        <td class="hh-content"><%=o.getTotalPrice() %></td>
								        <td class="hh-content"><input type="button" class="salesDetailBtn" value="상세보기"></td>
								      </tr>
							      <%} %>
						    	<%} else {%>
						    		<tr>
										<td colspan="6" style="text-align:center;">판매내역이 없습니다.</td>
						    		</tr>
						    	<%} %>
						    </tbody>
						  </table>
						  <!-- 페이징 시작 -->
							<div id="pageDiv">
								<!-- 맨 처음으로 -->
								<button onclick="location.href='<%=request.getContextPath()%>/qnaList.my?currentPage=1'" class="btn btn-outline-success">맨처음</button>
								<!-- 이전 페이지 -->
								<button onclick="location.href='<%=request.getContextPath() %>/qnaList.my?currentPage=<%=noCurrentPage - 1%>'" id="beforeBtn" class="btn btn-outline-success">이전</button>
								<script>
									if(<%=noCurrentPage%> <= 1){
										$("#beforeBtn").prop("disabled",true);
									};
								</script>
								<!-- 숫자 페이지 -->
								<%for(int p = noStartPage; p <= noEndPage; p++){ %>
									<%if(noCurrentPage == p){ %>
										<button disabled><%=p %></button>
									<%} else { %>
										<button onclick="location.href='<%=request.getContextPath()%>/qnaList.my?currentPage=<%=p%>'" class="btn btn-outline-success"><%= p %></button>
									<%} %>
								<%} %>
								<!-- 다음 페이지 -->
								<button onclick="location.href='<%=request.getContextPath()%>/qnaList.my?currentPage=<%=noCurrentPage + 1%>'" id="afterBtn" class="btn btn-outline-success">다음</button>
								<script>
						         	if(<%=noCurrentPage%> >= <%=noMaxPage%>){
						         		$("#afterBtn").prop("disabled",true);
						         	}
						         </script>
								<!-- 맨끝 으로 -->
								<button onclick="location.href='<%=request.getContextPath() %>/qnaList.my?currentPage=<%=noMaxPage %>'" id="lastBtn"class="btn btn-outline-success">맨끝</button>
								<script>
						         	if(<%=noCurrentPage%> >= <%=noMaxPage%>){
						         		$("#lastBtn").prop("disabled",true);
						         	}
						         </script>
							</div>
							<!-- 페이징 끝 -->
						 </form>
					<br>
					</div>
            </div>

        </div>
    </div>

</body>
<script>
	$("#tableArea input[type=button]").on("click",function(){
		var num = $(this).parent().parent().children().eq(1).text();
		location.href="<%= request.getContextPath()%>/salesDetail.my?no="+num;
	})
</script>
<footer>
	<%@ include file="../common/footer.jsp" %>
</footer>
</html>