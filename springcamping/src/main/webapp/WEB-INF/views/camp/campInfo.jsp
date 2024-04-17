<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<!doctype html>
<html class="no-js" lang="zxx">

<head>
	<%@ include file ="../include/head.jsp" %>
	<style>
	.container {
		max-width: 1300px;
		width: 1300px;
		margin: 0px 138px;
		padding: 0px 0px 100px;
	}
	
	.page_title {
		width: 100%;
		font-size: 40px;
		padding: 60px 0px 70px;
		color: #222222;
		text-align: center;
	}
	
	.sub_menu {
		width: 100%;
		display: flex;
		margin: 10px 0px 42px;
	}
	
	.campingbtnform {
		width: 432px;
		height: 65px;
		background-color: #777777;
		padding: 0;
		border: none;
	}
	
	.reservation {
		width: 400px;
		height: 70px;
		border: 4px solid #ff576f;
		font-size: 16px;
	}
	
	</style>
</head>

<body>
    <!-- header-start -->
    <header>
       <%@ include file ="../include/nav.jsp" %>
    </header>
    <!-- header-end -->

    <!-- bradcam_area_start -->
    <div class="bradcam_area breadcam_bg_1">
        <h3> 캠핑장 안내 </h3>
    </div>
    <!-- bradcam_area_end -->

    <!-- Main content -->
    
    <!-- div class = "본문" -->
    <div class = "container">
    
    <div>
	    <h3 class="page_title">캠핑장</h3>
		<ul class="sub_menu">
			<li class="sort_3"><button  class="campingbtnform" onclick="location.href='/camp/campInfo'">캠핑장 이용안내</button></li>
			<li class="sort_3"><button class="campingbtnform" onclick="location.href='/camp/campAll'">사이트 둘러보기</button></li>
	 		<li class="sort_3"><button  class="campingbtnform" onclick="location.href='/book/reservation'">캠핑장 실시간 예약</button></li> 
		</ul>
	</div>
    
    <div>
    <img style="width: 100%; height: 729px;" src="/resources/img/facilityImg/pix/campMap.jpg" />
    </div>
    
    <div style="margin: 65px 0px 70px; display: flex; justify-content: center;">
	    <button type="button" onClick="location.href='/book/reservation'" class="reservation" style="background-color: #ff576f; color: #fff;">캠핑장 예약하기</button>
	    <button type="button" onClick="location.href='/mypage/myResAll'" class="reservation" style="background-color: #fff; color: #ff576f; margin-left: 5px;">예약확인</button>
    </div>
    
   	<hr style="border-bottom: 1px solid #dddddd; margin: 0px 0px 70px">
   	
   	<div>
	    <h4>ㅁ예약안내</h4>
	    <ul>
		    <li>- 예약 후 3 시간 이내에 미입금 시 자동 취소됩니다.</li>
			<li>- 입실 및 퇴실 시간은 반드시 준수 바랍니다.</li>
			<li>- 최대 인원 초과 시 입실 및 환불이 불가합니다.</li>
			<li>- 미성년자는 보호자 동반 없이 이용하실 수 없습니다.</li>
			<li>- 객실 정리 후 퇴실 점검을 반드시 받으셔야 됩니다. ( 필요에 따라 퇴실보증금이 발생되며, 확인 후 환불 )</li>
			<li>- 가족 외 남녀 여러명이서 섞여서 1객실을 예약하실 수 없습니다.</li>
			<li>   예) 남2,여1 / 여3,남1명 등 여러 남여의 혼숙이 불가능하니 이런 경우 2개의 객실을 예약해주세요.</li>
	    </ul>
    </div>
    
    <br>
    <br>

	<div>
	<h4 style="padding: 0px 0px 0px 13px; color: #333333; font-size: 18px; letter-spacing: -1px; margin: 0px 0px 20px;">ㅁ캠핑 숙박금액</h4>
		<table style="width: 100%; border-top: 2px solid #555; border-bottom: 1px solid #555;">
		  <tr style="text-align:center">
		  	<td>사이트번호</td>
		  	<td>사이트넓이</td>
		  	<td>입실시간</td>
		  	<td>퇴실시간</td>
		  	<td>기본인원</td>
		  	<td>추가가능인원</td>
		  	<td>최대가능인원</td>
		  	<td>가격</td>
		  </tr>
		<c:forEach var="campInfo" items="${campAll }">
		  <tr style="text-align:center">
		 	<td>${campInfo.camp_no}</td>
		 	<td>${campInfo.camp_size}</td>
		 	<td>${campInfo.camp_checkin}</td>
		 	<td>${campInfo.camp_checkout}</td>
		 	<td>${campInfo.camp_defperson}</td>
		 	<td>${campInfo.camp_addperson}</td>
		 	<td>${campInfo.camp_allperson}</td>
		 	<td>${campInfo.camp_price}</td>
		  </tr>
		</c:forEach>
		</table>
	</div>
    	
	<br>
	<br>
	
	<div>
    <h4>ㅁ추가옵션(1일 기준 대여가격)</h4>
		<table style="width: 100%; border-top: 2px solid #555; border-bottom: 1px solid #555;">
		  <tr style="text-align:center">
		  	<td>렌탈물품명</td>
		  	<td>설명</td>
		  	<td>렌탈물품가격</td>
		  </tr>
		<c:forEach var="rentalInfo" items="${rentalAll }">
		  <tr style="text-align:center">
		 	<td>${rentalInfo.rental_name}</td>
		 	<td>${rentalInfo.rental_content}</td>
		 	<td>${rentalInfo.rental_price}</td>
		 </tr>
		</c:forEach>
		</table>
    </div>
    	
	<br>
	<br>
	
    <div>
    <h4>ㅁ주의사항</h4>
    <ul>
	    <li>- 2인기준 물품이며, 개인 세안도구 및 수건은 비치되어 있지 않습니다.</li>
		<li>( * 개인 세면도구 및 타올은 꼭 챙겨와주세요. )</li>
		<li>- 추가인원이 발생할 경우 반드시 사전 등록 해야 합니다.</li>
		<li>- 추가인원 물품은 사전에 준비해야 하는 관계로 현장에서 추가인원 등록은 불가합니다.</li>
		<li><b>- 흡연구역은 캠핑장 입구에 있습니다.</b></li>
    </ul>
    </div>
			
    </div>
    <!-- Main content End -->

    <!-- footer -->
<%@ include file ="../include/footer.jsp" %>

    <!-- form itself end-->
    
    <!-- 에약이랑 로그인 버튼인데..... 그건 구현 후 붙일거임! 여기 건들 ㄴㄴ -->
    
	<!-- form itself end -->

</body>

</html>