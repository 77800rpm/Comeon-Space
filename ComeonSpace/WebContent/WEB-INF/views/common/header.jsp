<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member, img.model.vo.Img"%>
<% Member loginUser = (Member)session.getAttribute("loginUser");
   Member profile = (Member)request.getAttribute("profile"); 
   Img pImg = (Img)request.getAttribute("profileImg"); %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="assets/css/style.css">
<script class="cssdeck" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>

<!-- 검색 기능 및 페이지 연결 필요 -->

<style>

    *{font-family: 'jua', sans-serif; !important}
    a, p, h1, h2, h3{font-family: 'jua', sans-serif; !important}


.progress {
	height: 10px;
	overflow: hidden; 
	background-color: #f5f5f5; 
	border-radius: 1px; 
	-webkit-box-shadow: inset 0 1px 2px rgb(0 0 0 / 10%); 
	box-shadow: inset 0 1px 2px rgb(0 0 0 / 10%);}
.prog-bar {
	float: left; width: 0%; height: 100%; 
	font-size: 12px; line-height: 39px; 
	color: #fff; text-align: center; 
	background-color: #337ab7; 
	-webkit-transition: width .6s ease; /* keyframe 사용으로 Animation 효과도 줄 수 있다. */
	-o-transition: width .6s ease;} 
.col_success {background-color: rgb(15, 103, 86);}


	.bar-menu{color: #0f6756; font-weight: bold;}
	#logoImg{width: 60px; height: auto;}
	#menuImg{width: 40px; height: auto;}
	.header-list{float: right; padding: 0px;}
 	.nav-link{padding: 4px; font-size: 20px; color: black;}
 	.nav-link a:hover {color: #0f6756;}
 	.main-login{
 		background-color: #0f6756;
 		border-radius: 5px 5px 5px 5px;
 		color: white !important;

	}
	#main-search{
 		background-color: #0f6756;
 		border-radius: 5px 5px 5px 5px;
 		color: white !important;
	}
	
	#login, #logout {
		cursor:pointer !important;
	}



	/* 메뉴바 스타일 */
	
#menuToggle
{
  display: block;
  position: relative;
  top: 75px;
  left: 50px;
  
  z-index: 1;
  
  -webkit-user-select: none;
  user-select: none;
}

#menuToggle a
{
  text-decoration: none;
  color: #232323;
  
  transition: color 0.3s ease;
}

#menuToggle a:hover
{
  color: rgb(244,162,1);
}


#menuToggle input
{
  display: block;
  width: 40px;
  height: 32px;
  position: absolute;
  top: -7px;
  left: -5px;
  
  cursor: pointer;
  
  opacity: 0; 
  z-index: 2; 
  
  -webkit-touch-callout: none;
}

/*
 * 햄버거 메뉴
 */
#menuToggle span
{
  display: block;
  width: 33px;
  height: 4px;
  margin-bottom: 5px;
  position: relative;
  
  background: rgb(15, 103, 86);
  border-radius: 3px;
  
  z-index: 1;
  
  transform-origin: 4px 0px;
  
  transition: transform 0.5s cubic-bezier(0.77,0.2,0.05,1.0),
              background 0.5s cubic-bezier(0.77,0.2,0.05,1.0),
              opacity 0.55s ease;
}

#menuToggle span:first-child
{
  transform-origin: 0% 0%;
}

#menuToggle span:nth-last-child(2)
{
  transform-origin: 0% 100%;
}

/* 
 * 
 * 메뉴 모양 변형
 */
#menuToggle input:checked ~ span
{
  opacity: 1;
  transform: rotate(45deg) translate(-2px, -1px);
  background: rgb(244,162,1);
}

/*
 * 
 */
#menuToggle input:checked ~ span:nth-last-child(3)
{
  opacity: 0;
  transform: rotate(0deg) scale(0.2, 0.2);
}


#menuToggle input:checked ~ span:nth-last-child(2)
{
  transform: rotate(-45deg) translate(0, -1px);
}


#menu
{
  font-family: 'jua', sans-serif;
  position: absolute;
  width: 350px;
  margin: -100px 0 0 -50px;
  padding: 50px;
  padding-top: 125px;
  
  background: rgb(15, 103, 86);
  list-style-type: none;
  -webkit-font-smoothing: antialiased;
  
  transform-origin: 0% 0%;
  transform: translate(-100%, 0);
  
  transition: transform 0.5s cubic-bezier(0.77,0.2,0.05,1.0);
}

