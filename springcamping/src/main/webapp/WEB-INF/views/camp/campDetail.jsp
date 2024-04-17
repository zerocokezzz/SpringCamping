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
    <!-- header-start -->
    <header>
       <%@ include file ="../include/nav.jsp" %>
    </header>
    <!-- header-end -->

    <!-- bradcam_area_start -->
    <div class="bradcam_area breadcam_bg_1">
        <h3> 캠핑장 상세보기 </h3>
    </div>
    <!-- bradcam_area_end -->

    <!-- Main content -->
    <div class = "본문">
		<div class="box-body">
			<div class="mt-10">
				<label>캠핑정보번호</label> <input type="text"
					name="camp_no" class="form-control" value="${campInfo.camp_no}" readonly>
			</div>
			<div class="mt-10">
				<label>사이트타입</label> <input type="text"
					name="camp_type" class="form-control" value="${campInfo.camp_type}" readonly>
			</div>
			<div class="mt-10">
				<label>사이트번호</label> <input type="text"
					name="camp_index" class="form-control" value="${campInfo.camp_index}" readonly>
			</div>
			<div class="mt-10">
				<label>사이트넓이</label> <input type="text"
					name="camp_size" class="form-control" value="${campInfo.camp_size}" readonly>
			</div>
			<div class="mt-10">
				<label>사이트갯수</label> <input type="text"
					name="camp_cnt" class="form-control" value="${campInfo.camp_cnt}" readonly>
			</div>
			<div class="mt-10">
				<label>입실시간</label> <input type="text"
					name="camp_checkin" class="form-control" value="${campInfo.camp_checkin}" readonly>
			</div>
			<div class="mt-10">
				<label>퇴실시간</label> <input type="text"
					name="camp_checkout" class="form-control" value="${campInfo.camp_checkout}" readonly>
			</div>
			<div class="mt-10">
				<label>가격</label> <input type="text"
					name="camp_price" class="form-control" value="${campInfo.camp_price}" readonly>
			</div>
			<div class="mt-10">
				<label>설명</label>
				<textarea class="form-control" name="camp_content" rows="3"
					readonly>${campInfo.camp_content}</textarea>
			</div>
			<div class="mt-10">
				<label>추가내용</label>
				<textarea class="form-control" name="camp_etc" rows="3"
					readonly>${campInfo.camp_etc}</textarea>
			</div>
			<div class="mt-10">
				<label>기본인원</label> <input type="text"
					name="camp_defperson" class="form-control" value="${campInfo.camp_defperson}" readonly>
			</div>
			<div class="mt-10">
				<label>추가가능인원</label> <input type="text"
					name="camp_defperson" class="form-control" value="${campInfo.camp_addperson}" readonly>
			</div>
			<div class="mt-10">
				<label>최대가능인원</label> <input type="text"
					name="camp_defperson" class="form-control" value="${campInfo.camp_allperson}" readonly>
			</div>
			<c:forEach var="imgDTO" items="${imgDTO }">
				<div class="aa">
					<label>이미지</label>
					<img src="../resources/img/facilityImg/campImg/${imgDTO.img_name}" width="200" height="150" name="img_name">
				</div>
			</c:forEach>
			<c:if test="${user.user_admin==true }">
				<div class="button-group-area" style="float: right;">
					<a href="campUpdate?camp_no=${campInfo.camp_no }" class="genric-btn primary">캠핑정보 수정</a>
				</div>
				<div class="button-group-area" style="float: right;">
					<a href="campDelete?img_parents=${campInfo.camp_no }" class="genric-btn primary">캠핑정보 삭제</a>
				</div>
			</c:if>
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