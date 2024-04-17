<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <%@ include file ="../include/head.jsp" %> 
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script>
	$(document).ready(function() {
	    // 날짜 선택기 초기화
	    $("#datepicker").datepicker({
	        dateFormat: 'yy-mm-dd',
	        showOtherMonths: true,
	        showMonthAfterYear: true,
	        changeYear: true,
	        changeMonth: true,
	        showOn: "both",
	        buttonText: "선택",
	        yearSuffix: "년",
	        monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
	        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	        dayNamesMin: ['일','월','화','수','목','금','토'],
	        dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'],
	        minDate: "-1M",
	        maxDate: "+1M"
	    });

	 // 조회 버튼 클릭 시
	    $("#sales_selectDate").click(function() {
	        var start_pay_datetime = $("#start_pay_datetime").val().replace(/-/g, '');
	        var end_pay_datetime = $("#end_pay_datetime").val().replace(/-/g, '');

	        var data = {
	            "start_pay_datetime": start_pay_datetime,
	            "end_pay_datetime": end_pay_datetime
	        };

	        $.ajax({
	            type: "POST",
	            url: "${pageContext.request.contextPath}/admin/sales",
	            data: data,
	            dataType: 'json',
	            success: function(response) {
	                console.log(response);
	                updateTable(response);
	            },
	            error: function(xhr, status, error) {
	                console.error(xhr.responseText);
	            }
	        });
	    });

	    // "오늘" 버튼 클릭 시
	    $("button#today").click(function() {
	    	setStartDate(0); // 현재 날짜
	    	setEndDate(0); // 현재 날짜
	    });
	    
	    // "어제" 버튼 클릭 시
	    $("button#yesterday").click(function() {
	    	setStartDate(-1); // 어제 날짜
	    	setEndDate(-1); // 어제 날짜
	    });
	    
	 	// "3일" 버튼 클릭 시
	    $("#tree_days").click(function() {
	    	setStartDate(-3); // 현재 날짜에서 3일 전으로 설정
	    	setEndDate(0); // 현재 날짜
	    });

	    // "7일" 버튼 클릭 시
	    $("#seven_days").click(function() {
	    	setStartDate(-7); // 현재 날짜에서 7일 전으로 설정
	    	setEndDate(0); // 현재 날짜
	    });

	    // "1개월" 버튼 클릭 시
	    $("#one_month").click(function() {
	    	setStartDate(-30); // 현재 날짜에서 1개월 전으로 설정
	    	setEndDate(0); // 현재 날짜
	    });

	    // "3개월" 버튼 클릭 시
	    $("#tree_month").click(function() {
	    	setStartDate(-90); // 현재 날짜에서 3개월 전으로 설정
	    	setEndDate(0); // 현재 날짜
	    });

	    // "6개월" 버튼 클릭 시
	    $("#six_month").click(function() {
	    	setStartDate(-180); // 현재 날짜에서 6개월 전으로 설정
	    	setEndDate(0); // 현재 날짜
	    });

	 	// 시작날짜 설정 함수
	    function setStartDate(daysToAdd = 0) {
	        var date = new Date();
	        date.setDate(date.getDate() + daysToAdd);
	        var dd = String(date.getDate()).padStart(2, '0');
	        var mm = String(date.getMonth() + 1).padStart(2, '0');
	        var yyyy = date.getFullYear();
	        var formattedDate = yyyy + '-' + mm + '-' + dd;
	        $("#start_pay_datetime").val(formattedDate);
	    }
	 	
	 	// 종료날짜 설정 함수
	    function setEndDate(daysToAdd = 0) {
	        var date = new Date();
	        date.setDate(date.getDate() + daysToAdd);
	        var dd = String(date.getDate()).padStart(2, '0');
	        var mm = String(date.getMonth() + 1).padStart(2, '0');
	        var yyyy = date.getFullYear();
	        var formattedDate = yyyy + '-' + mm + '-' + dd;
	        $("#end_pay_datetime").val(formattedDate);
	    }

	    // 매출 테이블 업데이트 함수
	    function updateTable(data) {
	        var tbody = $("#sales_table tbody");
	        tbody.empty();
	        $.each(data.salesData, function(index, sale) {
	            sale.pay_price = sale.pay_price || 0;
	            sale.pay_ment = sale.pay_ment || '-';
	            sale.payout_name = sale.payout_name || '-';
	            sale.payout_price = sale.payout_price || 0;
	            sale.payout_ment = sale.payout_ment || '-';
	            sale.payout_date = sale.payout_date || '-';
	            sale.buy_amount = sale.buy_amount || 0;

	            tbody.append(
	                "<tr style='width: 100%; display: flex; justify-content: center; text-align: center;'>" +
	                "<td style='width: 67.6px;'>" + sale.pay_no + "</td>" +
	                "<td style='width: 83.6px;'>" + sale.pay_price + "</td>" +
	                "<td style='width: 67.6px;'>" + sale.pay_ment + "</td>" +
	                "<td style='width: 160px;'>" + sale.pay_datetime + "</td>" +
	                "<td style='width: 99.6px;'>" + sale.pay_name + "</td>" +
	                "<td style='width: 99.6px;'>" + sale.cart_no + "</td>" +
	                "<td style='width: 99.6px;'>" + sale.rentalres_no + "</td>" +
	                "<td style='width: 131.6px;'>" + sale.payout_name + "</td>" +
	                "<td style='width: 115.6px;'>" + sale.payout_price + "</td>" +
	                "<td style='width: 99.6px;'>" + sale.payout_ment + "</td>" +
	                "<td style='width: 160px;'>" + sale.payout_date + "</td>" +
	                "<td style='width: 115.6px;'>" + sale.buy_amount + "</td>" +
	                "<td style='width: 51.6px;'>" + (sale.pay_price - sale.payout_price) + "</td>" + // 순매출 계산하여 추가
	                "</tr>"
	            );
	        });
	        var tfoot = $("#sales_table tfoot");
	        tfoot.empty();
	        var totalPayPrice = data.totalPayPrice || 0;
	        var totalPayoutPrice = data.totalPayoutPrice || 0;
	        var netSales = totalPayPrice - totalPayoutPrice;
	        tfoot.append(
	            "<tr style='width: 100%; display: flex; justify-content: center; text-align: center;'>" +
	            "<td style='width: 150.6px;'>결제총금액</td>" +
	            "<td style='width: 67.6px;'>" + totalPayPrice + "</td>" +
	            "<td colspan='5' style='width: 458.8px;'></td>" +
	            "<td style='width: 131.6px;'>결제취소총금액</td>" +
	            "<td style='width: 115.6px;'>" + totalPayoutPrice + "</td>" +
	            "<td colspan='2' style='width: 259.6px;'></td>" +
	            "<td style='width: 115.6px;'>순매출총금액</td>" +
	            "<td style='width: 51.6px;'>" + netSales + "</td>" +
	            "</tr>"
	        );
	    }
	});
	</script>
