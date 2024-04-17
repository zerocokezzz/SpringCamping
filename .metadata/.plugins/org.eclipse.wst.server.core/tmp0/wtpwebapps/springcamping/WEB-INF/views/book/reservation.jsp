<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%
	UserDTO user = (UserDTO)session.getAttribute("user");
%>
<!doctype html>
<html class="no-js" lang="zxx">



<head>
    <%@ include file ="../include/head.jsp" %> 
	<style>
		.calendar_days > button  {
		    width: 48px;
		    height: 47px;
		    border-radius: 100%;
		    background-color: transparent;
		    border: transparent;
		}
		.calendar_container {
		 	float: left;
		    left:29%;
		    top:25%;
		    display: flex;
		    justify-content:space-evenly;
		    width: 42%;
		    background-color: white;
		    box-shadow: 1px 1px 25px rgb(0, 0, 0 / 17%);
		    border-radius: 50px;
		}
		
		.width {
			width: 100%;
			height: 500px;
			border: 1px solid #000;
		}
		
		.right {
		  	width:60%;
			display: flex;
			top:25%;
	        float:  right;
	        box-sizing:  border-box;
	        background:   #0ff;
			margin-top: 3%;
			padding-left: 20px;
		}
		
		 .left {
		 	width:40%;
		 	float: left;
		    left:29%;
		    top:25%;
		    display: flex;
		    justify-content:space-evenly;
		    width: 42%;
		    background-color: white;
		    box-shadow: 1px 1px 25px rgb(0, 0, 0 / 17%);
		    border-radius: 50px;
		}
		
		.hide {
		    display:none;
		}
		
		.calendar_container > button {
		    margin-top: 4%;
		    font-weight: bold;
		    height:10%;
		}
		
		.left_button {
			width: 20px;
			height: 20px;
		    margin-left:17%;
		    margin-top: 30px;
		    border: transparent;
		    background-color: #fff;
		    cursor: pointer;
		}
		
		.right_button {
		    width: 20px;
			height: 20px;
		    margin-left:17%;
		    margin-top: 30px;
		    border: transparent;
		    background-color: #fff;
		    cursor: pointer;
		}
		
		.calendar {
		    display:flex;
		    flex-direction: column;
		    justify-content:center;
		    align-items: center;
		    margin-top: 3%;
		    margin-right:2.5%;
		}
		
		table {
		    border-collapse: separate;
		    border-spacing: 0 10px;
		}
		
		.day {
		    text-align: center;
		    font-size:12px;
		    font-weight: bold;
		    color:rgb(189, 189, 189);
		}
		
		.day_hover {
		    border: 1px solid black !important;
		}
		
		.day_selected {
		    background-color: black !important;
		    color: #ffff;
		}
		
		.gray {
		    background-color: rgb(241, 241, 241) !important;
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
        <h3> 예약하기 </h3>
    </div>
    <!-- bradcam_area_end -->

    <!-- Main content -->
	
	<!-- 본문  -->
	<div class="width">
	
	<!-- 달력 -->
	<div class="left">
		<div>
			<button class="left_button">&lt</button>
		</div>

		<table class="calendar">
			<th class="title">2월</th>
			<tbody>
				<tr class="week">
					<td class="day">일</td>
					<td class="day">월</td>
					<td class="day">화</td>
					<td class="day">수</td>
					<td class="day">목</td>
					<td class="day">금</td>
					<td class="day">토</td>
				</tr>
				<tr>
					<!-- 달력 첫 번째 줄-->
					<td class="calendar_days" roll="button"></td>
					<td class="calendar_days" roll="button"></td>
					<td class="calendar_days" roll="button"></td>
					<td class="calendar_days" roll="button"></td>
					<td class="calendar_days" roll="button"></td>
					<td class="calendar_days" roll="button"></td>
					<td class="calendar_days" roll="button"></td>
				</tr>
				<tr>
					<!-- 달력 두 번째 줄-->
					<td class="calendar_days" roll="button"></td>
					<td class="calendar_days" roll="button"></td>
					<td class="calendar_days" roll="button"></td>
					<td class="calendar_days" roll="button"></td>
					<td class="calendar_days" roll="button"></td>
					<td class="calendar_days" roll="button"></td>
					<td class="calendar_days" roll="button"></td>
				</tr>
				<tr>
					<!-- 달력 세 번째 줄-->
					<td class="calendar_days" roll="button"></td>
					<td class="calendar_days" roll="button"></td>
					<td class="calendar_days" roll="button"></td>
					<td class="calendar_days" roll="button"></td>
					<td class="calendar_days" roll="button"></td>
					<td class="calendar_days" roll="button"></td>
					<td class="calendar_days" roll="button"></td>
				</tr>
				<tr>
					<!-- 달력 네 번째 줄-->
					<td class="calendar_days" roll="button"></td>
					<td class="calendar_days" roll="button"></td>
					<td class="calendar_days" roll="button"></td>
					<td class="calendar_days" roll="button"></td>
					<td class="calendar_days" roll="button"></td>
					<td class="calendar_days" roll="button"></td>
					<td class="calendar_days" roll="button"></td>
				</tr>
				<tr>
					<!-- 달력 다섯 번째 줄-->
					<td class="calendar_days" roll="button"></td>
					<td class="calendar_days" roll="button"></td>
					<td class="calendar_days" roll="button"></td>
					<td class="calendar_days" roll="button"></td>
					<td class="calendar_days" roll="button"></td>
					<td class="calendar_days" roll="button"></td>
					<td class="calendar_days" roll="button"></td>
				</tr>
				<tr>
					<!-- 달력 여섯 번째 줄-->
					<td class="calendar_days" roll="button"></td>
					<td class="calendar_days" roll="button"></td>
					<td class="calendar_days" roll="button"></td>
					<td class="calendar_days" roll="button"></td>
					<td class="calendar_days" roll="button"></td>
					<td class="calendar_days" roll="button"></td>
					<td class="calendar_days" roll="button"></td>
				</tr>
			</tbody>
		</table>
		<div>
		<button class="right_button">></button>
		</div>
	</div>
	
	<!-- 예약정보 -->
	<div class = "right">
	
	<form action="reservationPost" method="post">
		<table class="resInsert">
	    	<tr>
	    		<td>방번호 </td>
	    		<td></td>
	    		<td>
	    			<select name="camp_no" >
   	 					<c:forEach var = "campinfo" items ="${campinfo }">
    						<option value="${campinfo.camp_no }">${campinfo.camp_no  }</option>
    					</c:forEach>
	    			</select>
    			</td>
	    	</tr>
	    	<tr>
	    		<td>예약자 </td>
	    		<td></td>
	    		<td><%= user.getUser_id()%></td>
	    	</tr>
	    	<tr>
	    		<td>입실일 </td>
	    		<td></td>
	    		<td><input type="text" id="check_in_date" name="campres_checkin" readOnly></td>
	    	</tr>
	    	<tr>
	    		<td>퇴실일 </td>
	    		<td></td>
	    		<td><input type="text" id="check_out_date" name="campres_checkout" readOnly></td>
	    	</tr>
	    	<tr>
	    		<td>인원  </td>
	    		<td></td>
	    		<td><input type="text" name="campres_person"></td>
	    	</tr>
			<c:forEach var = "rentalinfo" items = "${rentalinfo }" >
				<tr>
					<td><input type="checkbox" name="${rentalinfo.rental_no}">${rentalinfo.rental_name }</td>
					<td></td>
					<td><input type="number" name="${rentalinfo.rental_no }_cnt" value="0"></td>
				</tr>
			</c:forEach>
			<tr>
	    		<td><input type="submit" value="결제"></td>
	    		<td><input type="reset" value="초기화"></td>
	    	</tr>
    	</table>
    	
	</form>
	
	</div>
	</div>
	 
	<script src="../resources/js/calendar.js"></script>
	<!-- Main content End -->
    
    
    <!-- footer -->
    <%@ include file ="../include/footer.jsp" %>
    
    
    
    
    <!-- 포트원 결제 -->
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
    <!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<!-- 포트원 결제 -->
    
</body>

</html>