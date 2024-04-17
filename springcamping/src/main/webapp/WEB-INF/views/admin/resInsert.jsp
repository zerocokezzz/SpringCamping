<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
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

    <!-- header-start -->
    <header>
       <%@ include file ="../include/nav.jsp" %>
    </header>
    <!-- header-end -->

    <!-- bradcam_area_start -->
    <div class="bradcam_area breadcam_bg_1">
        <h3> 예약등록 </h3>
    </div>
    <!-- bradcam_area_end -->

    <!-- Main content -->
    
    <div class = "예약등록">
    
    <form action="resAddCamp" method = "post">
    <table class="resInsert">
    	<tr>
    		<td>방번호</td>
    		<td><input type="text" name="camp_no"></td>
    	</tr>
    	<tr>
    		<td>예약자</td>
    		<td><input type="text" name="user_id"></td>
    	</tr>
    	<tr>
    		<td>입실일</td>
    		<td><input type="date" max="2030-12-31" name="campres_checkin"></td>
    	</tr>
    	<tr>
    		<td>퇴실일</td>
    		<td><input type="date" max="2030-12-31" name="campres_checkout"	></td>
    	</tr>
    	<tr>
    		<td>인원</td>
    		<td><input type="text" name="campres_person"></td>
    	</tr>
		<c:forEach var = "rentalinfo" items = "${rentalinfo }" >
			<tr>
				<td><input type="checkbox" name="${rentalinfo.rental_no}">${rentalinfo.rental_name }</td>
				<td> 수량 : <input type="number" name="${rentalinfo.rental_no }_cnt" value="0"></td>
			</tr>
		</c:forEach>
		<tr>
			<td> 결제방식 </td> 
			<td><input type="text" name="pay_ment"></td>
		</tr>
		<tr>
			<td> 결제금액 </td> 
			<td><input type="text" name="pay_price"></td>
		</tr>
    </table>
    	<input type="submit" value="완료">
    	<input type="reset" value="초기화">
    </form>
   		<a href="resAdmin"><button>목록</button></a>
    
    </div>
    <!-- Main content End -->
    
    <!-- footer -->
    <%@ include file ="../include/footer.jsp" %>
    
    
    <!-- form itself end-->
    
    <!-- 에약이랑 로그인 버튼인데..... 그건 구현 후 붙일거임! 여기 건들 ㄴㄴ -->
    
	<!-- form itself end -->

</body>

</html>