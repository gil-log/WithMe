<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- forEach 쓰려면 요걸 써줘야됨 import 느낌? -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- fmt날짜 포맷 써주려면 요걸 써줘야됨 import 느낌 -->
<html>
   <head>
   
      <!-- 합쳐지고 최소화된 최신 CSS -->
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
      <!-- 부가적인 테마 -->
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

      <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
       <title>장바구니</title>
       <!-- 페이징 가로 정렬 -->
       <style type="text/css">
         li {list-style: none; float: left; padding: 6px;}
      </style>
      
   </head>
   
   <body>
   <!-- 부트스트랩 -->
      <div>
         <ul>   
            <li>
               <h4>관심 목록 </h4>
               <hr/>
               <c:forEach items="${picklist}" var="picklist">
                  <c:if test="${picklist.pick_flag == 1}">
                  <div class="card text-white bg-primary mb-5" style="max-width: 60rem; margin:auto;">
                     <div class="card-header"></div>
                     <div class="card-body">
                        <h4 class="card-title">
                           <a href="/party/readView?party_id=${picklist.party_id}" style="color:white;">
                              <c:out value="${picklist.party_title}" />
                           </a>
                        </h4>
                        <p class="card-text" style="color:white;">
                           <fmt:formatDate value="${picklist.p_date}" pattern="yyyy-MM-dd" />
                           <c:out value="${picklist.u_id}" />
                        </p>
                        <div>
                           <form method="get" action="/pick/pickinsert" >
                              <input type="hidden" name = "party_id" value = "${list.party_id}"/>
                              <button type="submit" style="background-color:transparent;  border:0px transparent solid;">
                                 <img src="${pageContext.request.contextPath}/resources/img/fullheart.png" width="30" height="30"/>
                              </button>
                           </form>
                        
                        
                           <form method="get" action="/pick/joininsert" >
                              <input type="hidden" name = "party_id" value = "${list.party_id}"/>
                              <input type="submit" value = "join"/>
                           </form>
                        </div>
                     </div>
                  </div>
                  </c:if>
               </c:forEach>
            </li>
            <li>
               <h4> 매칭 이력 </h4>
               <hr/>
               <c:forEach items="${picklist}" var="picklist">
                  <c:if test="${picklist.join_flag == 1}">
                  <div class="card text-white bg-primary mb-5" style="max-width: 60rem; margin:auto;">
                     <div class="card-header"></div>
                     <div class="card-body">
                        <h4 class="card-title">
                           <a href="/party/readView?party_id=${picklist.party_id}" style="color:white;">
                              <c:out value="${picklist.party_title}" />
                           </a>
                        </h4>
                        <p class="card-text" style="color:white;">
                           <fmt:formatDate value="${picklist.p_date}" pattern="yyyy-MM-dd" />
                           <c:out value="${picklist.u_id}" />
                        </p>
                     </div>
                  </div>
                  </c:if>
               </c:forEach>
            </li>
         </ul>
      </div>
      
   </body>
</html>