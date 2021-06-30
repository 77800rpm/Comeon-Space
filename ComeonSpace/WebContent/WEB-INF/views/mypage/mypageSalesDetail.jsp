<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, order.model.vo.Order"%>
<%
	Order order = (Order)request.getAttribute("order");
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
	#btnDiv{text-align: center;}
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
                <div>
                	
                	<br><br><hr><br>
                	<h3 class="review-title">판매 결제 내역</h3>
                	<br><hr><br>	
	            
					  <table class="table2">
					    
					    <tbody>
			    			<tr>
			    				<td class="td-menu">상품 명</td>
			    				<td class="td-content"><%=order.getProdName() %></td>
			    			</tr>
			    			<tr>
			    				<td class="td-menu" >상세 내용</td>
			            		<td class="td-content td-content-detail">
					            		<%=order.getRevDate() %><br>
					            		인원　:　5 명
			            		</td>
			    			</tr>
			    			<tr>
					        	<td class="td-menu" >결제 금액</td>
					            <td class="td-content">
									<span>총 </span> <span style="color: #0f6756; font-size: 150%; font-weight: bold"><%=order.getTotalPrice() %></span>
									<span> 원</span>
					            </td>
					        </tr>
					        <tr>
					        	<td class="td-menu" >결제 일시</td>
					        	<td><%=order.getRevDate() %></td>
					        </tr>
					        <tr>
					        	<td class="td-menu" >결제 수단</td>
					        	<td>카카오 페이</td>
					        </tr>
					    </tbody>
					    
					  </table>
					  <br>
					  <div id="btnDiv">
					  	<input type="button" value="목록으로" id="backBtn" onclick="location.href='javascript:history.go(-1)'">
					  </div>
					  <br>
					  
					  <br><br>
                </div>

            </div>

        </div>
    </div>


    
</body>
<footer>
	<%@ include file="../common/footer.jsp" %>
</footer>
</html>