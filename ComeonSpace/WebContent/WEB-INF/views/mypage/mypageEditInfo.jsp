<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="img.model.vo.Img, member.model.vo.Member"%>
<%
	Member m = (Member)request.getAttribute("member");
	Img img = (Img)request.getAttribute("img");
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Come on Space - 마이페이지</title>
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
	
	#btn_green{
		border-top-left-radius: 5px;
		border-top-right-radius: 5px;
		border-bottom-left-radius: 5px;
		border-bottom-right-radius: 5px;
		position: absolute;
		left: 60%;
		transform: translate(-50%, -50%);
	}
	#btn_green2{
		border-top-left-radius: 5px;
		border-top-right-radius: 5px;
		border-bottom-left-radius: 5px;
		border-bottom-right-radius: 5px;
		position: absolute;
		left: 65%;
		transform: translate(-50%, -50%);
	}
	
	#btn_group button{
		border: 1px; solid green;
		background-color: rgb(15, 103, 86);
		color: white;
		padding: 5px;
	}
	
	#btn_group button:hover{
		color: white;
		background-color: rgb(244,162,1);
		text-align: center;
	}
	
	#profileBox{
		width: 250px;
		height: 250px;
		border-radius: 30%;
		overflow: hidden;
		
		position: absolute;
		left: 50%;
		
		
	}
	
	.profile{
		width: 100%;
		height: 100%;
		object-fit: cover;
	}
	
	
</style>
<header>
	<%@ include file="../common/header.jsp" %>
