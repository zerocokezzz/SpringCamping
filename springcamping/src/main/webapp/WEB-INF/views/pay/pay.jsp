<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <%@ include file ="../include/head.jsp" %> 
     <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>결제하기 버튼</title>
    <!-- 포트원 결제 -->
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
    <!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    <!-- 포트원 결제 -->
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
        <h3> 제목 </h3>
    </div>
    <!-- bradcam_area_end -->

    <!-- Main content -->
    
    <div class = "본문">
    
	<table>
		<form id="pay_form" method="post" action="application_process">
			<input type="hidden" name="p_id" value="${party.p_id}"> 
			<input type="hidden" name="a_price" value="${party.p_price}"> 
			<input type="hidden" name="u_id" value=<%=session.getAttribute("u_id")%>>
			<input type="hidden" name="p_title" value="${party.p_title}">
			<h2>파티 번호</h2>
			<table class="moveReview_list">
				<tr>
					<td>${party.p_id}</td>
				</tr>
			</table>
			<h2>파티 제목</h2>
			<table>
				<tr>
					<td>${party.p_title}</td>
				</tr>
			</table>
			<h2>결제 금액</h2>
			<table>
				<tr>
					<td>${party.p_price}</td>
				</tr>
			</table>
			<h2>결제 방법 선택</h2>
			<table>	
				<tr>
					<td><label><input type="radio" name="a_payment" value="카카오페이">카카오페이
						</label> <label><input type="radio" name="a_payment" value="무통장입금">무통장입금</label></td>
				</tr>
			</table>
			<br>
			<div class="a">
				<button id="pay" class="test_btn1">신청하기</button>
			</div>
		</form>
	</table>    
    
    </div>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type='text/javascript'>
	$('#pay').on('click', function(e) {
		e.preventDefault();
		var a_payment = $("input[type=radio][name=a_payment]:checked").val();
		if($("input[type=radio][name=a_payment]:checked").is(':checked')){
			if(a_payment == '카카오페이'){
				//가맹점 식별코드
				IMP.init('imp84311544');
				IMP.request_pay({
					pg : 'kakaopay',
					pay_method : 'card',
					merchant_uid : 'merchant_' + new Date().getTime(),
					name : '물품명', //결제창에서 보여질 이름
					amount : 물품가격(숫자), //실제 결제되는 가격
					buyer_email : 'iamport@siot.do',
					buyer_name : '구매자이름',
					buyer_tel : '010-1234-5678',
					buyer_addr : '서울 강남구 도곡동',
					buyer_postcode : '123-456'
				}, function(rsp) {
					console.log(rsp);
					if (rsp.success) {
						var msg = '결제가 완료되었습니다.';
						msg += '고유ID : ' + rsp.imp_uid;
						msg += '상점 거래ID : ' + rsp.merchant_uid;
						msg += '결제 금액 : ' + rsp.paid_amount;
						msg += '카드 승인번호 : ' + rsp.apply_num;
						var actionForm =$("#pay_form");
						const a_completed = $("<input type='hidden' value='T' name='a_completed'>");
						actionForm.append(a_completed);
						console.log(actionForm);
						actionForm.find("input[name='p_id']").val($(this).attr("href"));
						actionForm.submit();
					} else {
						var msg = '결제에 실패하였습니다.';
						msg += '에러내용 : ' + rsp.error_msg;
					}
					alert(msg);
				});

			}else{
				var actionForm =$("#pay_form");
				const a_completed = $("<input type='hidden' value='F' name='a_completed'>");
				actionForm.append(a_completed);
				console.log(actionForm);
				actionForm.find("input[name='p_id']").val($(this).attr("href"));
				actionForm.submit();
			}
		}else{
			alert('결제 수단을 선택해주세요.');
		}
		
	});
</script>
</body>

</html>