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
        <h3> 예약상세 </h3>
    </div>
    <!-- bradcam_area_end -->

    <!-- Main content -->
    
    <div class="예약상세">
		<div>
		
			 <table class="table table-bordered" id="dataTable" width="80%" cellspacing="0" style="text-align:center">
				<tr>
					<td>예약번호 </td>
					<td>${res.res_no }</td>
				</tr>
				<tr>
					<td>방번호 </td>
					<td>${res.camp_no }</td>
				</tr>
				<tr>
					<td>예약자 </td>
					<td>${res.user_id }</td>
				</tr>
				<tr>
					<td>입실일 </td>
					<td>${res.campres_checkin }</td>
				</tr>
				<tr>
					<td>퇴실일 </td>
					<td>${res.campres_checkout }</td>
				</tr>
				<tr>
					<td>인원 </td>
					<td>${res.campres_person }</td>
				</tr>
				<tr>
					<td>결제금액</td>
					<td>${pay.pay_price }</td>
				</tr>
				<tr>
					<td>결제방식</td>
					<td>${pay.pay_ment }</td>
				</tr>
				<tr>
					<td>결제일시</td>
					<td>${pay.pay_datetime }</td>
				</tr>
				<c:forEach var = "rentalinfo" items = "${rentalinfo }" >
				<tr>
					<td>${rentalinfo.rental_name }</td>
					<td>${rentalamount[rentalinfo.rental_no] }</td>
				</tr>
				</c:forEach>
			</table>
		</div>

		<a href="resUpdate?res_no=${res.res_no }&pay_no=${pay.pay_no}"><button>수정</button></a>
		<a href="resAdmin"><button>삭제</button></a>
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