</header>
<body>
    <br>
    <!-- Start Content -->
    <div class="container py-5">
        <div class="row">

   
			<%@ include file="menubar.jsp" %>
            <div class="col-lg-9">
                <div class="myP-main h2">
                    	마이페이지
                </div>
                <div class="row">
                	<div class="col-lg-1"></div>
        		    <div class="col-lg-8">
	      		    <form onsubmit="return sumbit();" method="post" encType="multipart/form-data" action="<%=request.getContextPath()%>/updateProfile.my">
        		    	<fieldset>
        		    		<div class="form-group" style="text-align: left"> 
      							<label for="InputEmail" class="form-label mt-4">이메일</label>
      							<input type="email" class="form-control" id="InputEmail" aria-describedby="emailHelp" name="userEmail" readonly value="<%=m.getUserEmail() %>"/>
      							<small id="emailHelp" class="form-text text-muted">이메일은 로그인시 사용됩니다.</small>
    						</div>
    						
   						   <div class="form-group">
								<fieldset disabled>
   								<label class="form-label" for="user_name">이름</label>
								<input class="form-control" id="user_name" type="text" value="<%= m.getUserName()%>" disabled/>
								</fieldset>
						   </div>
							   
						   <div class="form-group">
						   	<label for="InputPhone" class="form-label mt-4">전화번호</label>
						   	<input type="tel" class="form-control" name="userPhone" id="InputPhone" value="<%=m.getUserPhone()%>"/>
						   	<small id="phoneHelp" class="form-text text-muted">조건 : ( - )제외 입력</small>
						   </div>
						   <br>
	        				<div class="form-group">
	        					<label for="profileBox" class="form-label mt-4"></label>
	        					<%if(img != null){ %>
									<img src="<%=request.getContextPath()%>/img_upload/<%=img.getImgChange()%>" id='profileImg' width="250px" height="200px"/>        					
	        					<%} else {%>
	        						<img src="<%= request.getContextPath()%>/resources/image/defaultProfile.png" id='profileImg' width="250px" height="200px"/>
	        					<%} %>
	        				</div>
	        				
	        				<div class="form-group">
	      						<label for="formFile" class="form-label mt-3">프로필 사진 업로드</label>
	      						<input class="form-control" type="file" id="formFile" name="profileImgUpdate" onchange="changeImg(this)"/>
	    					</div>
	        				<div class="form-group has-success">
	  							<label class="form-label mt-3" for="inputValid">닉네임 설정</label>
	  							<input type="text" name="userNick" value=<%=m.getUserNic() %> class="form-control" id="inputNick"/>
	  							<div id="checkNickName"></div>
							</div>
							   
						   <br/><hr/><hr/>
							   
						   <div class="form-group">
						   	<label for="InputPassword" class="form-label mt-4">기존 비밀번호</label>
						   	<input type="password" name="userPwd" class="form-control" id="inputPassword" required placeholder="기존 비밀번호 입력"/>
						   	<div id="checkPwdResult"></div>
						   </div>
						   
						   <div class="form-group">
						   	<label for="InputNewPassword" class="form-label mt-4">새로운 비밀번호</label>
						   	<input type="password" class="form-control" id="inputnNew" name="newPwd" onchange="pwd();" placeholder="새로운 비밀번호 입력"/>
						   	<div id="newPwdResult"></div>
						   </div>
							   
						   <div class="form-group">
						   	 <label for="confirmPassword" class="form-label mt-4">비밀번호 확인</label>
						   	 <input type="password" class="form-control" id="confirmPassword" placeholder="비밀번호 확인"/>
						   	 <div id="checkNewPwdResult"></div>
						   </div>
    							
   							<br/>
    							
  							<div id="btn_group">
   							<br/>
   								<button type="submit" id="btn_green">수정하기</button>
   								<button type="button" id="btn_green2">취소</button>
   							</div>
       			    	</fieldset>
        			</form>
        		 
                </div>
            </div>
        </div>
    </div>
    <br><br><br>
    <script>
    	//프로필 사진 수정시 미리보기
    	function changeImg(value){
    		if(value.files){
    			
	    		var reader = new FileReader();
	    		
	    		reader.onload = function(e){
	    			$("#profileImg").attr("src", e.target.result);
	    		}
	    		reader.readAsDataURL(value.files[0]);
    		}
    	}
    	checkPwd1 = true;
    	checkPwd2 = true;
    	// 새로운 비밀번호 정규표현식
    	function pwd(){
			var regExp = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{8,12}$/;

			var pwd1 = document.getElementById("inputnNew");
			var result = document.getElementById("newPwdResult");
			
			var check = regExp.test(pwd1.value);
			
			if(!check){
				result.innerHTML = "<sub>사용할 수 없는 비밀번호입니다.</sub><br>";
				result.style.color="red";
				checkPwd1 = false;
			} else {
				result.innerHTML = "<sub>사용 가능한 비밀번호입니다.</sub><br>";
				result.style.color="blue";
				checkPwd1 = true;
			}
			$("#confirmPassword").focus();
			
		}
    	
    	// 새로운 비밀번호확인
    	$("#confirmPassword").blur(function(){
    		var newPwd = $("#inputnNew").val();
    		var checkPwd = $(this).val();
    		var result ='';
    		if(newPwd == checkPwd){
    			result = '<sub>비밀번호가 일치합니다.</sub>';
    			$("#checkNewPwdResult").css("color","blue");
    			checkPwd2 = true;
    		} else {
    			result = '<sub>비밀번호가 일치하지 않습니다.</sub>';	
    			$("#checkNewPwdResult").css("color","red");
    			checkPwd2 = false;
    		}
    		
    		$("#checkNewPwdResult").html(result);
    	})
    	
    	
    	checkNick = false;
    	$(function(){
    		//닉네임 중복체크
    		$("#inputNick").change(function(){
				var check = $("#inputNick").val();
				$.ajax({
					url:"checkNick.me",
					data:{inputNick: check},
					success: function(data){
							var result = '';
							if(data == 0){
								result = "<sub>사용 가능한 닉네임입니다.</sub>";
								$("#inputNick").attr("class", "form-control is-valid");
								$("#checkNickName").css("color", "blue");
								checkNick=true;
							} else {
								result = "<sub>사용 불가능한 닉네임입니다.</sub>";
								$("#inputNick").attr("class", "form-control is-invalid");
								$("#checkNickName").css("color", "red");
								checkNick=false;
							}
							$("#checkNickName").html(result);
					},
					error: function(data){
					}
					
				});
			});
    		
    		checkPwd = false;
    		//기존 비밀번호 입력
    		$("#inputPassword").change(function(){
   				var check = $("#inputPassword").val();
    			$.ajax({
    				url:"checkPwd.me",
    				data:{checkPwd: check},
    				success: function(data){
    					var result = '';
   						if(data == 0){
							result = "<sub>기존 비밀번호와 일치하지 않습니다.</sub>";
							$("#inputPassword").attr("class", "form-control is-invalid");
							$("#checkPwdResult").css("color", "red");
							checkPwd=false;
							console.log("일치하지않음");
						} else {
							result = "<sub>기존 비밀번호와 일치합니다.</sub>";
							$("#inputPassword").attr("class", "form-control is-valid");
							$("#checkPwdResult").css("color", "blue");
							checkPwd=true;
							console.log("일치함");
						}
   						$("#checkPwdResult").html(result);
   						var test = $("#inputNick").val();
   						console.log(test);
    				}
    			});
    		});
    		
    	})
    	
    	function sumbit(){
    		if(checkPwd && checkPwd1 && checkPwd2 && checkNick){
    			return true;
    		} else if(!checkpwd){
    			alert("기존 비밀번호를 입력해주세요.");
    			$("#inputPassword").focus();
    			return false;
    		} else if(!checkPwd1){
    			alert("비밀번호 형식에 맞게 변경햊쉐요.");
    			$("#inputnNew").focus();
    			return false;
    		} else if(!checkPwd2){
    			alert("변경할 비밀번호를 확인해주세요.")
    			$("#confirmPassword").focus();
    			return false;
    		} else {
    			alert("닉네임 중복체크 해주세요.");
    			$("#inputNick").focus();
    			return false;
    		}
    		
    	}
    	
    </script>
</body>
<footer>
	<%@ include file="../common/footer.jsp" %>
</footer>

</html>