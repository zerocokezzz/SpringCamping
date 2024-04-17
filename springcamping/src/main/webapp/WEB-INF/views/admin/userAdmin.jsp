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
  
    <!-- /.content -->
    <!-- bradcam_area_end -->

    <!-- Main content -->
    
    <div class="bradcam_area breadcam_bg_1">
        <h3> 회원목록 </h3>
    </div>
 

    <!-- Main content -->
     <section class="contact-section">
      <div class="table-responsive">
        <table>
        <tr>
           <th>NO</th>
           <th>ID</th>
           <th>이름</th>
           <th>핸드폰</th>
           <th>가입일</th>
           <th>탈퇴일</th>
        </tr>
      <c:forEach var="user" items="${listAll}" varStatus="status">
          <tr>
          <td>${status.count}</td>
          <td><a href="userDetail?user_id=${user.user_id}">${user.user_id}</a></td>
          <td>${user.user_name}</td>
          <td>${user.user_phone}</td>
          <td>${user.user_indatetime}</td>
          <td>${user.user_outdatetime}</td>
          </tr>
      </c:forEach>

        </table>
      </div>
    </section>

    <!-- Main content End -->
    
    <!-- footer -->
    <%@ include file ="../include/footer.jsp" %>
    
    
    <!-- form itself end-->
    
    <!-- 에약이랑 로그인 버튼인데..... 그건 구현 후 붙일거임! 여기 건들 ㄴㄴ -->
    
	<!-- form itself end -->


    <!-- JS here -->
    <script src="js/vendor/modernizr-3.5.0.min.js"></script>
    <script src="js/vendor/jquery-1.12.4.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/isotope.pkgd.min.js"></script>
    <script src="js/ajax-form.js"></script>
    <script src="js/waypoints.min.js"></script>
    <script src="js/jquery.counterup.min.js"></script>
    <script src="js/imagesloaded.pkgd.min.js"></script>
    <script src="js/scrollIt.js"></script>
    <script src="js/jquery.scrollUp.min.js"></script>
    <script src="js/wow.min.js"></script>
    <script src="js/nice-select.min.js"></script>
    <script src="js/jquery.slicknav.min.js"></script>
    <script src="js/jquery.magnific-popup.min.js"></script>
    <script src="js/plugins.js"></script>
    <script src="js/gijgo.min.js"></script>

    <!--contact js-->
    <script src="js/contact.js"></script>
    <script src="js/jquery.ajaxchimp.min.js"></script>
    <script src="js/jquery.form.js"></script>
    <script src="js/jquery.validate.min.js"></script>
    <script src="js/mail-script.js"></script>

    <script src="js/main.js"></script>
   

</body>

</html>