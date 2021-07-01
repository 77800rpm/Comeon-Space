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
<title>Insert title here</title>

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

</style>
</head>
<body>


<div class="insert">
<p><%=buyerName %> 님의 <%=orderNum %>번째 예약 '<%=prodName %>' 후기 작성</p>

  <form action="<%=request.getContextPath()%>/insertReview.re" method="post" enctype="multipart/form-data">
    <input class="title" type="text" name="revTitle" placeholder="제목"/>
    <textarea class="content" name="revContent" placeholder="후기(100자 이내로 작성해주세요!)"></textarea>
    <label>사진 선택 : </label><input type="file" name="uploadFile" accept=".jpg, .png">
	<br><br><br><br><br><br>
    <input type="hidden" name="prodName" value="<%=prodName%>" />
    <input type="hidden" name="buyerName" value="<%=buyerName%>" />
    <input type="hidden" name="prodNum" value="<%=prodNum%>" />
    <input type="hidden" name="orderNum" value="<%=orderNum%>" />
	<input style="width: 30%" type="submit" class="btn btn-success btn-lg btn-reserv" name="submit" value="작성 완료!"></button>
   </form>
</div>

</body>
</html>