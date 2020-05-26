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
<title>상세페이지</title>
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

   <div id="map" style="width: 50%; height: 55%;"></div>

   <script type="text/javascript">
   var m=null;
   var contentString=null;
   <c:forEach items="${read}" var="read" >

   /** 마커 위치 설정 코드*/
   var m = new naver.maps.LatLng(${read.p_lati},${read.p_long});
    
   /** 받아온 위치에 마커 찍기코드*/
   var contentString = [
          '<div class="iw_inner">',
          
          '<table>',

          '<div class="iw_title">모집 상세 정보</div>',
          '<tr><td><label for="party_title" style="font-weight: bold; ">제목&nbsp;&nbsp;</label><c:out value="${read.party_title}" /></td></tr>',
          '<tr><td><label for="p_date" style="font-weight: bold;">날짜&nbsp;&nbsp;</label><c:out value="${read.p_date}" /></td></tr>',
          '<tr><td><label for="p_num" style="font-weight: bold;">인원수&nbsp;&nbsp;</label><c:out value="${read.p_num}" /></td></tr>',

          '<tr><td><input type="hidden" id="p_long" name="p_long" /></td></tr>',
          '<tr><td><input type="hidden" id="p_lati" name="p_lati" /></td></tr>',

          '<tr>',
          ' <td>',
          '   <label for="p_gender" style="font-weight: bold;">성별&nbsp;&nbsp;</label>',
          '   <c:out value="${read.p_gender}" />',
          ' </td>',
          '</tr>',
          '<tr><td><label for="p_cost" style="font-weight: bold;">예상비용&nbsp;&nbsp;</label><c:out value="${read.p_cost}" /></td></tr>',
          '<tr><td><label for="p_note" style="font-weight: bold;">파티내용&nbsp;&nbsp;</label><c:out value="${read.p_note}" /></td></tr>',
          '<tr><td><label for="p_location" style="font-weight: bold;">장소</label><c:out value="${read.p_location}" /></td></tr>',
         
          '<tr>',
          ' <td>',
          '   <label for="hashtag" style="font-weight: bold;">해시태그&nbsp;&nbsp;</label><c:out value="${mypageList.hashtag}" />',
          ' </td>',
          '</tr>',
          '<tr>',
          ' <td>',
          '<form method="get" action="/pick/joininsert" >',
          '   <input type="hidden" name = "party_id" value = "${read.party_id}"/>',
          '   <button type="submit" class="btn btn-outline-info" id="apply_party">신청하기</button>',
          '</form>',
          ' </td>', 
          '</tr>',
          '</table>',
          '</div>' ].join('\n');
   </c:forEach>
   var marker = new naver.maps.Marker({
      map : map,
      position : m,
      zIndex : 100
   });   
    
        
   /** 지도 생성*/
   var map = new naver.maps.Map('map', {
      center : new naver.maps.LatLng(marker),
      zoom : 10,
      tileSize : new naver.maps.Size(50, 50)
   });
   
      
   /** 검색 주소 결과창 내용*/
   var infoWindow = new naver.maps.InfoWindow({
      content : contentString
   });

   
   naver.maps.Event.addListener(marker, "click", function(e) {
         if (infowindow.getMap()) {
                  infowindow.close();
            } else {
                  infowindow.open(map, marker);
            }
   });
      

</script>


</body>
</html>