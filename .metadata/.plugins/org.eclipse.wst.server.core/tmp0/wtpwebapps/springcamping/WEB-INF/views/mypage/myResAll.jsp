<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <%@ include file ="../include/head.jsp" %> 
	<style>
table {
	border-collapse: collapse;
	width: 80%;
	margin: 1rem auto;
	background-color: white;
}

thead {
	box-shadow: 4px 4px 10px rgba(0, 0, 0, 0.1);
}

/* 테이블 행 */
td {
	padding: 8px;
	text-align: left;
	border-bottom: 1px solid #ddd;
	text-align: center;
}

th {
	padding: 8px;
	text-align: left;
	text-align: center;
	border-top: 2px solid #000;
	border-bottom: 2px solid #000;
	color: #000;
}

/* 테이블 올렸을 때 */
tbody tr:hover {
	background-color: #d3d3d3;
	opacity: 0.9;
	cursor: pointer;
}

/* 테이블 비율 */
th:nth-child(1), td:nth-child(1) {
	width: 5%;
}

th:nth-child(2), td:nth-child(2) {
	width: 15%;
}

th:nth-child(3), td:nth-child(3) {
	width: 10%;
}
th:nth-child(4), td:nth-child(4) {
	width: 10%;
}
th:nth-child(5), td:nth-child(5) {
	width: 10%;
}
th:nth-child(6), td:nth-child(6) {
	width: 10%;
}
th:nth-child(7), td:nth-child(7) {
	width: 10%;
}
th:nth-child(8), td:nth-child(8) {
	width: 10%;
}
th:nth-child(9), td:nth-child(9) {
	width: 10%;
}
th:nth-child(10), td:nth-child(10) {
	width: 10%;
}

th, td {
	border-left: none;
	border-right: none;
}
</style>
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
    </div>
    <!-- bradcam_area_end -->

    <!-- Main content -->
    
    <div class="section_title text-center mb-100">
    
    <div>
    	
    	<div class="row" style="margin-bottom: 20px; margin-left: 1px;">
		<div class="col-lg-12">
		<br>
        	<h3>예약내역</h3>
		</div>
		</div>
		
		
	    <table>
			<tr>
				<th>예약번호</th>
				<th>입실일</th>
				<th>퇴실일</th>
				<th>인원</th>
				<th>결제상태</th>
				<th>방번호</th>
				<th>결제완료번호</th>
				<th>결제번호</th>
				<th>상세보기</th>
			</tr>
			<c:forEach var="resList" items="${resList}">
			<tr>
				<td>${resList.res_no }</td>
				<td>${resList.campres_checkin }</td>
				<td>${resList.campres_checkout }</td>
				<td>${resList.campres_person }</td>
				<td>${resList.res_paystate}</td>
				<td>${resList.camp_no}</td> 
				<td>${resList.payin_no}</td>
				<td>${resList.pay_no}</td>
				<td><a href="myResDetail?res_no=${resList.res_no}&pay_no=${resList.pay_no}"><button>♡</button></a></td>
			</tr>				
			</c:forEach>
		</table>
	</div>
	<div>
		<div class="row" style="margin-bottom: 20px; margin-left: 1px;">
		<div class="col-lg-12">
		<br>
        	<h3>예약취소내역</h3>
		</div>
		</div>

		<table>
			<tr>
				<th>예약번호</th>
				<th>방번호</th>
				<th>입실일</th>
				<th>퇴실일</th>
				<th>인원</th>
				<th>결제취소번호</th>
				<th>결제취소금액</th>
				<th>결제취소방식</th>
				<th>결제취소일</th>
			</tr>
			<c:forEach var="resOutList" items="${resOutList }">
			<tr>
				<td>${resOutList.res_no }</td>
				<td>${resOutList.camp_no }</td>
				<td>${resOutList.campres_checkin }</td>
				<td>${resOutList.campres_checkout}</td>
				<td>${resOutList.campres_person}</td>
				<td>${resOutList.payout_no}</td>
				<td>${resOutList.payout_price}</td>
				<td>${resOutList.payout_ment}</td>
				<td>${resOutList.payout_date}</td>
			</tr>
			</c:forEach>
		</table>
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