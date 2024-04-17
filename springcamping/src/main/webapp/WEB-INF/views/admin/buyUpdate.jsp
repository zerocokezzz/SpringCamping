<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
<%@ include file="../include/head.jsp"%>
</head>

<body>
	<!--[if lte IE 9]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
        <![endif]-->

	<!-- header-start -->
	<header>
		<%@ include file="../include/nav.jsp"%>
	</header>
	<!-- header-end -->

	<!-- bradcam_area_start -->
	<div class="bradcam_area breadcam_bg_1">
		<h3>구매수정</h3>
	</div>
	<!-- bradcam_area_end -->

	<!-- Main content -->

	<div class="구매수정">
		<form action="/admin/buyUpdatePost" method="POST">
			<table>
				<tr>
					<td>고객아이디</td>
					<td>${buy.user_id }</td>
				</tr>
				<tr>
					<td>상품</td>
					<td><input type="text" value="${shopInfo.shop_name }"></td>
				</tr>
				<tr>
					<td>픽업날짜</td>
					<td><input type="date" max="2030-12-31" name="buy_date"	value=${buy.buy_date }></td>
				</tr>
				<tr>
					<td>수량</td>
					<td><input type="text" name="buy_amount"
						value="${buy.buy_amount }"></td>
				</tr>
				<tr>
					<td>결제방식</td>
					<td>${pay.pay_ment}</td>
				</tr>
				<tr>
					<td>결제금액</td>
					<td>${pay.pay_price}</td>
				</tr>
				<tr>
					<td>결제일</td>
					<td>${pay.pay_datetime }</td>
				</tr>
				<tr>
					<td>결제상태</td>
					<td>
						<select name="buy_paystate">
							<option value="O">결제완료</option>
							<option value="X">결제취소</option>
						</select>
					</td>
				</tr>
				<tr>
					<td><input type="submit" value="수정하기"></td>
					<td>
						<a href="buyDetail?shop_no=${shopInfo.shop_no }&buy_no=${buy.buy_no }&pay_no=${pay_no }">
							<input type="button" value="취소">
						</a>
					</td>
				</tr>
			</table>

			<input type="hidden" name="buy_no" value=${buy.buy_no }> 
			<input type="hidden" name="user_id" value="${buy.user_id}"> 
			<input type="hidden" name="pay_no" value=${pay_no }> 
			<input type="hidden" name="shop_no" value=${buy.shop_no }>

		</form>
	</div>
	<!-- Main content End -->

	<!-- footer -->
	<%@ include file="../include/footer.jsp"%>


	<!-- form itself end-->

	<!-- 에약이랑 로그인 버튼인데..... 그건 구현 후 붙일거임! 여기 건들 ㄴㄴ -->

	<!-- form itself end -->

</body>

</html>