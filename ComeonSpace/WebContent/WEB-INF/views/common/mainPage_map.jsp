<!--
	공간 관련 부분들 완성되면
	Product_Name과 Location 가져오기.
	위/경도 주소는 어떻게 가져올까..??
	
	로그인 시 보여지는 지도의 위/경도는 어떻게 설정할까?
 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>닫기가 가능한 커스텀 오버레이</title>
    <style>
    .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}
</style>
</head>
<body>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c343a50375dd68eada595d22aa6c9761"></script>
<script>
var mapContainer = document.getElementById('mapid'), // 지도의 중심좌표
    mapOption = { 
        center: new kakao.maps.LatLng(37.50129870815526, 127.03118267384907), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    }; 

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 지도에 마커를 표시합니다 
var marker = new kakao.maps.Marker({
    map: map, 
    position: new kakao.maps.LatLng(37.49915355636109, 127.03287169826166),
});

var marker2 = new kakao.maps.Marker({
    map: map, 
    position: new kakao.maps.LatLng(37.50106038270292, 127.02741685267398)
});

var marker3 = new kakao.maps.Marker({
    map: map, 
    position: new kakao.maps.LatLng(37.5018840802614, 127.03409308150923)
});

// 커스텀 오버레이에 표시할 컨텐츠 입니다
// 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
// 별도의 이벤트 메소드를 제공하지 않습니다 
var content = '<div class="wrap">' + 
            '    <div class="info">' + 
            '        <div class="title">' + 
            '            도지의 공유오피스' + 
            '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
            '        </div>' + 
            '        <div class="body">' + 
            '            <div class="img">' +
            '                <img src="https://img.hankyung.com/photo/202104/01.25738179.1.jpg" width="73" height="70">' +
            '           </div>' + 
            '            <div class="desc">' + 
            '                <div class="ellipsis">서울특별시 강남구 강남구 테헤란로14길 6</div>' + 
            '                <div class="jibun ellipsis">(우) 63309 (지번) 영평동 2181</div>' + 
            '                <div><a href="https://www.iei.or.kr/" target="_blank" class="link">공간상세페이지</a></div>' + 
            '            </div>' + 
            '        </div>' + 
            '    </div>' +    
            '</div>';

var content2 = '<div class="wrap">' + 
            '    <div class="info">' + 
            '        <div class="title">' + 
            '            사유의 서재' + 
            '            <div class="close" onclick="closeOverlay2()" title="닫기"></div>' + 
            '        </div>' + 
            '        <div class="body">' + 
            '            <div class="img">' +
            '                <img src="https://bio.linkcdn.to/20200813/14220816270?imageView2/2/w/240/h/240/q/100" width="73" height="70">' +
            '           </div>' + 
            '            <div class="desc">' + 
            '                <div class="ellipsis">서울특별시 강남구 역삼동 825-20</div>' + 
            '                <div class="jibun ellipsis">(우) 63309 (지번) 영평동 2181</div>' + 
            '                <div><a href="https://www.instagram.com/sayu.booksalon/" target="_blank" class="link">공간상세페이지</a></div>' + 
            '            </div>' + 
            '        </div>' + 
            '    </div>' +    
            '</div>';

            
var content3 = '<div class="wrap">' + 
            '    <div class="info">' + 
            '        <div class="title">' + 
            '            스튜디오 알타쿠치나' + 
            '            <div class="close" onclick="closeOverlay3()" title="닫기"></div>' + 
            '        </div>' + 
            '        <div class="body">' + 
            '            <div class="img">' +
            '                <img src="https://postfiles.pstatic.net/MjAyMDA3MDJfMyAg/MDAxNTkzNjg0NjA2MDcx.v4rtYHnbG6CitxN2q8S-pL4NgUlHcfWeyRZUcxJ9UQQg.o8dxmHUJxXHDbtz94rsc6qRNmLtCywjR-p2K3DPzUukg.JPEG.ariarisom2/DSC01001.jpg?type=w966" width="73" height="70">' +
            '           </div>' + 
            '            <div class="desc">' + 
            '                <div class="ellipsis">서울 강남구 테헤란로21길 25 1층</div>' + 
            '                <div class="jibun ellipsis">(우) 63309 (지번) 영평동 2181</div>' + 
            '                <div><a href="https://www.instagram.com/altacucina_official/" target="_blank" class="link">공간상세페이지</a></div>' + 
            '            </div>' + 
            '        </div>' + 
            '    </div>' +    
            '</div>';

// 마커 위에 커스텀오버레이를 표시합니다
// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
var overlay = new kakao.maps.CustomOverlay({
    content: content,
    map: map,
    position: marker.getPosition()       
});

var overlay2 = new kakao.maps.CustomOverlay({
    content: content2,
    map: map,
    position: marker2.getPosition()       
});

var overlay3 = new kakao.maps.CustomOverlay({
    content: content3,
    map: map,
    position: marker3.getPosition()       
});

// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
kakao.maps.event.addListener(marker, 'click', function() {
    overlay.setMap(map);
});

kakao.maps.event.addListener(marker2, 'click', function() {
    overlay2.setMap(map);
});

kakao.maps.event.addListener(marker3, 'click', function() {
    overlay3.setMap(map);
});

// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
function closeOverlay() {
    overlay.setMap(null);     
}

function closeOverlay2() {
    overlay2.setMap(null);     
}

function closeOverlay3() {
    overlay3.setMap(null);     
}
</script>
</body>
</html>