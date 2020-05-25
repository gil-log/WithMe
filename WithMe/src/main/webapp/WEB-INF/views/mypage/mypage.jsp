<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
   content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<title>마이페이지</title>
<!--CSS -->
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<!--  geocoder -->
<script type="text/javascript"
   src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=o6yhaa7jc1&submodules=geocoder"></script>
<!--  &callback=CALLBACK_FUNCTION는 지도가 로드되는 동안 나머지 웹 사이트를 렌더링하는 비동기 방식으로 사용(callback함수를 지정) -->
<script type="text/javascript"
   src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=o6yhaa7jc1&callback=initMap"></script>
<script
   src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- naverMap css -->
<link type="text/css" rel="stylesheet" href="styles/sunlight.default.css">
<link type="text/css" rel="stylesheet" href="styles/site.flatly.css">
<link type="text/css" rel="stylesheet" href="./css/highlightjs.css">

<style>
@import
   url(https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css);

body {
   font-family: 'NanumSquare', sans-serif;
}

.form-control {
   height: 30px;
   background-color: rgba(0, 0, 0, 0) !important;
   border-color: gray !important;
}

p.thick {
   font-weight: bold;
   color: black;
}

p.info_content {
   color: black;
}

.iw_inner {
   margin-bottom: 5px;
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
</style>

</head>
<body>

   <!-- navbar -->

   <%-- <%@include file="/WEB-INF/views/navbar.jsp" %> --%>

   <!-- 지도를 초기화할 때 size를 지정하지 않으면, 초기화 시점의 지도 DOM컨테이너의 크기로 지도 크기 설정
      이후 setSize 메서드를 이용해 지도 크기를 변경하기 전까지 지도 크기는 고정됨 -->
   <div id="map" style="width: 50%; height: 55%;"></div>
   
   <script type="text/javascript">
   
      /** 검색 주소 결과창 내용*/
      var contentString = null;
   
      /** 마커 배열 시작*/
      var HOME_PATH = window.HOME_PATH || '.';
      var MARKER_SPRITE_X_OFFSET = 29,
       MARKER_SPRITE_Y_OFFSET = 50,
       MARKER_SPRITE_POSITION = {
           "A0": [0, 0],
           "B0": [MARKER_SPRITE_X_OFFSET, 1],
           "C0": [MARKER_SPRITE_X_OFFSET*2, 1],
           "D0": [MARKER_SPRITE_X_OFFSET*3, 1],
           "E0": [MARKER_SPRITE_X_OFFSET*4, 1],
           "F0": [MARKER_SPRITE_X_OFFSET*5, 1],
           "G0": [MARKER_SPRITE_X_OFFSET*6, 1],
           "H0": [MARKER_SPRITE_X_OFFSET*7, 1],
           "I0": [MARKER_SPRITE_X_OFFSET*8, 1],

           "A1": [0, MARKER_SPRITE_Y_OFFSET],
           "B1": [MARKER_SPRITE_X_OFFSET, MARKER_SPRITE_Y_OFFSET],
           "C1": [MARKER_SPRITE_X_OFFSET*2, MARKER_SPRITE_Y_OFFSET],
           "D1": [MARKER_SPRITE_X_OFFSET*3, MARKER_SPRITE_Y_OFFSET],
           "E1": [MARKER_SPRITE_X_OFFSET*4, MARKER_SPRITE_Y_OFFSET],
           "F1": [MARKER_SPRITE_X_OFFSET*5, MARKER_SPRITE_Y_OFFSET],
           "G1": [MARKER_SPRITE_X_OFFSET*6, MARKER_SPRITE_Y_OFFSET],
           "H1": [MARKER_SPRITE_X_OFFSET*7, MARKER_SPRITE_Y_OFFSET],
           "I1": [MARKER_SPRITE_X_OFFSET*8, MARKER_SPRITE_Y_OFFSET],

           "A2": [0, MARKER_SPRITE_Y_OFFSET*2],
           "B2": [MARKER_SPRITE_X_OFFSET, MARKER_SPRITE_Y_OFFSET*2],
           "C2": [MARKER_SPRITE_X_OFFSET*2, MARKER_SPRITE_Y_OFFSET*2],
           "D2": [MARKER_SPRITE_X_OFFSET*3, MARKER_SPRITE_Y_OFFSET*2],
           "E2": [MARKER_SPRITE_X_OFFSET*4, MARKER_SPRITE_Y_OFFSET*2],
           "F2": [MARKER_SPRITE_X_OFFSET*5, MARKER_SPRITE_Y_OFFSET*2],
           "G2": [MARKER_SPRITE_X_OFFSET*6, MARKER_SPRITE_Y_OFFSET*2],
           "H2": [MARKER_SPRITE_X_OFFSET*7, MARKER_SPRITE_Y_OFFSET*2],
           "I2": [MARKER_SPRITE_X_OFFSET*8, MARKER_SPRITE_Y_OFFSET*2]
       };

   /** 지도 생성*/
   var map = new naver.maps.Map('map', {
       center: new naver.maps.LatLng(37.3595704, 127.105399),
       zoom: 10,
       tileSize : new naver.maps.Size(50, 50)
   });

   var bounds = map.getBounds(),
       southWest = bounds.getSW(),
       northEast = bounds.getNE(),
       lngSpan = northEast.lng() - southWest.lng(),
       latSpan = northEast.lat() - southWest.lat();

   var markers = [],
       infoWindows = [];
   
   
   /** party입력 창 */
   contentString = infoWindow
         .setContent([
               '<div class="iw_inner">',
               '<form role="form" method="post" action="/party/write">',
               '<table>',

               '<div class="iw_title">모집 상세 정보 입력</div>',
               '<tr><td><label for="party_title" style="font-weight: bold; ">제목&nbsp;&nbsp;</label><input type="text" id="party_title" name="party_title" /></td></tr>',
               '<tr><td><label for="p_date" style="font-weight: bold;">날짜&nbsp;&nbsp;</label><input type="date" id="p_date" name="p_date" /></td></tr>',
               '<tr><td><label for="p_num" style="font-weight: bold;">인원수&nbsp;&nbsp;</label><input type="number" id="p_num" name="p_num" /></td></tr>',
               '<tr><td><input type="hidden" id="p_location" name="p_location"/></td></tr>',
               '<tr><td><input type="hidden" id="p_long" name="p_long" /></td></tr>',
               '<tr><td><input type="hidden" id="p_lati" name="p_lati" /></td></tr>',

               '<tr>',
               ' <td>',
               '   <label for="p_gender" style="font-weight: bold;">성별제한&nbsp;&nbsp;</label>',
               '   <select name = "p_gender">',
               '     <option selected>N</option>',
               '     <option>M</option>',
               '     <option>W</option>',
               '    </select>',
               ' </td>',
               '</tr>',
               '<tr><td><label for="p_cost" style="font-weight: bold;">예상비용&nbsp;&nbsp;</label><input type="number" id="p_cost" name="p_cost" /></td></tr>',
               '<tr><td><label for="p_note" style="font-weight: bold;">파티내용&nbsp;&nbsp;</label><textarea id="p_note" name="p_note" ></textarea></td></tr>',
               '<tr><td><label for="p_location" style="font-weight: bold;">장소&nbsp;&nbsp;</label>'
                     + search_location,

               '</td></tr>',
               '<br />',

               '<div class="apply_bt">',
               '<tr>',
               ' <td>',
               '   <label for="hashtag" style="font-weight: bold;">해시태그&nbsp;&nbsp;</label>',
               '   <select name = "hashtag">',
               '     <option selected>#먹방</option>',
               '     <option>#여행</option>',
               '     <option>#탐험</option>',
               '     <option>#번개</option>',
               '     <option>#힐링</option>',
               '     <option>#사진</option>',
               '     <option>#오락</option>',
               '     <option>#간술</option>',
               '    </select>',
               ' </td>',
               '</tr>',

               '<tr>',
               ' <td>',
               '   <button type="submit" class="btn btn-outline-info" id="apply_party">작성완료</button>',
               ' </td>', '</tr>',

               '</table>', '</form>', '</div>' ].join('\n'));


   for (var key in MARKER_SPRITE_POSITION) {

      /** 걍 랜덤계산용 나중에 지워버리기*/
      var position = new naver.maps.LatLng( 
           southWest.lat() + latSpan * Math.random(),
           southWest.lng() + lngSpan * Math.random());

       /** 받아온 위치에 마커 찍기코드*/
       var marker = new naver.maps.Marker({ 
           map: map,
           position: position,
           title: key,
           
           zIndex: 100
       });

       /** 검색 주소 결과창 내용*/
       var infoWindow = new naver.maps.InfoWindow({
           content: contentString
       });

       markers.push(marker);
       infoWindows.push(infoWindow);
   };

   naver.maps.Event.addListener(map, 'idle', function() {
       updateMarkers(map, markers);
   });

   function updateMarkers(map, markers) {

       var mapBounds = map.getBounds();
       var marker, position;

       for (var i = 0; i < markers.length; i++) {

           marker = markers[i]
           position = marker.getPosition();

           if (mapBounds.hasLatLng(position)) {
               showMarker(map, marker);
           } else {
               hideMarker(map, marker);
           }
       }
   }

   function showMarker(map, marker) {

       if (marker.setMap()) return;
       marker.setMap(map);
      
   }

   function hideMarker(map, marker) {

       if (!marker.setMap()) return;
       marker.setMap(null);
   }

   // 해당 마커의 인덱스를 seq라는 클로저 변수로 저장하는 이벤트 핸들러를 반환합니다.
   // 마커 누르면 메시지 출력하는 코드
   function getClickHandler(seq) {
       return function(e) {
           var marker = markers[seq],
               infoWindow = infoWindows[seq];

           if (infoWindow.getMap()) {
               infoWindow.close();
           } else {
               infoWindow.open(map, marker);
           }
       }
   }

   for (var i=0, ii=markers.length; i<ii; i++) {
       naver.maps.Event.addListener(markers[i], 'click', getClickHandler(i));
   }
   /** 마커 끝*/
   
      
   </script>

   <script
      src="${pageContext.request.contextPath}/resources/main/assets/js/jquery.min.js"></script>
   <script
      src="${pageContext.request.contextPath}/resources/main/assets/js/jquery.scrollex.min.js"></script>
   <script
      src="${pageContext.request.contextPath}/resources/main/assets/js/jquery.scrolly.min.js"></script>

</body>
</html>
