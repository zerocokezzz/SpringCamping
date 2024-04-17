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
    
    <!-- bradcam_area_end -->

    <!-- Main content -->
    <div class="bradcam_area breadcam_bg_1">
        <h3>미지캠핑 게시판!</h3>
    </div>
    <!-- bradcam_area_end -->
    
    <!-- Main content -->
    <script type="text/javascript">
    function checkform() {
        if (! (document.fr.board_title.value.length >= 1 && document.fr.board_title.value.length <= 50) {
           alert("제목은 1~50자 내외로 입력해주세요");
           document.fr.board_title.value = "";
           document.fr.board_title.select();
        } else if (! (document.fr.board_content.value.length >= 1 && document.fr.board_content.value.length <= 999)) {
           alert("내용은 1~999자 내외로 입력해주세요");
           document.fr.board_content.value = "";
           document.fr.board_content.select();
        }
     }
    </script>
	<section class="content container-fluid">
		<div class="box-header">
			<h3 class="box-title">게시판 글쓰기</h3>
		</div>
	
		<form role="form" action = "insert" method="post" name="fr">
			<div class="box-body">
				<div class="form-group">
					<label>제목</label> <input type="text"
						name='board_title' class="form-control" placeholder="제목을 입력하세요" required>
				</div>
				<div class="form-group">
					<label>내용</label>
					<textarea class="form-control" name="board_content" rows="3"
						placeholder="내용을 입력하세요" required></textarea>
				</div>
			</div>
	
			<div class="box-footer">
				<input type="submit" value = "작성완료" class="btn btn-primary" onclick="checkform()">
			</div>
		</form>
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