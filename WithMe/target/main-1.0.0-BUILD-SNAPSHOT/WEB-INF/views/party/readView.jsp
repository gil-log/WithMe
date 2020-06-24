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
   url(https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css);

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
		<div>
			<%@include file="side.jsp"%>
		</div> 



   <div id="map" style="width: 50%; height: 55%; left:25%; top:10%;"></div>


	<!------------------------------------ 댓글 -------------------------------->
		
	<div style="margin: 120px 0px 0px 300px; left:25%; top:20%;">
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
	</div>
		<!-- 댓글 끝-------------------------------------------------------------------------------------- -->


   <script type="text/javascript">
  
   
   //++ 마커 이미지 해쉬태그에 맞게 바꿔주는 부분
   var hashtagurl = '';
   var hashtag = '${read.hashtag}';
   switch(hashtag){
   case '#여행' : 
	   hashtagurl = 'travel.png'; break;
   case '#먹방' : 
	   hashtagurl = 'mukbang.png'; break;
   case '#오락' : 
	   hashtagurl = 'acade.png'; break;
   case '#힐링' : 
	   hashtagurl = 'healing.png'; break;
   case '#사진' : 
	   hashtagurl = 'photo.png'; break;
   case '#번개' : 
	   hashtagurl = 'thunder.png'; break;
   default : 
	   hashtagurl = 'question.png'; break;
   }

   /** 마커 위치 설정 코드*/
   //++ 마커 이미지 해쉬태그에 맞게 뜨게됨
   var locc = new naver.maps.LatLng(${read.p_lati},${read.p_long}),
      map = new naver.maps.Map('map', {
       center: locc.destinationPoint(0, 500),
       zoom: 15
   }),
   marker = new naver.maps.Marker({
       position: locc,
       map: map,
       icon: {
    	   url: '${pageContext.request.contextPath}/resources/img/' + hashtagurl,
           size: new naver.maps.Size(50, 52),
           origin: new naver.maps.Point(0, 0),
           anchor: new naver.maps.Point(25, 26)
       }
   });
   
   /** 받아온 위치에 마커 찍기코드*/
   var contentString = [
          '<div class="iw_inner">',
          
          '<table>',

          '<div class="iw_title">모집 상세 정보</div>',
          '<tr><td><label for="party_title" style="font-weight: bold; ">제목&nbsp;&nbsp;</label>${read.party_title}</td></tr>',
          '<tr><td><label for="p_date" style="font-weight: bold;">날짜&nbsp;&nbsp;</label>${read.p_date}</td></tr>',
          '<tr><td><label for="p_num" style="font-weight: bold;">인원수&nbsp;&nbsp;</label>${read.p_num}</td></tr>',

          '<tr><td><input type="hidden" id="p_long" name="p_long" /></td></tr>',
          '<tr><td><input type="hidden" id="p_lati" name="p_lati" /></td></tr>',

          '<tr><td><label for="p_gender" style="font-weight: bold;">성별&nbsp;&nbsp;</label>${read.p_gender}</td></tr>',
          '<tr><td><label for="p_cost" style="font-weight: bold;">예상비용&nbsp;&nbsp;</label>${read.p_cost}</td></tr>',
          '<tr><td><label for="p_note" style="font-weight: bold;">파티내용&nbsp;&nbsp;</label>${read.p_note}</td></tr>',
          '<tr><td><label for="p_location" style="font-weight: bold;">장소</label>${read.p_location}</td></tr>',
         
          '<tr><td><label for="hashtag" style="font-weight: bold;">해시태그&nbsp;&nbsp;</label>${read.hashtag}</td></tr>',
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

      
   /** 검색 주소 결과창 내용*/
   var infowindow = new naver.maps.InfoWindow({
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