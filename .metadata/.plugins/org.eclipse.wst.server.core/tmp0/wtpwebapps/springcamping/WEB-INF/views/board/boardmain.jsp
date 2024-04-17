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
        <h3>게시판</h3>
    </div>
    <!-- bradcam_area_end -->

    <!-- Main content -->
    <div class="content-wrapper">
    <!-- Main content -->
    <section class="content container-fluid">
       <div>${msg}</div>
      <div class="table-responsive">
        <table class="table">
        <tr>
           <td>글번호</td>
           <td>제목</td>
           <td>내용</td>
           <td>작성일</td>
           <td>조회수</td>
        </tr>
      <c:forEach var="board" items="${boardmain }">
          <tr>
          <td>${board.bno}</td>
          <td><a href="detail?bno=${board.bno}">${board.board_title}</a></td>
          <td>${board.board_content}</td>
          <td>${board.board_todaydate}</td>
          <td><span class="badge">${board.board_readcnt }</span></td>
          </tr>
      </c:forEach>
      <tr>
      <td colspan="5" align="center">
            <button class="btn btn-insert" onclick="location.href='insert'" style="color:#fff; background-color: #FF9999;">게시글 추가</button>
            <input class="btn btn-success" onclick="location.href='../'" type="button" value="메인으로"   id="boardmain" />      
         </td>
      </tr>
        </table>
        <div style="display: flex; justify-content: center;">
   <c:if test="${prev}">
      <span>[ <a href="${contextPath }/board/boardmain?num=${startpageNum - 1}">이전</a> ] </span>
   </c:if>
   <c:forEach begin="${startpageNum}" end="${endpageNum}" var="num">
       <span style="margin: 0px 10px 0px 0px;">
         <a href="${contextPath }/board/boardmain?num=${num}">${num}</a> 
      </span>
   </c:forEach>

   <c:if test="${next}">
      <span>[ <a href="${contextPath }/board/boardmain?num=${endpageNum + 1}">다음</a> ] </span>
   </c:if>
   </div>
      </div>
    </section>
    </div>
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