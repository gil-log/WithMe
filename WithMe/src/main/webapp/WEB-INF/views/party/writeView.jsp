<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
   content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<!--CSS -->
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<title>일정 추가</title>
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
   url(https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css)
   ;

body {
   font-family: 'NanumSquare', sans-serif;
}

.input-group {
   position: absolute;
   z-index: 1000;
   bottom: 20px;
   left: 20px;
   width: 35%;
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
   <!--navbar -->

   <!-- 지도를 초기화할 때 size를 지정하지 않으면, 초기화 시점의 지도 DOM컨테이너의 크기로 지도 크기 설정
    이후 setSize 메서드를 이용해 지도 크기를 변경하기 전까지 지도 크기는 고정됨 -->

   <div id="map" style="width: 50%; height: 55%;">
      <div class="input-group">
         <input id="address" name="address" type="text" placeholder="도로명 또는 지번주소" class="form-control" />
         <div class="input-group-append">
            <button id="searchBtn" type="button" class="btn btn-secondary btn-sm">검색</button>
         </div>
      </div>
   </div>


   <script type="text/javascript">
      var contentString = null;
      /** 검색 주소 결과창 내용*/
      var search_location;
      /** item.address담는 전역변수*/
      var pointx, pointy;
      /** 위도 경도 담는 전역변수*/

      /** 지도 생성*/
      var map = new naver.maps.Map("map", {
         center : new naver.maps.LatLng(37.3595316, 127.1052133),
         /**처음 잡아주는 값*/
         zoom : 10,
         tileSize : new naver.maps.Size(50, 50)

      });

      /** infoWindow생성  */
      var infoWindow = new naver.maps.InfoWindow({
         
         
         content : contentString,
         
         anchorSkew : true
         
      /** 정보창 꼬리 기울기 사용 여부 */
      });
      map.setCursor('pointer');

      /** 마커 시작*/
      var HOME_PATH = window.HOME_PATH || '.';
      var cityhall = new naver.maps.LatLng(37.5666805, 126.9784147), map = new naver.maps.Map(
            'map', {
               center : cityhall,
               zoom : 15
            }), marker = new naver.maps.Marker({
         map : map,
         position : cityhall
      });
      /** 마커 끝*/

      /** 일치하는 주소 반환(결과)*/
      function searchAddressToCoordinate(address) {
         naver.maps.Service
               .geocode(
                     {
                        /** 주소로 좌표를 검색하는 geocode API호출*/
                        query : address
                     },
                     function(status, response) {
                        if (status === naver.maps.Service.Status.ERROR) {
                           if (!address) {
                              return alert('Geocode Error, Please check address');
                           }
                           return alert('Geocode Error, address:'
                                 + address);
                        }

                        if (response.v2.meta.totalCount === 0) {
                           return alert('No result.');
                        }

                        var htmlAddresses = [], item = response.v2.addresses[0];
                        point = new naver.maps.Point(item.x, item.y);
                        pointx=item.x;
                        pointy=item.y;
                     
                        if (item.roadAddress) {
                           htmlAddresses.push('[도로명 주소] '
                                 + item.roadAddress);
                           search_location = item.roadAddress;
                        }

                        if (item.jibunAddress) {
                           htmlAddresses.push('[지번 주소] '
                                 + item.jibunAddress);
                        }

                        /** party입력 창 */
                        contentString = infoWindow
                              .setContent([
                                    '<div class="iw_inner">',
                                    '   <div class="iw_title">장소: '
                                          + address + '</div>',
                                    '      <div class="iw_content">',
                                    search_location,

                                    '      </div>',
                                    '</div>',
                                    '<div class="apply_bt">',
                                    '<button onclick="closeWin()" class="btn btn-outline-info" id="select_party">닫기</button>',
                                    '<button onclick="inputFormPopup()" class="btn btn-outline-info" id="select_party">작성하기</button>',
                                    '</div>' ].join('\n'));
                        map.setCenter(point);
                        infoWindow.open(map, point);
                     });

      }/** searchAddressToCoordinate() */

      
      /** infoWindow 팝업창 닫기 */
      function closeWin() {
         infoWindow.close();
      }
      
      
      /** infoWindow 작성하기로 전환 */
      function inputFormPopup() {

         
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

         document.getElementById("p_location").value= search_location;
         document.getElementById("p_long").value= pointx;
         document.getElementById("p_lati").value= pointy;
         map.setCenter(point);
         infoWindow.open(map, point);
         
         
      }

      /** 검색버튼 누르면 address전송 */
      function initGeocoder() {
         if (!map.isStyleMapReady) {
            return;
         }

         map.addListener('click', function(e) {
            searchCoordinateToAddress(e.coord);
         });

         $('#address').on('keydown', function(e) {
            var keyCode = e.which;

            if (keyCode === 13) { // Enter Key
               searchAddressToCoordinate($('#address').val());
            }
         });

         /** 검색후 동작*/
         $('#searchBtn').click(function(e) {
            e.preventDefault();
            searchAddressToCoordinate($('#address').val());
         });

      }/** initGeocoder() */

      naver.maps.onJSContentLoaded = initGeocoder;
      naver.maps.Event.once(map, 'init_stylemap', initGeocoder);
   </script>

   <script
      src="${pageContext.request.contextPath}/resources/main/assets/js/jquery.min.js"></script>
   <script
      src="${pageContext.request.contextPath}/resources/main/assets/js/jquery.scrollex.min.js"></script>
   <script
      src="${pageContext.request.contextPath}/resources/main/assets/js/jquery.scrolly.min.js"></script>

</body>
</html>