#menu li
{
  padding: 10px 0;
  font-size: 22px;
}

#logOut{text-decoration: underline;}


#menuToggle input:checked ~ ul
{
  transform: none;
}
	
/* 메뉴바 스타일 끝 */

</style>
</head>
<body>

<!-- 메인페이지 메뉴바 시작 -->

<nav class="navbar navbar-expand-lg">
  <div id="menuToggle">	
    <input type="checkbox" />
    
    <!--
           햄버거 메뉴
    -->
    <span></span>
    <span></span>
    <span></span>
    <!--   
           관리자 일땐 어떻게..??
           관리자 페이지만 나올 수 있도록..?
    -->
    <% if(loginUser != null){ %>
    <ul id="menu">
      <p>
      <%if(pImg != null){ %>
      <img src="<%= request.getContextPath()%>/img_upload/<%= pImg.getImgChange()%>" style="width: 70%">
      <%} else { %>
      <img src="<%= request.getContextPath()%>/resources/image/defaultProfile.png">
      <%} %>
      </p><br>
      <p>
      <a><%=profile.getUserName() %>님, 환영합니다!</a>
      </p>
      <li><a href="index.jsp">홈</a></li>
      <li><a href="<%= request.getContextPath()%>/centerView.ce">고객센터</a></li>
      <li><a href="#">마이페이지</a></li>
      <li><a href="https://www.instagram.com/willyarchives/" target="_blank">👻</a></li>
      <li>
      <button type="button" class="btn btn-warning" id="logout2">로그아웃😥</button></li>
    </ul>
    <% } else { %>
    <ul id="menu">
      <p>
      <img src="assets/img/menubar_lobby.png" style="width: 70%">
      </p><br>
      <li><button type="button" class="btn btn-warning" id="login2">로그인🤗</button></li>
      <li><a href="index.jsp">홈</a></li>
      <li><a href="<%= request.getContextPath()%>/centerView.ce">고객센터</a></li>
      <li><a href="product/productSearchList.jsp">공간검색</a></li>
      <li><a href="https://www.instagram.com/willyarchives/" target="_blank">👻</a></li>
    </ul>
    <% } %>
  </div>
</nav>

	<!-- 메인페이지 메뉴바 끝 -->





<br> 
<nav class="navbar navbar-expand-lg" id="box1">
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
    <a class="navbar-brand" href="index.jsp"><img src="assets/img/logo.png" id="logoImg"></a>
    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
      <li class="nav-item active">
       <a class="nav-link" href="<%= request.getContextPath() %>/enrollMain.en">공간등록 <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="<%= request.getContextPath()%>/centerView.ce">고객센터</a>
      </li>
      <li class="nav-item">
        <% if(loginUser == null){ %>
        	<a class="nav-link main-login" id="login">로그인</a>
         <% } else { %>
            <a class="nav-link main-login" id="logout">로그아웃</a>
         <% } %>
      </li>
    </ul>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   
    	<div class="row justify-content-between">
			<div class="col-auto">
	      <input type="text" placeholder="어떤 장소를 찾으시나요?" aria-label="Search">
       <button id="main-search" type="submit">검색</button>
   			</div>
		</div>
	</div>
</nav>

<div class="progress">
  <div class="prog-bar col_success" role="progressbar" style="width: 100%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
</div>



<!-- 로그인 -->
<script>
	$('#login').on('click', function(){
		location.href="<%= request.getContextPath() %>/loginForm.me";
	});
	
	$('#logout').on('click', function(){
		location.href="<%= request.getContextPath() %>/logout.me";
	});
</script>


<<<<<<< HEAD
<!-- 검색 -->
<script>
	$('#main-search').on('click', function() {
		location.href="<%= request.getContextPath() %>/search.pro";		
	});
</script>

  
</body>
</html>
=======
<!-- 메뉴바 로그인 -->
<script>
	$('#login2').on('click', function(){
		location.href="<%= request.getContextPath() %>/loginForm.me";
	});
	
	$('#logout2').on('click', function(){
		location.href="<%= request.getContextPath() %>/logout.me";
	});
</script>
>>>>>>> branch 'main' of https://github.com/seunghyun93/Comeon-Space.git
</body>
</html>