</head>

<body>
    <!-- header-start -->
    <header>
       <%@ include file ="../include/nav.jsp" %>
    </header>
    <!-- header-end -->

    <!-- bradcam_area_start -->
    <div class="bradcam_area breadcam_bg_1">
        <h3> 매출통계 </h3>
    </div>
    <!-- bradcam_area_end -->

    <!-- Main content -->
    <div class = "본문">
    
	    <div class="sales_btn_cls" style="width: 100%;">
		    <table border="1" style="width: 100%;">
		    <tr style="width: 100%; display: flex; justify-content: center;">
		    	<th>기간</th>
			    <td>
			    	<button id="today">오늘</button>
				    <button id="yesterday">어제</button>
				    <button id="tree_days">3일</button>
				    <button id="seven_days">7일</button>
				    <button id="one_month">1개월</button>
				    <button id="tree_month">3개월</button>
				    <button id="six_month">6개월</button>
					<input type="date" id="start_pay_datetime" name="start_pay_datetime">
					<a>~</a>
					<input type="date" id="end_pay_datetime" name="end_pay_datetime">
					<button id="sales_selectDate">조회</button>
			    </td>
		    </tr>
			</table>
	    </div>
	    <div class="sales_details" style="width: 100%;">
	        <table id="sales_table" border="1" style="width: 100%;">
	            <thead>
	                <tr style="width: 100%; display: flex; justify-content: center; text-align: center;">
	                    <th>결제번호</th>
	                    <th>결제총금액</th>
	                    <th>결제방식</th>
	                    <th style="width: 160px;">결제일시</th>
	                    <th>결제상품정보</th>
	                    <th>장바구니번호</th>
	                    <th>품목예약번호</th>
	                    <th>결제취소상품정보</th>
	                    <th>결제취소총금액</th>
	                    <th>결제취소방식</th>
	                    <th style="width: 160px;">결제취소일시</th>
	                    <th>쇼핑몰구매수량</th>
	                    <th>순매출</th>
	                </tr>
	            </thead>
	            <tbody>
	            </tbody>
	            <tfoot id="sales_table tfoot"></tfoot>
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