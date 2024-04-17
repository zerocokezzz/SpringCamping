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
        <h3>게시판!</h3>
    </div>
    <!-- bradcam_area_end -->

    <!-- Main content -->
    <section class="content container-fluid">
		 <div>${msg}</div>
		<div class="table-responsive">
		  <table class="table">
		  <tr>
		  	<td>QnA글번호</td>
		  	<td>QnA제목</td>
		  	<td>QnA내용</td>
		  	<td>QnA작성일</td>
		  </tr>
		<c:forEach var="qnalist" items="${qnalist }">
		 	<tr>
		 	<td>${qnalist.qa_no}</td>
		 	<td><a href="qnadetail?qa_no=${qnalist.qa_no}">${qnalist.qa_title}</a></td>
		 	<td>${qnalist.qa_content}</td>
		 	<td>${qnalist.qa_todaydate}</td>
		 	<td>${qnalist.qa_etc}</td>
		 	</tr>
		</c:forEach>
		<tr>
		<td colspan="5" align="center">
				<button class="btn btn-insert" onclick="location.href='qnainsert'" style="color:#fff; background-color: #FF9999;">QnA 추가</button>
				<input class="btn btn-success" onclick="location.href='../'" type="button" value="메인으로"	id="qnalist" />		
			</td>
		</tr>
		  </table>
		  <div style="display: flex; justify-content: center;">
   <c:if test="${prev}">
      <span>[ <a href="${contextPath }/board/boardmain?num=${startpageNum - 1}">이전</a> ] </span>
   </c:if>
   <c:forEach begin="${startpageNum}" end="${endpageNum}" var="num">
       <span style="margin: 0px 10px 0px 0px;">
         <a href="${contextPath }/board/qnalist?num=${num}">${num}</a> 
      </span>
   </c:forEach>

   <c:if test="${next}">
      <span>[ <a href="${contextPath }/board/qnalist?num=${endpageNum + 1}">다음</a> ] </span>
   </c:if>
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