<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>


/* 각 페이지 연결 남음 */


*{font-family: 'jua', sans-serif; !important}
a, p, h1, h2, h3{font-family: 'jua', sans-serif; !important}

/* STYLES SPECIFIC TO FOOTER  */
.site-footer
{
  background-color:#26272b;
  padding:45px 0 20px;
  font-size:15px;
  line-height:24px;
  color:#737373;
}
.site-footer hr
{
  border-top-color:#bbb;
  opacity:0.5
}
.site-footer hr.small
{
  margin:20px 0
}
.site-footer h6
{
  color:rgb(15, 103, 86);
  font-size:16px;
  text-transform:uppercase;
  margin-top:5px;
  letter-spacing:2px
}
.site-footer a
{
  color:#737373;
}
.site-footer a:hover
{
  color:rgb(15, 103, 86);
  text-decoration:none;
}
.footer-links
{
  padding-left:0;
  list-style:none
}
.footer-links li
{
  display:block
}
.footer-links a
{
  color:#737373
}
.footer-links a:active,.footer-links a:focus,.footer-links a:hover
{
  color:rgb(15, 103, 86);
  text-decoration:none;
}
.footer-links.inline li
{
  display:inline-block
}
.site-footer .social-icons
{
  text-align:right
}
.site-footer .social-icons a
{
  width:40px;
  height:40px;
  line-height:40px;
  margin-left:6px;
  margin-right:0;
  border-radius:100%;
  background-color:#33353d
}
.copyright-text
{
  margin:0
}
@media (max-width:991px)
{
  .site-footer [class^=col-]
  {
    margin-bottom:30px
  }
}
@media (max-width:767px)
{
  .site-footer
  {
    padding-bottom:0
  }
  .site-footer .copyright-text,.site-footer .social-icons
  {
    text-align:center
  }
}
.social-icons
{
  padding-left:0;
  margin-bottom:0;
  list-style:none
}
.social-icons li
{
  display:inline-block;
  margin-bottom:4px
}
.social-icons li.title
{
  margin-right:15px;
  text-transform:uppercase;
  color:#96a2b2;
  font-weight:700;
  font-size:13px
}
.social-icons a{
  background-color:#eceeef;
  color:#818a91;
  font-size:16px;
  display:inline-block;
  line-height:44px;
  width:44px;
  height:44px;
  text-align:center;
  margin-right:8px;
  border-radius:100%;
  -webkit-transition:all .2s linear;
  -o-transition:all .2s linear;
  transition:all .2s linear
}
.social-icons.size-sm a
{
  line-height:34px;
  height:34px;
  width:34px;
  font-size:14px
}

@media (max-width:767px)
{
  .social-icons li.title
  {
    display:block;
    margin-right:0;
    font-weight:600
  }
}
</style>
</head>
<body>


<!-- FOOTER START -->
    <footer class="site-footer">
      <div class="container">
        <div class="row">
          <div class="col-sm-12 col-md-6">
            <h6>About</h6>
            <p class="text-justify">저희 6ixpace는 <i> 펜데믹으로 인해 높아진 공실률을 최소화, 공간의 사용성을 최대화하기 위해 </i><br>
                        이용자와 중개자, 사회전체 모두에게 이익이 되는 윈윈 구조의 공유경제 모델을 채택하였습니다. 비어있는 혹은 버려져있는 공간을 각각의 니즈에 맞춰 공유공간으로 보다 손쉽게 활용할 수 있는  
                        비대면 예약 플랫폼을 구축하여 위축된 공동 경제에 활력을 불어넣고, 공유 공간 서비스의 경제성과 합리성을 살리고자 합니다.
                        소유하고 있는 공간을 공유공간으로 활용하고 싶은 분이나, 침체된 공간을 색다른 아이디어로 탈바꿈 시킬 수 있는 분을 찾습니다. 언제든 6ixpace로 연락해주세요!</p>
          </div>

          <div class="col-xs-6 col-md-3">
            <h6>Info</h6>
            <ul class="footer-links">
              <li><a href="#">주소: 서울시 강남구 역삼동</a></li>
              <li><a href="#">전화번호 : 010.1234.4321</a></li>
              <li><a href="#">상담시간: 10:00 ~ 18:00</a></li>
              <li><a href="#">사람을 찾습니다</a></li>
              <li><a href="#">새벽에 사라져버린</a></li>
              <li><a href="#">박모군🕵️‍♂️</a></li>
            </ul>
          </div>

          <div class="col-xs-6 col-md-3">
            <h6>Quick Links</h6>
            <ul class="footer-links">
              <li><a href="#">6ixpace</a></li>
              <li><a href="#">고객센터</a></li>
              <li><a href="#">회원가입</a></li>
              <li><a href="#">운영정책</a></li>
              <li><a href="#">👩‍💻 👨‍💻</a></li>
            </ul>
          </div>
        </div>
        <hr>
      </div>
      <div class="container">
        <div class="row">
          <div class="col-md-8 col-sm-6 col-xs-12">
            <p class="copyright-text">Copyright &copy; 2021 All Rights Reserved by 
         <a href="#">6ixpace</a>.
            </p>
          </div>

          <div class="col-md-4 col-sm-6 col-xs-12">
            <ul class="social-icons">
              <li><a class="facebook" href="#"><img src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fstatic.xx.fbcdn.net%2Frsrc.php%2Fyz%2Fr%2FKFyVIAWzntM.ico&type=f30_30_png_expire24" style=width:100%;><i class="fa fa-facebook"></i></a></li>
              <li><a class="twitter" href="#"><img src="https://w.namu.la/s/99255bafdd5168cbf7c383a29948ad9829aff378eb2955b7642fdf366a70ee61c9dbd2394249363bbe4027d0bb27a304ace0786812b903aeb6366e0a2b73249023a070ad232e1546b75e804da995ef27a63d0b619aeeba8433613c74fcab371f"style="width: 100%;"><i class="fa fa-twitter"></i></a></li>
              <li><a class="instagram" href="#"><img src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fwww.instagram.com%2Fstatic%2Fimages%2Fico%2Ffavicon.ico%2F36b3ee2d91ed.ico&type=f30_30_png_expire24" style=width:100%;><i class="fa fa-instagram"></i></a></li>
              <li><a class="linkedin" href="#"><img src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fstatic-exp1.licdn.com%2Fsc%2Fh%2Fal2o9zrvru7aqj8e1x2rzsrca&type=f30_30_png_expire24" style=width:100%;><i class="fa fa-linkedin"></i></a></li>   
            </ul>
          </div>
        </div>
      </div>
</footer>
<!-- END OF FOOTER -->

</body>
</html>