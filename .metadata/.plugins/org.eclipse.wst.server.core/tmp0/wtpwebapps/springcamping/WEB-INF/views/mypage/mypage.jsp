<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ page import="kr.co.dong.DTO.*"%>
<%
UserDTO ud = (UserDTO) request.getSession().getAttribute("user");
%>

<!doctype html>
<html class="no-js" lang="zxx">


<head>
<%@ include file="../include/head.jsp"%>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>

<body onload="javascript:cart();">
	<header>
		<%@ include file="../include/nav.jsp"%>
	</header>
	<!-- bradcam_area_start -->
	<div class="bradcam_area breadcam_bg">
		<h3>MyPage</h3>
	</div>
	<!-- bradcam_area_end -->

	<!--================Blog Area =================-->
	<section class="blog_area single-post-area section-padding">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 posts-list">
					<div class="comments-area">
						<h4>장바구니</h4>
						<div id="cartList"></div>
						<br>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="blog_right_sidebar">
						<aside class="single_sidebar_widget search_widget">
							<form action="#">
								<div class="form-group">
									<div class="input-group mb-3">
										<p><%=ud.getUser_name()%>님 안녕하세요
										</p>
									</div>
								</div>
							</form>
						</aside>
						<aside class="single_sidebar_widget post_category_widget">
							<ul class="list cat-list">
								<li><a href="#" class="d-flex">
										<p>장바구니</p>
								</a></li>
								<li><a href="/mypage/userUpdate" class="d-flex">
										<p>회원정보 수정</p>
								</a></li>
								<li><a href="javascript:void(0)" class="d-flex"
									onclick="javascript:btndelete()">
										<p>회원탈퇴</p>
								</a></li>
							</ul>
						</aside>


					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================ Blog Area end =================-->






	<!-- footer -->
	<%@ include file="../include/footer.jsp"%>

	<!-- link that opens popup -->



	<!-- JS here -->
	<script src="/resources/js/vendor/modernizr-3.5.0.min.js"></script>
	<script src="/resources/js/vendor/jquery-1.12.4.min.js"></script>
	<script src="/resources/js/popper.min.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/owl.carousel.min.js"></script>
	<script src="/resources/js/isotope.pkgd.min.js"></script>
	<script src="/resources/js/ajax-form.js"></script>
	<script src="/resources/js/waypoints.min.js"></script>
	<script src="/resources/js/jquery.counterup.min.js"></script>
	<script src="/resources/js/imagesloaded.pkgd.min.js"></script>
	<script src="/resources/js/scrollIt.js"></script>
	<script src="/resources/js/jquery.scrollUp.min.js"></script>
	<script src="/resources/js/wow.min.js"></script>
	<script src="/resources/js/nice-select.min.js"></script>
	<script src="/resources/js/jquery.slicknav.min.js"></script>
	<script src="/resources/js/jquery.magnific-popup.min.js"></script>
	<script src="/resources/js/plugins.js"></script>
	<script src="/resources/js/gijgo.min.js"></script>

	<!--contact js-->
	<script src="/resources/js/contact.js"></script>
	<script src="/resources/js/jquery.ajaxchimp.min.js"></script>
	<script src="/resources/js/jquery.form.js"></script>
	<script src="/resources/js/jquery.validate.min.js"></script>
	<script src="/resources/js/mail-script.js"></script>

	<script src="/resources/js/main.js"></script>
	<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
	<script type="text/javascript">

		var payresult = false;
		var IMP = window.IMP;
		IMP.init('imp84311544');

		function btndelete() {
			if (confirm("탈퇴 하시겠습니까?")) {
				$.ajax({
					type : 'post',
					url : '/mypage/userDelete',
					dataType : 'json',
					success : function(result) {
						if (result.userDelete) {
							alert("탈퇴 되었습니다.");
							location.href = "/";
						} else {
							alert("탈퇴를 실패 하였습니다.");
						}
					},
					error : function() {
						alert('error');
					}
				});
			}
		}

		function cart() {
			$
					.ajax({
						type : 'get',
						url : '/mypage/cart',
						success : function(result) {
							var html = '';

							var sumTotal = 0;

							for (var i = 0; i < result.cartList.length; i++) {
								var data = result.cartList[i];
								var sum = data.shop_price * data.cart_amount;
								sumTotal += sum;

								html += '<div class="comment-list">';
								html += '<div class="single-comment justify-content-between d-flex">';
								html += '<div class="user justify-content-between d-flex">';
								html += '	<div class="thumb">';
								html += '	</div>';
								html += '	<div class="desc">';
								html += '		<div class="d-flex justify-content-beeen">';
								html += '			<div class="d-flex align-items-center">';
								html += '				<h5>';
								html += '					<a href="#">' + data.shop_name
										+ ' (' + data.cart_date + ')</a>';
								html += '				</h5>';
								html += '				<br>';
								html += '				<p class="date">'
										+ numberWithCommas(data.shop_price)
										+ '원 * '
										+ numberWithCommas(data.cart_amount)
										+ '개 = ' + numberWithCommas(sum)
										+ '원</p>';
								html += '				<button class="genric-btn success circle" type="button" onclick="btnDeleteCart('
										+ data.cart_no
										+ ')" style="margin-left: 50px; !important">장바구니 삭제</button>';
								html += '			</div>';
								html += '		</div>';
								html += '	</div>';
								html += '</div>';
								html += '</div>';
								html += '</div>';
							}

							html += '<div class="comment-list">';
							html += '<div class="single-comment justify-content-between d-flex">';
							html += '<div class="user justify-content-between d-flex">';
							html += '	<div class="desc">';
							html += '		<div class="d-flex justify-content-beeen">';
							html += '			<div class="d-flex align-items-center">';
							html += '				<p id="cartAmount" class="date">'
									+ '합계: ' + numberWithCommas(sumTotal)
									+ '원</p>';
							html += '			</div>';
							html += '		</div>';
							html += '	</div>';
							html += '</div>';
							html += '<div class="reply-btn">';
							html += '<a href="javascript:cartPay('
									+ sumTotal
									+ ')" class="btn-reply text-uppercase">결제하러가기>>></a>'
							html += '</div>';
							html += '</div>';
							html += '</div>';

							$('#cartList').html(html);
						},
						error : function() {
							alert('error');
						}
					});
		}

		function numberWithCommas(x) {
			return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}

		
		function btnDeleteCart(cartNo) {
			if (confirm("정말 삭제하시겠습니까?")) {
				const data = {
					'cart_no' : cartNo
				}

				$.ajax({
							type : 'post',
							url : '/mypage/delete/cart',
							data : data,
							async : true,
							contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
							success : function(result) {
								alert("장바구니 삭제가 완료되었습니다.");
								location.reload();
							},
							error : function() {
								alert('error');
							}
						})
			}
		}
		
		function cartPay(cartAmount) {
			// 카카오 페이 결제
			IMP.request_pay(
							{
								pg : "kakaopay",
								pay_method : 'card',
								merchant_uid : 'merchant_'
										+ new Date().getTime(),
								name : "장바구니 구매",
								amount : cartAmount
							},
							function(rsp) {
								// 구매 내역 DB 추가
								if (rsp.success) {
									const data = {
										'buy_amount' : $('#buy_amount').val(),
										'cart_no' : $('#cart_no').val(),
									}

									$.ajax({
										type : 'post',
										url : '/mypage/cart/pay',
										dataType : 'json',
										contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
										success : function(result) {
											if (result.success) {
												alert("구매를 완료 했습니다.");
												location.href = "/mypage/myBuyAll";
											}
										},
										error : function() {
											alert('error');
										}
									});
								} else {
									msg = '결제에 실패하였습니다.';
									msg += '에러내용 : ' + rsp.error_msg;
									alert(msg);
								}
							});
		}

		
	</script>

</body>

</html>