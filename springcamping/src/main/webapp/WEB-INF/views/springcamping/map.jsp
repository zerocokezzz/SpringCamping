<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <%@ include file ="../include/head.jsp" %> 
</head>

<body>
    <!--[if lte IE 9]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
        <![endif]-->

    <!-- header-start -->
    <header>
       <%@ include file ="../include/nav.jsp" %>
    </header>
    <!-- header-end -->

    <!-- bradcam_area_start -->
    <div class="bradcam_area breadcam_bg_1">
        <h3> 찾아오시는 길 </h3>
    </div>
    <!-- bradcam_area_end -->

    <!-- Main content -->
    
    <div class="row justify-content-center">
    
    
    <div class = "본문">
    
    <div class="section_title text-center mb-100">
	<div class="offers_area padding_top">
	<div class="row" style="margin-bottom: 20px; margin-left: 1px;">
	<div class="col-lg-12">
           <h3>찾아오시는 길</h3>
	</div>
	</div>
	</div>
	</div>
    <h1 class="page-header"> </h1>
    
    <!-- 카카오 지도 입력 -->
	
	<div id="map" style="width:600px;height:500px;"></div>

	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a267a0da5248587d62853318c7276e24"></script>

		
	<script type="text/javascript">		
		var mapContainer = document.getElementById('map'), 
	    mapOption = { 
	        center: new kakao.maps.LatLng(37.267950, 127.000108), 
	        level: 4
	    };

		var map = new kakao.maps.Map(mapContainer, mapOption); 

		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

		kakao.maps.event.addListener(map, 'zoom_changed', function() {        
	    
	    var level = map.getLevel();
	    
	    var message = '현재 지도 레벨은 ' + level + ' 입니다';
	    var resultDiv = document.getElementById('result');  
	    resultDiv.innerHTML = message;
	    
	});
	
		var markerPosition  = new kakao.maps.LatLng(37.267950, 127.000108); 

		var marker = new kakao.maps.Marker({
	    position: markerPosition
	});

		marker.setMap(map);
	
	</script><br>
	
    <!-- 주소 찾아오는길 정보 입력 -->

    	<div class="media contact-info">
        <span class="contact-info__icon"><i class="ti-home"></i></span>
        	<div class="media-body">
            	<h3>경기도 수원시 팔달구 덕영대로</h3>
            	<p>스프링 캠핑(수원역 인근 위치)</p>
			</div>
      	</div>
        <div class="media contact-info">
        <span class="contact-info__icon"><i class="ti-tablet"></i></span>
        	<div class="media-body">
            	<h3>010-000-0000</h3>
                	<p>문의사항이 있으면 연락주세요</p>
            </div>
        </div>
        <div class="media contact-info">
        <span class="contact-info__icon"><i class="ti-email"></i></span>
        	<div class="media-body">
            	<h3>reservation@springcamp.com</h3>
            </div>
		</div>
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