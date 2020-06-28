<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style type="text/css">
   li {list-style: none; display:inline; padding: 6px;}
</style>
<script type="text/javascript">
$(document).ready(function(){
            $("#login").on("click", function(){
               //팝업 가운데 띄우기
               var popupWidth = 500;
               var popupHeight = 800;
               
               var popupX = (window.screen.width / 2) - (popupWidth / 2);
               // 만들 팝업창 width 크기의 1/2 만큼 보정값으로 빼주었음
               
               var popupY= (window.screen.height / 2) - (popupHeight / 2);
               // 만들 팝업창 height 크기의 1/2 만큼 보정값으로 빼주었음
               
               window.open('/user/loginform','windowpopup', 'status=no, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);
            })
            
               <!--picklist 가는 버튼-->
               $("#pickListBtn").on("click", function(){
                  var popupWidth = 500;
               var popupHeight = 800;
               
               var popupX = (window.screen.width / 2) - (popupWidth / 2);
               // 만들 팝업창 width 크기의 1/2 만큼 보정값으로 빼주었음
               
               var popupY= (window.screen.height / 2) - (popupHeight / 2);
               // 만들 팝업창 height 크기의 1/2 만큼 보정값으로 빼주었음
               
               window.open('../pick/picklist','windowpopup', 'status=no, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);
            

                    // location.href="../pick/picklist";
                })
                
               <!--popup으로 letterlist 가는 버튼-->
            
               $("#letterListBtn").on("click", function(){
                  var popupWidth = 500;
               var popupHeight = 800;
               
               var popupX = (window.screen.width / 2) - (popupWidth / 2);
               // 만들 팝업창 width 크기의 1/2 만큼 보정값으로 빼주었음
               
               var popupY= (window.screen.height / 2) - (popupHeight / 2);
               // 만들 팝업창 height 크기의 1/2 만큼 보정값으로 빼주었음
               
               window.open('../letter/letterlist','windowpopup', 'status=no, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);
            

                    //location.href="../letter/letterlist";
                })

                <!-- 로그인이 안되었을 경우 -->   
               $("#needLoginPickListBtn").on("click", function(){
                 alert("로그인이 필요합니다.");
                })
                
                $("#needLoginLetterListBtn").on("click", function(){
                 alert("로그인이 필요합니다.");
                })
            
         });
</script>

<ul>
   <li><a href="/party/list">파티 목록</a></li>
   <li><a href="/party/writeView">파티 작성</a></li>
   <li>
      <c:if test="${user != null}">
         <a href="/user/logout">로그아웃</a>
         
         <p>${user.u_id}님 안녕하세요.</p>
      </c:if>
      <c:if test="${user == null}">
      
      <a id="login">로그인</a>
      
      </c:if>
   </li>
   
   <li>
         <!--장바구니, 쪽지함 -->
      <div>
          <c:if test="${user != null}">
          <button id="pickListBtn" style="background-color:transparent;  border-color:transparent;">
               <img src="${pageContext.request.contextPath}/resources/img/cart.png"
                   style="background-color:transparent;  border-color:transparent;" width="30" height="30"/>
            </button>
            <button id="letterListBtn" style="background-color:transparent;  border-color:transparent;">
               <img src="${pageContext.request.contextPath}/resources/img/letter.png"
                   style="background-color:transparent;  border-color:transparent;" width="30" height="25"/>
            </button>
         </c:if>
         <c:if test="${user == null}">
             <button id="needLoginPickListBtn" style="background-color:transparent;  border-color:transparent;">
               <img src="${pageContext.request.contextPath}/resources/img/cart.png"
                style="background-color:transparent;  border-color:transparent;" width="30" height="30"/>
            </button>
            <button id="needLoginLetterListBtn" style="background-color:transparent;  border-color:transparent;">
               <img src="${pageContext.request.contextPath}/resources/img/letter.png"
                   style="background-color:transparent;  border-color:transparent;" width="30" height="25"/>
            </button>
         </c:if>
      
      </div>
   </li>
</ul>
