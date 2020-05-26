<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
   content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<!--CSS -->
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<title>간단한 지도 표시하기</title>
<!--  geocoder -->
<script type="text/javascript"
   src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=o6yhaa7jc1&submodules=geocoder"></script>
<!--  &callback=CALLBACK_FUNCTION는 지도가 로드되는 동안 나머지 웹 사이트를 렌더링하는 비동기 방식으로 사용(callback함수를 지정) -->
<script type="text/javascript"
   src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=o6yhaa7jc1&callback=initMap"></script>
<script
   src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- naverMap css -->
<link type="text/css" rel="stylesheet"
   href="styles/sunlight.default.css">
<link type="text/css" rel="stylesheet" href="styles/site.flatly.css">
<link type="text/css" rel="stylesheet" href="./css/highlightjs.css">

<style>
@import
   url(https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css)
   ;

body {
   font-family: 'NanumSquare', sans-serif;
}

.container {
   padding-top: 20px;
}

.input-group {
   position: absolute;
   z-index: 1000;
   top: 20px;
   left: 20px;
   width: 40%;
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

<script type="text/javascript">
   $(document).ready(function() {
      var formObj = $("form[name='readForm']");
      
      // 댓글 작성
      $(".replyWriteBtn").on("click", function() {
         var formObj = $("form[name='replyForm']");
         formObj.attr("action", "/party/replyWrite");
         formObj.submit();
      });
      
      //댓글 수정 View
      $(".replyUpdateBtn").on("click", function(){
         location.href = "/party/replyUpdateView?party_id=${read.party_id}"
                     + "&page=${scri.page}"
                     + "&perPageNum=${scri.perPageNum}"
                     + "&searchType=${scri.searchType}"
                     + "&keyword=${scri.keyword}"
                     + "&c_id="+$(this).attr("data-c_id");
      });
            
      //댓글 삭제 View
      $(".replyDeleteBtn").on("click", function(){
         location.href = "/party/replyDeleteView?party_id=${read.party_id}"
            + "&page=${scri.page}"
            + "&perPageNum=${scri.perPageNum}"
            + "&searchType=${scri.searchType}"
            + "&keyword=${scri.keyword}"
            + "&c_id="+$(this).attr("data-c_id");
      });
      
   })
</script>

<body>
   <!-- navbar -->

   <%-- <%@include file="/WEB-INF/views/navbar.jsp" %> --%>

   <!-- 지도를 초기화할 때 size를 지정하지 않으면, 초기화 시점의 지도 DOM컨테이너의 크기로 지도 크기 설정
      이후 setSize 메서드를 이용해 지도 크기를 변경하기 전까지 지도 크기는 고정됨 -->
   <div class="container">
      <div id="map" style="width: 55%; height: 55%;">
         <div class="input-group">
            <input id="address" name="address" type="text" placeholder="검색할 주소"
               class="form-control" />
            <button id="searchBtn" type="button"
               class="btn btn-outline-secondary">검색</button>
         </div>
      </div>

      <!------------------------------------ 댓글 -------------------------------->
      
   
      <form name="replyForm" method="post" class="form-horizontal">
          <input type="hidden" id="user_id" name="user_id" value="${loginID}">
         <input type="hidden" id="party_id" name="party_id" value="${read.party_id}" /> 
         <input type="hidden" id="page" name="page" value="${scri.page}"> 
         <input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
         <input type="hidden" id="searchType" name="searchType" value="${scri.searchType}">
         <input type="hidden" id="keyword" name="keyword" value="${scri.keyword}">
   
         <div class="form-group">
            <label for="c_message" class="col-sm-2 control-label">댓글내용</label>
            <div class="col-sm-10">
               <input type="text" id="c_message" name="c_message" class="form-control" />
            </div>
         </div>

         <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
               <button type="button" class="replyWriteBtn btn btn-success">작성</button>
            </div>
         </div>
      </form>
 <!-- 댓글 조회 -->
      <div id="reply">
         <ol class="replyList">
            <c:forEach items="${replyList}" var="replyList">
               <li>
                  <p>
                     작성자 : ${replyList.u_id}<br /> 
                     작성 날짜 : <fmt:formatDate value="${replyList.regdate}" pattern="yyyy-MM-dd" />
                  </p>
                  
                  <p>${replyList.c_message}</p>
                  
                  
                  <div>
                  <c:if test="${loginID == replyList.u_id}">
                       <button type="button" class="replyUpdateBtn btn btn-warning" data-c_id="${replyList.c_id}">수정</button>
                       <button type="button" class="replyDeleteBtn btn btn-danger" data-c_id="${replyList.c_id}">삭제</button>
                  </c:if>
                  </div>
                  
                     
                  
               </li>
            </c:forEach>
         </ol>
      </div>

      <!-- 댓글 끝-------------------------------------------------------------------------------------- -->

      <script type="text/javascript">
         var contentString = null;

         /** 지도 생성*/
         var map = new naver.maps.Map("map", {
            center : new naver.maps.LatLng(37.3595316, 127.1052133),
            /**처음 잡아주는 값*/
            zoom : 10,
            tileSize : new naver.maps.Size(50, 50),
            mapTypeControl : true
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
         var cityhall = new naver.maps.LatLng(37.3595316, 127.1052133), map = new naver.maps.Map(
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

                           var htmlAddresses = [], item = response.v2.addresses[0], point = new naver.maps.Point(
                                 item.x, item.y);

                           if (item.roadAddress) {
                              htmlAddresses.push('[도로명 주소] '
                                    + item.roadAddress);
                           }

                           if (item.jibunAddress) {
                              htmlAddresses.push('[지번 주소] '
                                    + item.jibunAddress);
                           }

                           /** 검색하면 나오는 상세창 */
                           contentString = infoWindow
                                 .setContent([
                                       '<div class="iw_inner">',
                                       '   <div class="iw_title">한방 오리백숙 먹방</div>',
                                       '      <div class="iw_content">',
                                       '      <p class="info_content">날짜: 22일 수요일<br />',
                                       '       시간: 18시<br />',
                                       '       모집인원: 4명<br />',
                                       '       비용: 30,000원<br />',
                                       '       장소: '
                                             + htmlAddresses
                                                   .join('<br />'),
                                       '</p>',
                                       '      <p class="thick">많이 먹을 수 있는 분 모집해요!한글로막쓰고 ㅇㅆ는데 왜안나왕!</p>',
                                       '      </div>',
                                       '</div>',
                                       '<div class="apply_bt">',
                                       '<button type="submit" class="btn btn-outline-info" id="apply_party">신청하기</button>',
                                       '</div>' ].join('\n'));

                           map.setCenter(point);
                           infoWindow.open(map, point);
                        });
         }/** searchAddressToCoordinate() */

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
   </div>
</body>
</html>