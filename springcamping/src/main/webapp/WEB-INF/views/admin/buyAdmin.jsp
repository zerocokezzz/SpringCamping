<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
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
        <h3> 구매내역 </h3>
    </div>
    <!-- bradcam_area_end -->

    <!-- Main content -->
    
    <div class = "구매내역">
    
    <div>
    	<br>
		 <button class="genric-btn success circle" type="button" class="signin__btn" onclick="location.href='../admin/buyInsert'">구매등록</button>  
	    <table>
		<tr>
			<th>구매번호</th>
			<th>상품</th>
			<th>고객아이디</th>
			<th>픽업일</th>
			<th>구매수량</th>
			<th>결제완료번호</th>
			<th>결제번호</th>
			<th>상세보기</th>
		</tr>
		<c:forEach var="buyListAdmin" items="${buyListAdmin}">
		<tr>
			<td>${buyListAdmin.buy_no }</td>
			<td>${buyListAdmin.shop_no}</td>
			<td>${buyListAdmin.user_id}</td>
			<td>${buyListAdmin.buy_date }</td>
			<td>${buyListAdmin.buy_amount }</td>
			<td>${buyListAdmin.payin_no}</td>
			<td>${buyListAdmin.pay_no}</td>
			<td><a href="buyDetail?shop_no=${buyListAdmin.shop_no }&buy_no=${buyListAdmin.buy_no }&pay_no=${buyListAdmin.pay_no}"><button>♡</button></a></td>			
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