<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String buyerName = (String)request.getAttribute("buyerName");
	String prodName = (String)request.getAttribute("prodName");
	int prodNum = (int)request.getAttribute("prodNum");
	int orderNum = (int)request.getAttribute("orderNum");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Comeon Space - 리뷰 작성하기</title>
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
<style>

.insert {
  padding: 20px 30px;
  display: block;
  width: 600px;
  margin: 5vh auto;
  height: 90vh;
  border: 1px solid #dbdbdb;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
}
.insert .title {
  border: 1px solid #dbdbdb;
  padding: 5px 7px;
  font-size: 16px;
  display: block;
  width: 100%;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
}
.insert .content {
  border: 1px solid #dbdbdb;
  padding: 5px 7px;
  font-size: 16px;
  display: block;
  width: 100%;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;

  margin-top: 15px;
  resize: none;
  height: 50vh;
}
.insert .file-hidden-list {
  height: 0;
  overflow: hidden;
}
.insert .file-list {
  height: 130px;
  overflow: auto;
  border: 1px solid #989898;
  text-align: center;
}
.insert .file-list .thumbnail {
  width: 20%;
  float: left;
  position: relative;
  margin-top: 20px;
  color: #555;
  text-align: center;
  padding: 20px 0px;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
}
.insert .file-list .thumbnail i {
  font-size: 50px;
}
.insert .file-list .thumbnail p {
  font-size: 14px;
  margin-top: 10px;
}
.insert .file-list .thumbnail .delete i{
  position: absolute;
  font-size: 14px;
  top: 0;
  right: 0;
  color: #ff5353;
}
#endDiv{clear:both;}
#starSelect{color:green; font-size: 17px; padding: 2px; border-radius: 40px; }
#submitBtn{margin-left:60px;}
</style>
</head>
<header>
	<%@ include file="../common/header.jsp" %>
</header>
<body>
    <!-- Start Content -->
    <div class="container py-5">
        <div class="row">
			<!-- 메뉴바 시작 -->
            <%@include file="../mypage/menubar.jsp"%>
			<!-- 메뉴바 끝 -->
            <div class="col-lg-9">
            	<hr><br>
                <div class="myP-main h2" style="text-align:center;">
                    	리뷰 작성하기
                </div>
                <br><hr><br>
                <div class="row">
                	<div class="insert">
						<p><%=buyerName %> 님의  '<%=prodName %>' 후기 작성</p>
					  	<form action="<%=request.getContextPath()%>/insertReview.re" method="post" enctype="multipart/form-data">
							<label>별점 평가 : </label>
							<select id="starSelect" name="star">
								<option value="0" style="color:green;">☆☆☆☆☆</option>
								<option value="1" style="color:green;">★☆☆☆☆</option>
								<option value="2" style="color:green;">★★☆☆☆</option>
								<option value="3" style="color:green;" selected>★★★☆☆</option>
								<option value="4" style="color:green;">★★★★☆</option>
								<option value="5" style="color:green;">★★★★★</option>
							</select>
							<br><br>
						    <input class="title" type="text" name="revTitle" placeholder="제목"/>
						    <textarea class="content" name="revContent" placeholder="후기(100자 이내로 작성해주세요!)"></textarea>
						    <br>
						    <label>사진 선택 : &nbsp;</label><input type="file" name="uploadFile" accept=".jpg, .png">
							<br><br><br>
						    <input type="hidden" name="prodName" value="<%=prodName%>" />
						    <input type="hidden" name="buyerName" value="<%=buyerName%>" />
						    <input type="hidden" name="prodNum" value="<%=prodNum%>" />
						    <input type="hidden" name="orderNum" value="<%=orderNum%>" /><br><br>
							<input style="width: 30%" type="submit" class="btn btn-success btn-lg btn-reserv" id="submitBtn" name="submit" value="작성 완료">
					   </form>
					</div>
                </div>
                
            </div>

        </div>
    </div>
<div id="endDiv"></div>
<br><br><br>
</body>
<footer>
	<%@ include file="../common/footer.jsp" %>
</footer>
</html>