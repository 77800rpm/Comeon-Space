<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body onload="inputValue();">
	<b>아이디 중복 검사</b>
	<br>
	<form action="<%= request.getContextPath() %>/checkEmail.me" id="emailCheckForm">
		<input type="text" id="inputEmail" name="inputEmail">
		<input type="submit" value="중복확인"/>
	</form>
	
	<br>
	
	  <%
	     Integer result = (Integer)request.getAttribute("result");
	     if(result != null){
	        if(result > 0){
	  %>
	           이미 사용 중인 아이디 입니다.            
	  <%       
	        } else {
	  %>
	           사용 가능한 아이디입니다.
	  <%   
	        }
	     }
	  %>
	
	<br>
	<br>
	
	<input type="button" id="usedEmail" value="확인">
	<input type="button" id="cancel" value="취소" onclick="window.close();">

	<script>
		function inputValue(){
			// 부모 화면에서 입력한 데이터를 가져오기
			// 부모화면에 접근하기 : opener
			// joinFrom : 부모 form의 name. form태그안에 들어가기 위해서 form의 id가 아닌 name을 사용함
			// joinUserId : id입력 input태그의 name 
// 			document.getElementById("inputId").value = opener.document.joinForm.joinUserId.value

			if('<%=request.getAttribute("checkedEmail") %>' == 'null'){
				document.getElementById("inputEmail").value = opener.document.signUpForm.userEmail.value;
			} else {
				document.getElementById("inputEmail").value = '<%= (String)request.getAttribute("checkedEmail") %>';
			}
		}
		
		document.getElementById("usedEmail").onclick=function(){
			opener.document.signUpForm.userEmail.value = document.getElementById("inputEmail").value;
			self.close();
		};
	</script>
</body>
</html>