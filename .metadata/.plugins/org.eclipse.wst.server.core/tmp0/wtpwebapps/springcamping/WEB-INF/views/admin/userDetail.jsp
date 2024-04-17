<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page import="kr.co.dong.DTO.*" %>
<html class="no-js" lang="zxx">

<head>
    <%@ include file ="../include/head.jsp" %> 
        <link rel="stylesheet" href="/resources/css/login.css">
    	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
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
    
    <div class="bradcam_area breadcam_bg_1">
        <h3> 회원정보 수정 </h3>
    </div>

    <!-- Main content -->
    <section class="blog_area single-post-area section-padding">
		<div class="container">
         <div class="box">
            <div class="box-header">
               <h3 class="box-title">상세보기</h3>
            </div>
            <div class="box-body">
               <div class="f   orm-group">
                  <label>아이디</label> <input id="user_id" type="text" name="user_id"
                     class="form-control" value="${user.user_id}" readonly="readonly" />
               </div>

               <div class="form-group">
                  <label>이름</label>
                  <input id="user_name" type="text" name="title"
                     class="form-control" value="${user.user_name}"/>
               </div>

               <div class="form-group">
                  <label>핸드폰번호</label> <input id="user_phone" type="text" name="user_phone"
                     class="form-control" value="${user.user_phone}" pattern="###-####-####"/>
               </div>
               <div class="form-group">
                  <label>가입일자</label> <input type="text" name="id"
                     class="form-control" value="${user.user_indatetime}" readonly="readonly" />
               </div>
               <div class="form-group">
                  <label>탈퇴일자</label> <input type="text" name="id"
                     class="form-control" value="${user.user_outdatetime}" readonly="readonly" />
               </div>
            </div>
            
            <!-- signup in button -->
			<button class="genric-btn success circle" type="button" class="signin__btn" onclick="userUpdate()">수정하기</button>
			<button class="genric-btn success circle" type="button" class="signin__btn" onclick="userDelete()">탈퇴하기</button>

         </div>
         </div>
         </section>
    <!-- Main content End -->
    
    <!-- footer -->
    <%@ include file ="../include/footer.jsp" %>
    
    
    <!-- form itself end-->
    
    <!-- 에약이랑 로그인 버튼인데..... 그건 구현 후 붙일거임! 여기 건들 ㄴㄴ -->
    
	<!-- form itself end -->


   
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

    <script src="js/main.js"></script>
    
    <script type="text/javascript">
    	$(document).ready(function() {
    		let phone = document.getElementById("user_phone").value;
    		const hipenPhone = phone.substring(0,3) + "-" + phone.substring(3,7) + "-" + phone.substring(7); 
    		document.getElementById("user_phone").value = hipenPhone;
    	});
    
	    $(user_phone).keyup(function () {
			    this.value = this.value
			        .match(/\d*/g).join('')
			        .match(/(\d{0,3})(\d{0,4})(\d{0,4})/).slice(1).join('-')
			        .replace(/-*$/g, '');
		});
	    
	    function userUpdate() {
	    	
			var user_name = $('#user_name');
			if (user_name.val() === "") {
				alert("이름을 입력해 주세요.");
				user_name.focus();
				return;
			}
			
			var user_phone = $('#user_phone');
				var regNumber = /^[0-9]*$/;
			if (!regNumber.test(user_phone.val().replaceAll('-', ''))|| user_phone.val().replaceAll('-', '').length != 11) {
				alert("정상적인 전화번호가 아닙니다.");
				user_phone.focus();
				return;
			}
			
	
			const data = {
				"user_id": $('#user_id').val(),
				"user_name": $('#user_name').val(),
				"user_phone": $('#user_phone').val().replaceAll('-', '')
			}
			if (user_phone.val())
			
			$.ajax({
				type: 'post',
				url : '/admin/userUpdate',
				data : data,
				async : true,
				contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
				dataType : 'json',
				success: function(result){
					if (result.userUpdate) {
						alert('수정 완료');
					} else {
						alert('정보수정이 실패했습니다');
					}
				},
				error:function(){  
		            alert('error');
				}
			});
		}
	    
	    function userDelete() {
	    	const data = {
				"user_id": $('#user_id').val()
	    	}
	    	
	    	$.ajax({
				type: 'post',
				url : '/admin/userDelete',
				data : data,
				async : true,
				contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
				dataType : 'json',
				success: function(result){
					if (result.userDelete) {
						alert('탈퇴 완료');
						location.href = "/admin/userAdmin";
					} else {
						alert('회원 탈퇴가 실패했습니다');
					}
				},
				error:function(){  
		            alert('error');
				}
			});
	    }
    </script>
   

</body>

</html>