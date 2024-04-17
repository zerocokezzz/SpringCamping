<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ page import="kr.co.dong.DTO.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>nav</title>
</head>
<body>
   <header>
      <div class="header-area ">
         <div id="sticky-header" class="main-header-area">
            <div class="container-fluid p-0">
               <div class="row align-items-center no-gutters">
               
               <div class="col-1">
					<div class="logo-img">
	                   <a href="/">
	                   <img src="../resources/img/main/camping.png" alt="" style="width: 130px; height: 100px; ">
	                   </a>
	                </div>
	          </div>
               
	          <div class="col-9" style="justify-content: center;">
                     <div class="main-menu  d-none d-lg-block">
                        <nav>
                           <ul id="navigation">
                           
                              <li><a class="active" href="${contextPath }/springcamping/story">COMPANY
                            	  <i class="ti-angle-down"></i></a>
                                  <ul class="submenu">
                                    <li><a href="${contextPath }/springcamping/story">소개글</a></li>
									<li><a href="${contextPath }/springcamping/play">주변 놀거리</a></li>
	                                <li><a href="${contextPath }/springcamping/map">오시는 길</a></li>
                                 </ul></li>
                                 
                              <li><a href="${contextPath }/camp/campInfo">캠핑장안내</a></li>
                              
                              <li><a href="/rental/rentalAll">물품대여</a>
                              
                              <li><a href="/shop/shopAll">물품판매 <i class="ti-angle-down"></i></a>
                                               <ul class="submenu">
                                                   <li><a href="/shop/shopAll">Shop</a></li>
                                                   <li><a href="/shop/shopNew">New</a></li>
                                                   <li><a href="/shop/shopBest">BEST</a></li>
                                                   <li><a href="/shop/shopPromo">Promotion</a></li>
                                                   <li><a href="/shop/shopLimit">Limit</a></li>
                                               </ul>
                                           </li>
                                           
                              <li><a href="/amenities/store">편의시설 <i
                                    class="ti-angle-down"></i></a>
                                 <ul class="submenu">
                                    <li><a href="/amenities/store">매점</a></li>
                                    <li><a href="/amenities/toiletShowerKitchen">화장실·샤워실·개수대</a></li>
                                 </ul></li>
                                 
                              <li><a href="/board/noticeAll?num=1">고객센터<i class="ti-angle-down"></i></a>
                                 <ul class="submenu">
                                    <li><a href="../board/boardmain?num=1">커뮤니티</a></li>
	                                <li><a href="/board/noticeAll?num=1">공지사항</a></li>
                                    <li><a href="/board/qnalist?num=1">Q&A</a></li>
                                 </ul></li>
                                 
                       <%if (request.getSession().getAttribute("user") != null)  {%>
                                 
                              <li><a href="../mypage/mypage">MYPAGE<i class="ti-angle-down"></i></a>
                                 <ul class="submenu">
                                    <li><a href="/mypage/mypage">MYPAGE</a></li>
                                    <li><a href="/mypage/myResAll">예약내역</a></li>
                                    <li><a href="/mypage/myBuyAll">구매내역</a></li>
                                 </ul>
                               </li>
                               
                        <% } 
                           if (request.getSession().getAttribute("user") != null && ((UserDTO) request.getSession().getAttribute("user")).getUser_admin()) {
                        %>
                        <li><a href="${contextPath }/admin/sales">Admin<i class="ti-angle-down"></i></a>
                                 <ul class="submenu">
                                    <li><a href="${contextPath }/admin/resAdmin">예약내역</a></li>
                                    <li><a href="${contextPath }/admin/resOutAdmin">예약취소내역</a></li>
                                    <li><a href="${contextPath }/admin/buyAdmin">구매내역</a></li>
                                    <li><a href="${contextPath }/admin/buyOutAdmin">구매취소내역</a></li>
                                    <li><a href="${contextPath }/admin/sales">통계</a></li>
                                    <li><a href="${contextPath }/admin/userAdmin">회원관리</a></li>
                                    <li><a href="${contextPath }/camp/campAll">캠핑장관리</a></li>
                                    <li><a href="${contextPath }/rental/rentalAll">렌탈물품관리</a></li>
                                 </ul></li>
                        <% } %>

                           </ul>
                        </nav>
                     </div>
                  </div>
                  
	               <div class="col-2 d-none d-lg-block">
                     <div class="book_room">
								
                     
                        <div class="socail_links">
                           <ul>
                           	<li>
                        
                        <%
								if (request.getSession().getAttribute("user") != null) {
								%>
									<a href="../book/reservation">
										 <i class="fa fa-calendar" style="font-size:25px"></i>
									</a>
								<%
								}else{
								%>	
									<a onclick=loginAlert(); class="btn-title">
										<i class="fa fa-calendar" style="font-size:25px"></i>
									</a>
									<script>
										function loginAlert(){
											alert('로그인 후 이용해주세요.');
										}
									</script>
								<%
								}
								%>
                        
                        
                        
                        <%
                        if (request.getSession().getAttribute("user") == null) {
                        %>
                           <a href="../login/login" class="fa fa-user-circle-o" style="font-size:25px"></a>
                        <%
                        } else {
                        %>
                           <a href="/" class="fa fa-user-times" style="font-size:25px" onclick="btnlogout()"></a>
                        <%
                        }
                        %>
                        
                        <a onClick="window.open('https://www.instagram.com/mzcamping/')">
                              <i class="fa fa-instagram" style="font-size:25px"></i>
                              </a></li>
                           </ul>
                        </div>
                        
                     </div>
                  </div>

                        
                     </div>
                  </div>
                  
                  <div class="col-12">
                     <div class="mobile_menu d-block d-lg-none"></div>
                  </div>
                  
               </div>
            </div>
   </header>
   
   <!-- 카카오 로그인 -->
   <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
   
   <script type="text/javascript">
      function btnlogout() {
         if (confirm("로그아웃 하시겠습니까?")) {
            location.href = "/login/logout";
         }
      }
      
      
      
   </script>
</body>
</html>