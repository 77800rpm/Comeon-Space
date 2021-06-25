<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/templatemo.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
<link rel="stylesheet" href="assets/css/fontawesome.min.css">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>공간 등록하기</title>

<style>
	/* 마지막에 submit 버튼 디자인 */
	#button{background: rgb(15, 103, 86); color: white; border: none; padding: 12px 30px; border-radius:40px; font-weight:bold !important;}
	
	/* 기본 화면 설계 디자인 */
	label{font-size: 13.5px !important; font-weight: bold !important;}
	hr{opacity:1;}
	h5{font-weight: bold !important;}
	input{ font-size: 0.9em !important;}
	::placeholder{ font-size: 0.9em;}
	textarea{font-size: 0.8em !important;}
	p{font-size: 0.9em !important;}
	#small{font-size: 12px;}
	.adressInput{display: inline-block; width: 75%;}
	.adressButton{display: inline-block;}
	
	/* 입력할 부분 클릭 시, 겉에 태두리 생기는 부분*/
	.form-control:focus{color:#212529;background-color:#fff;border-color:rgb(15, 103, 86, 30);outline:0;box-shadow:0 0 0 .1rem rgb(15, 103, 86, 30)}
	
	/* 버튼 클릭 (편의시설/정기휴무일) 디자인 */
	.btn-primary{color:DimGrey; background-color:white; border-color:lightgray;}
	.btn-primary:hover{color:white; background-color:rgb(15, 103, 86); border-color:rgb(15, 103, 86);}
	input[type=checkbox]:checked + label {color:white; background-color:rgb(15, 103, 86);}
	
	/*체크박스를 다 안보이게*/
	input[type=checkbox]{display:none;}
	.detailDiv{display:inline-block;}
	.detailDiv:hover{cursor:pointer;}
	.hiddenBtn{display:none;}

</style>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	<!-- 공간 등록하기 title 시작 -->
	<br><br>
	<div class="container">
		<div class="row text-center">
			<h1>공간 등록하기</h1>
			<p>Register Space</p>
		</div>
	</div>
	<!-- 공간 등록하기 title 끝 -->
	
	<br>

<form onsubmit="return imgCheck();" action="<%=request.getContextPath()%>/enroll.en" method="post" encType="multipart/form-data">
	<!-- 기본 정보 입력 -->
	<div class="container">
		<div class="col-md-7 m-auto">
			<h5>기본 정보</h5>
			<hr style="border:solid; color:rgb(15, 103, 86);">
			<div class="row">
				<div class="col-md-9 mb-3">
					<label>공간 명</label>
					<input type="text" class="form-control mt-1" id="name" name="name" placeholder="공간 명을 입력해주세요" required>
				</div>
				<div class="col-md-3 mb-3">
					<label>수용인원</label>
					<input type="number" class="form-control mt-1" id="number" name="number" value="0" required>
				</div>
			</div>
			<div class="row">
				<div class="col-md-9 mb-3">
					<label>공간 한 줄 소개</label>
					<input type="text" class="form-control mt-1" id="short_Exp" name="short_Exp" placeholder="한 줄로 공간을 소개해주세요" required>
				</div>
				<div class="col-md-3 mb-3">
					<label>카테고리</label><br>
					<select name="category" class="form-control mt-1">
						<option value="오피스">오피스</option>
						<option value="스터디룸">스터디룸</option>
						<option value="공연장">공연장</option>
						<option value="주방">주방</option>
						<option value="스튜디오">스튜디오</option>
						<option value="다목적홀">다목적홀</option>
						<option value="회의실">회의실</option>
					</select>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 mb-3">
					<label>공간 상세 소개</label>
					<textarea class="form-control mt-1" id="long_Exp" name="long_Exp" placeholder="공간에 대해 상세히 소개해주세요" rows="7" required></textarea>
				</div>
				<div id="testDiv">
				</div>
			</div>
			<div class="row">
				<div class="mb-3">
				<label class="mb-2">편의시설</label><br>
					<input type="checkbox" id="chk1" value="TV" name="facility"/>
					<label for="chk1" class="btn btn-primary">TV</label>
					<input type="checkbox" id="chk2" value="빔 프로젝트" name="facility"/>
					<label for="chk2" class="btn btn-primary">빔 프로젝트</label>
					<input type="checkbox" id="chk3" value="마이크" name="facility"/>
					<label for="chk3" class="btn btn-primary">마이크</label>
					<input type="checkbox" id="chk4" value="주차공간" name="facility"/>
					<label for="chk4" class="btn btn-primary">주차공간</label>
					<input type="checkbox" id="chk5" value="내부 화장실" name="facility"/>
					<label for="chk5" class="btn btn-primary">내부 화장실</label>
					<input type="checkbox" id="chk6" value="PC/노트북" name="facility"/>
					<label for="chk6" class="btn btn-primary">PC/노트북</label>
					<input type="checkbox" id="chk7" value="금연" name="facility"/>
					<label for="chk7" class="btn btn-primary">금연</label>
					<input type="checkbox" id="chk8" value="취사시설" name="facility"/>
					<label for="chk8" class="btn btn-primary">취사시설</label>
					<input type="checkbox" id="chk9" value="복사/인쇄기" name="facility"/>
					<label for="chk9" class="btn btn-primary">복사/인쇄기</label>
					<input type="checkbox" id="chk10" value="화이트보드" name="facility"/>
					<label for="chk10" class="btn btn-primary">화이트보드</label>
					<input type="checkbox" id="chk11" value="전신거울" name="facility"/>
					<label for="chk11" class="btn btn-primary">전신거울</label>
					<input type="checkbox" id="chk12" value="의자/테이블" name="facility"/>
					<label for="chk12" class="btn btn-primary">의자/테이블</label>
					<input type="checkbox" id="chk13" value="공용라운지" name="facility"/>
					<label for="chk13" class="btn btn-primary">공용라운지</label>
					<input type="checkbox" id="chk14" value="테라스/루트탑" name="facility"/>
					<label for="chk14" class="btn btn-primary">테라스/루트탑</label>
					<input type="checkbox" id="chk15" value="탈의실" name="facility"/>
					<label for="chk15" class="btn btn-primary">탈의실</label>
					<input type="checkbox" id="chk16" value="반려동물 동반가능" name="facility"/>
					<label for="chk16" class="btn btn-primary">반려동물 동반가능</label>
					<input type="checkbox" id="chk17" value="음식물 반입가능" name="facility"/>
					<label for="chk17" class="btn btn-primary">음식물 반입가능</label>
				</div>
			</div>
		</div>
		
		<br><br>
		
		<!-- 위치 정보 입력 -->
		<div class="col-md-7 m-auto">
			<h5>위치 정보</h5>
			<hr style="border: solid; color:rgb(15, 103, 86);">
			<div class="row">
				<div class="col-md-10 mb-3">
					<label>주소 (위치)</label><br>
					<input type="text" id="sample6_postcode" name="address1" readonly class="form-control mt-1 adressInput" placeholder="우편번호" required>&nbsp;&nbsp;&nbsp;
					<input type="button" onclick="sample6_execDaumPostcode()" class="adressButton" value="우편번호 찾기" required><br>
					<input type="text" id="sample6_address" name="address2" class="form-control mt-1" placeholder="주소" required><br>
					<input type="text" id="sample6_detailAddress" name="address3" class="form-control mt-1" placeholder="상세주소" required>
					<input type="hidden" id="sample6_extraAddress" class="form-control"placeholder="참고항목">
				</div>
			</div>
		</div>	
		<br><br>
		
		<!-- 이미지등록 입력 -->
		<div class="col-md-7 m-auto">
			<h5>이미지 등록</h5>
			<hr style="border: solid; color:rgb(15, 103, 86);">
			<div class="row">
				<div class="col-md-12 mb-3">
					<label>메인 이미지</label><br>
				</div>
				<div id="titleImgArea" class="detailDiv">
					<img id="titleImg" width="200" height="150">
				</div>
			</div>
			<br>
			<div class="row">
				<div class="col-md-12 mb-3" >
					<label>상세 이미지</label><br><br>
					<div id="contentImgArea1" class="detailDiv">
						<img id="contentImg1" width="200" height="150"> 
					</div>
					<div id="contentImgArea2" class="detailDiv">
						<img id="contentImg2" width="200" height="150"> 
					</div> 
					<div id="contentImgArea3" class="detailDiv">
						<img id="contentImg3" width="200" height="150"> 
					</div>
				</div>
				<!-- 파일 업로드 하는 부분 -->
				<div id="fileArea">
					<input type="file" id="img1" name="img1" class="hiddenBtn" onchange="LoadImg(this,1)" required>
					<input type="file" id="img2" name="img2" class="hiddenBtn" onchange="LoadImg(this,2)" required>
					<input type="file" id="img3" name="img3" class="hiddenBtn" onchange="LoadImg(this,3)" required>
					<input type="file" id="img4" name="img4" class="hiddenBtn" onchange="LoadImg(this,4)" required>
				</div>
			</div>
		</div>
		
		<br><br>
		
		<!-- 이용 정보 입력 -->
		<div class="col-md-7 m-auto">
			<h5>이용 정보</h5>
			<hr style="border: solid; color:rgb(15, 103, 86);">
			<div class="row">
<!-- 				<div class="col-md-3 mb-3"> -->
<!-- 					<label>이용 시간</label> -->
<!-- 					<input type="time" class="form-control mt-1" id="startTime" name="startTime" required> -->
<!-- 				</div> -->
<!-- 				<div class="col-md-1 mb-3"> -->
<!-- 					<br> -->
<!-- 					<p class="text-center">~</p> -->
<!-- 				</div> -->
<!-- 				<div class="col-md-3 mb-3"> -->
<!-- 					<label></label> -->
<!-- 					<input type="time" class="form-control mt-1" id="lastTime" name="lastTime" required> -->
<!-- 				</div> -->
<!-- 				<div class="col-md-1 mb-3"> -->
<!-- 				</div> -->
				<div class="col-md-4 mb-3">
					<label>1일 비용</label>
					<input type="number" class="form-control mt-1" id="money" name="money" required>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<label class="mb-2">정기휴무일</label><br>
					<input type="checkbox" id="holiday_check1" value="월" name="holiday"/>
					<label for="holiday_check1" class="btn btn-primary">월</label>
					<input type="checkbox" id="holiday_check2" value="화" name="holiday"/>
					<label for="holiday_check2" class="btn btn-primary">화</label>
					<input type="checkbox" id="holiday_check3" value="수" name="holiday"/>
					<label for="holiday_check3" class="btn btn-primary">수</label>
					<input type="checkbox" id="holiday_check4" value="목" name="holiday"/>
					<label for="holiday_check4" class="btn btn-primary">목</label>
					<input type="checkbox" id="holiday_check5" value="금" name="holiday"/>
					<label for="holiday_check5" class="btn btn-primary">금</label>
					<input type="checkbox" id="holiday_check6" value="토" name="holiday"/>
					<label for="holiday_check6" class="btn btn-primary">토</label>
					<input type="checkbox" id="holiday_check7" value="일" name="holiday"/>
					<label for="holiday_check7" class="btn btn-primary">일</label>
				</div>
			</div>
		</div>
		
		<br><br>
			
		<!-- 등록 버튼 -->
		<div class="col-md-8 m-auto text-center">
			<input type="submit" id="button" onclick="imgCheck();" value="공간 등록 완료">
		</div>
		
	</div> <!-- container 태그 -->
	<br><br><br><br>
</form>

<%@ include file="../common/footer.jsp" %>
	<br><br>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	// 우편주소 넣기
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
	img1 = false;
	img2 = false;
	img3 = false;
	img4 = false;
	
    $("#titleImgArea").click(function(){
		$("#img1").click();
	});
	$("#contentImgArea1").click(function(){
		$("#img2").click();
	});
	$("#contentImgArea2").click(function(){
		$("#img3").click();
	});
	$("#contentImgArea3").click(function(){
		$("#img4").click();
	});
	
	function LoadImg(value, num){
		if(value.files && value.files[0]){
			var reader = new FileReader();
			
			reader.onload = function(e){								
				switch(num){
				case 1: 
					$("#titleImg").attr("src", e.target.result);
					img1 = true;
					break;
				case 2:
					$("#contentImg1").attr("src", e.target.result);
					img2 = true;
					break;
				case 3: 
					$("#contentImg2").attr("src", e.target.result);
					img3 = true;
					break;
				case 4:
					$("#contentImg3").attr("src", e.target.result);
					img4 = true;
					break;
				}
			}
			
			reader.readAsDataURL(value.files[0]); //첫 번째, 0번째만 들어가게 하겠다
		}
	}
	
	function imgCheck(){
		if(img1==false||img2==false||img3==false||img4==false){
			alert("사진을 모두 등록해주세요.");
			return false;
		} else {
			return true;
		}
		
	}
	
	</script>
</body>
</html>