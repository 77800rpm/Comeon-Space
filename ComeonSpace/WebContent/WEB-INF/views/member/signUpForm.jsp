<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String emailMsg = (String)request.getAttribute("msg"); %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>회원가입</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="assets/img/apple-icon.png">
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/templatemo.css">
    <link rel="stylesheet" href="assets/css/custom.css">

    <!-- Load fonts style after rendering the layout styles -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
    <link rel="stylesheet" href="assets/css/fontawesome.min.css">

        
</head>
<style>
	.regBtn{display: inline-block;}
	.btn-block{text-align:center;}
	.h2-div{color: rgb(15, 103, 86);}
 	#hostEnroll{display: none;}
	.fileBtn{width: 60%; margin-bottom: 7px;}
	#errLast{display: inline-block;}
	
	
</style>
<body>
    <div class="container ">
	<div class="row ">
        <div class="col-md-6 center-block">
            <form onsubmit="return signUp();" action="<%=request.getContextPath() %>/signUp.do" method="post" id="signUpForm" name="signUpForm" role="form">
            <h2 class="text-center h2-div font-div">Comeon Space</h2><br>
            <fieldset><legend class="text-center font-div">회원가입<span class="req"></span></legend>

            <div class="form-group">
            <label for="email"><span class="req">* </span> 이메일 : </label><br>
                    <input required type= "email" name="userEmail" id="userEmail" class="form-control" placeholder="이메일을 입력해주세요"/>
                    <div id="resultMsg3"></div>
            </div>

            <div class="form-group">
                <label for="password"><span class="req">* </span> 비밀번호: </label>
                    <input required name="userPwd" type="password" class="form-control inputpass" id="pass1" placeholder="8~12자 숫자,영문,조합" onblur="pwd();"/>
                    	<div id="resultMsg"></div>

                <label for="password"><span class="req">* </span> 비밀번호 확인: </label>
                    <input required name="checkPwd" type="password" class="form-control inputpass" id="pass2" placeholder="비밀번호 확인" onblur="checkP();"/>
                        <div id="resultMsg2"></div>
            </div>
            
            <div class="form-group"> 	 
                <label for="firstname"><span class="req">* </span> 이름 : </label>
                    <input class="form-control" type="text" name="userName" id = "userName" required /> 
                        <div id="errFirst"></div>    
            </div>

            <div class="form-group">
                <label for="lastname"><span class="req">* </span> 닉네임 : </label><br>
                    <input class="form-control" type="text" name="userNic" id = "userNic" required />  
                        <div id="resultMsg4"></div>
            </div>

            <div class="form-group">
                <label for="phone"><span class="req">* </span> 핸드폰 번호: </label> 
                    <input class="form-control" required type="tel" name="userPhone" id = "usrePhone" maxlength="11" placeholder="'-'제외하고 입력해주세요"/>   
            </div>
           
            <div class="form-group center-block">
                <input type="radio" name="userDiv" id="guestCheck" value="guest" checked>게스트&nbsp;&nbsp;
                <input type="radio" name="userDiv" id="hostCheck" value="host">호스트
            </div>
			
			<div class="form-group host-enroll" id="hostEnroll">
				<label>* 통장 사본 :</label>&nbsp;&nbsp;<input type="file" name="bankCopy" class="d-inline fileBtn" id="bankCopy" multiple><br><br>
				<label>*사업자 등록증 :</label>&nbsp;&nbsp;<input type="file" class="d-inline fileBtn" id="enrollImg" name="hostEnroll" multiple>
			</div>
			
            <div class="form-group">
                <hr>

                <input type="checkbox" required name="agreeBtn"> 회원가입에 동의합니다.
            </div>

            <div class="form-group btn-block">
                <input class="btn btn-success center-block regBtn" accept="image/jpeg, image/png,.txt" type="submit" name="submit_reg" value="가입하기" onclick="signUp();">
                <input class="btn btn-success center-block regBtn" accept="image/jpeg, image/png,.txt" type="button" name="cancel" value="취소">
            </div>
            </fieldset>
            </form><!-- ends register form -->

        </div><!-- ends col-6 -->
	</div>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="assets/js/jquery-1.11.0.min.js"></script>
    <script src="assets/js/jquery-migrate-1.2.1.min.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/templatemo.js"></script>
    <script src="assets/js/custom.js"></script>
	<script>
		hostEnroll = false;
		checkPwd1 = false;
		checkPwd2 = false;
		checkEmail = false;
		checkNick = false;
		
		$(function(){
			$("input:radio[name=userDiv]").click(function(){
				if($("input:radio[name=userDiv]:checked").val() == "host"){
					$("#hostEnroll").css("display","inline");
					hostEnroll = true;
				} else {
					$("#hostEnroll").css("display","none");
					hostEnroll = false;
				}
			});
			
			$("input:button[name=cancel]").click(function(){
				location.href="<%= request.getContextPath() %>";
			});
			// 이메일 중복체크
			$("#userEmail").blur(function(){
				var check = $("#userEmail").val();
				$.ajax({
					url:"checkEmail.me",
					data:{inputEmail: check},
					success: function(data){
							var result = '';
							if(data == 0){
								result = "<sub>사용 가능한 이메일입니다.</sub>";
								$("#resultMsg3").css("color", "blue");
								checkEmail=true;
							} else {
								result = "<sub>사용 불가능한 이메일입니다.</sub>";
								$("#resultMsg3").css("color", "red");
							}
							$("#resultMsg3").html(result);
					},
					error: function(data){
						console.log("실패");
					}
					
				});
			});
			// 닉네임 중복체크
			$("#userNic").blur(function(){
				var check = $("#userNic").val();
				$.ajax({
					url:"checkNick.me",
					data:{inputNick: check},
					success: function(data){
							var result = '';
							if(data == 0){
								result = "<sub>사용 불가능한 닉네임입니다.</sub>";
								$("#resultMsg4").css("color", "blue");
								checkNick=true;
							} else {
								result = "<sub>사용 불가능한 닉네임입니다.</sub>";
								$("#resultMsg4").css("color", "red");
							}
							$("#resultMsg4").html(result);
					},
					error: function(data){
						console.log("실패");
					}
					
				});
			});
			
		})
		
		function pwd(){
			var regExp = /^[a-zA-Z0-9]{8,12}$/;
			var pwd1 = document.getElementById("pass1");
			var result = document.getElementById("resultMsg");
			
			var check = regExp.test(pwd1.value);
			
			if(!check){
				result.innerHTML = "<sub>사용할 수 없는 비밀번호입니다.</sub><br>";
				result.style.color="red";
			} else {
				result.innerHTML = "<sub>사용 가능한 비밀번호입니다.</sub><br>";
				result.style.color="blue";
				checkPwd1 = true;
			}
			
		}
		
		function checkP(){
			var pwd1 = document.getElementById("pass1");
			var pwd2 = document.getElementById("pass2");
			var result = document.getElementById("resultMsg2");
			
			if(pwd1.value == pwd2.value){
				result.style.color = "blue";
				result.innerHTML = "<sub>비밀번호가 일치합니다.</sub><br>";
				checkPwd2 = true;
			} else {
				result.style.color = "red";
				result.innerHTML = "<sub>비밀번호가 일치하지 않습니다.</sub><br>";
			}
			
		}
		
		function signUp(){
			if(hostEnroll && checkPwd1 && checkPwd2 && checkEmail && checkNick){
				if(document.getElementById("bankCopy").value != "" && document.getElementById("enrollImg").value != ""){
// 					console.log(document.getElementById("bankCopy").files); fileList의 length
					return true;
				} else {
					alert("사진파일을 등록해주세요.");
					return false;
				}
			} else if(!hostEnroll && checkPwd1 && checkPwd2 && checkEmail && checkNick){
				return true;
			} else if(!checkPwd1 || !checkPwd2){
					alert("회원가입 양식에 맞게 입력해주세요.");
					if(!checkPwd1) $("#pass1").focus();
					else if(!checkPwd2) $("#pass2").focus();
					return false;
			} else if(!checkEmail){
					alert("이메일 중복확인 해주세요.");
					$("#userEmail").focus();
					return false;
			} else if(!checkNick){
					alert("닉네임 중복화인 해주세요.");
					$("#userNic").focus();
					return false;
			} 
			
		}
	</script>		
		
	
    <!-- End Script -->
</body>

</html>