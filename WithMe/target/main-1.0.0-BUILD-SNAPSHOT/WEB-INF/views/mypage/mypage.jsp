<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
   content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<!--CSS -->
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<title>마이페이지</title>
<!--  geocoder -->
<script type="text/javascript"
   src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=o6yhaa7jc1&submodules=geocoder"></script>
<!--  &callback=CALLBACK_FUNCTION는 지도가 로드되는 동안 나머지 웹 사이트를 렌더링하는 비동기 방식으로 사용(callback함수를 지정) -->
<script type="text/javascript"
   src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=o6yhaa7jc1&callback=initMap"></script>
<script
   src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


<script
      src="${pageContext.request.contextPath}/resources/main/assets/js/jquery.min.js"></script>
<script
      src="${pageContext.request.contextPath}/resources/main/assets/js/jquery.scrollex.min.js"></script>
<script
      src="${pageContext.request.contextPath}/resources/main/assets/js/jquery.scrolly.min.js"></script>
<!-- naverMap css -->
<link type="text/css" rel="stylesheet" href="styles/sunlight.default.css">
<link type="text/css" rel="stylesheet" href="styles/site.flatly.css">
<link type="text/css" rel="stylesheet" href="./css/highlightjs.css">

<style>
@import
   url(https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css)
   ;

body {
   font-family: 'NanumSquare', sans-serif;
}

p.info_content {
   color: black;
}

.iw_inner {
   margin-bottom: 5px;
   text-align: center;
}

.iw_inner .iw_title {
   font-size: 23px;
   font-weight: bold;
   padding: 10px;
   background-color: #48b5e9;
   color: white;
   margin: 0;
   border-radius: 2px 2px 0 0;
}

.iw_inner .iw_content {
   font-size: 13px;
   line-height: 20px;
   font-weight: 400;
   padding: 15px 7px 2px 10px;
   max-height: 150px;
   overflow-y: hidden;
   overflow-x: hidden;
}

#apply_party {
   font-size: 0.8rem;
   width: 100%;
}

#select_party {
   font-size: 0.8rem;
   width: 49%;
}

</style>
   
</head>
<body>


		<div>
			<%@include file="side.jsp"%>
		</div>


   <div id="map" style="width: 50%; height: 55%; left:25%; top:20%;"></div>

   <script type="text/javascript">
      
   
   var markers = [], infoWindows = [];
    var m = new Array();
    var contentString = new Array();
    
    //++ 마이페이지 초반에 맵 zoom값 7일때 중앙값
    var mapcenter = new naver.maps.LatLng(35.918183, 127.8803866);
    
    //++ 해쉬태그 별 마커 이미지 부분
    var hashtag = new Array();
    var whathash = '';
    
    
    
    /** 마커 위치 설정 코드*/
    <c:set var="i" value="0" />
    
    <c:forEach items="${mypageList}" var="mypageList">
        m[${i}] = new naver.maps.LatLng(${mypageList.p_lati},${mypageList.p_long});
        
        
        //++ 해쉬태그 별 마커 이미지 부분
        whathash = '${mypageList.hashtag}';
        
        switch(whathash){
        case '#여행' : 
        	hashtag[${i}] = 'travel.png'; break;
        case '#먹방' : 
        	hashtag[${i}] = 'mukbang.png'; break;
        case '#오락' : 
        	hashtag[${i}] = 'acade.png'; break;
        case '#힐링' : 
        	hashtag[${i}] = 'healing.png'; break;
        case '#사진' : 
        	hashtag[${i}] = 'photo.png'; break;
        case '#번개' : 
        	hashtag[${i}] = 'thunder.png'; break;
        default : 
        	hashtag[${i}] = 'question.png'; break;
        }
        
        
        	
        	
        	
        	
        	
        contentString[${i}] = '${mypageList.party_title}';
      <c:set var="i" value="${i+1}" />

    </c:forEach>
    
      /** 지도 생성*/
      var map = new naver.maps.Map('map', {
         center : mapcenter,
         zoom : 7,
         tileSize : new naver.maps.Size(50, 50)
      });

      for (var ii=0; ii < m.length ; ii++) {
         
         /** 받아온 위치에 마커 찍기코드*/
         var marker = new naver.maps.Marker({
             position: m[ii],
             map: map,
             icon: {
          	   url: '${pageContext.request.contextPath}/resources/img/' + hashtag[ii],
               size: new naver.maps.Size(50, 52),
               origin: new naver.maps.Point(0, 0),
               anchor: new naver.maps.Point(25, 26)
             },
         });
         
         /** 검색 주소 결과창 내용*/
         var infoWindow = new naver.maps.InfoWindow({
            content : contentString[ii]
         });

         markers.push(marker);
         infoWindows.push(infoWindow);
         
      }
      
      for (var i=0; i<markers.length; i++) {
         naver.maps.Event.addListener(markers[i], 'click',
            getClickHandler(i));
      }
      

      // 해당 마커의 인덱스를 seq라는 클로저 변수로 저장하는 이벤트 핸들러를 반환합니다.
      // 마커 누르면 메시지 출력하는 코드
      function getClickHandler(seq) {
         return function(e) {
            var marker = markers[seq], infoWindow = infoWindows[seq];

            if (infoWindow.getMap()) {
               infoWindow.close();
            } else {
               infoWindow.open(map, marker);
            }
         }
      }
      

   </script>


</body>
</html>

</body>
</html>