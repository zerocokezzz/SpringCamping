<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page import="kr.co.dong.DTO.*" %>
<% UserDTO ud = (UserDTO) request.getSession().getAttribute("user"); %>
<!doctype html>
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
    
    <!-- bradcam_area_start -->
    <div class="bradcam_area breadcam_bg_1">
        <h3> 회원정보 수정 </h3>
    </div>
    <!-- bradcam_area_end -->
    
    <!-- Form -->
    <section class="contact-section">
		<form>
			<div class="input__block">
				<input type="text" placeholder="아이디e" class="input"
					id="user_id" name="user_name" value="<%=ud.getUser_id()%>" disabled="disabled"/>
			</div>
			<div class="input__block">
				<input type="text" placeholder="이름" class="input"
					id="user_name" name="user_name" value="<%=ud.getUser_name()%>"/>
			</div>
			
			<div class="input__block">
				<input type="tel" placeholder="전화번호" class="input"
					id="user_phone" name="user_phone" value="<%=ud.getUser_phone()%>"/>
			</div>
			
			<div class="input__block" style="display: flex; justify-content: space-between; ">
				<div style="width: 90%; max-width: 680px; height: 50px; margin: 0 auto; border-radius: 8px; border: none; background: #dde7e8; padding: 0 0 0 15px;">
				<input type="text" placeholder="닉네임" class="input" id="user_nick"
					name="user_nick" onkeyup="onkeyupNick()" style="width: 480px; float: left; padding: 0px 0px;" 
					value="<%=ud.getUser_nick()%>"/>
				<button id="btn-nick-check" class="btn btn-outline-secondary" type="button" onclick="btnNickCheck()" style="float: right; width: 90px; height: 45px; border: none; margin: 2px 0;">중복확인</button>
				</div>
			</div>
			
		
			<!-- signup in button -->
			<button type="button" class="signin__btn" onclick="userUpdate()">수정하기</button>
		</form>
    </section>
    
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
    <script type="text/javascript">
    
    let nickCheck = false;
    
    $(user_phone).keyup(function () {
		    this.value = this.value
		        .match(/\d*/g).join('')
		        .match(/(\d{0,3})(\d{0,4})(\d{0,4})/).slice(1).join('-')
		        .replace(/-*$/g, '');
	});
    
    function onkeyupNick() {
		document.getElementById("btn-nick-check").innerText= "중복확인";
		nickCheck = false;
	}
		
		//닉네임체크
		function btnNickCheck() {
			var user_nick = $('#user_nick');
 			var regExp2 = /^(?=.*[a-z0-9가-힣])[a-z0-9가-힣]{2,16}$/;

			
 			if (user_nick.val().match(regExp2) != null) {
				// 타입이 맞으면
			var data = {
						'user_id' : $('#user_id').val(),
						'user_nick' : user_nick.val()
						}
			
			$.ajax({
				type: 'post',
				url : '/mypage/nickcheck',
				data : data,
				async : true,
				contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
				dataType : 'json',
				success: function(result){
					if (result.check) {
						nickCheck = true;
						document.getElementById("btn-nick-check").innerText= "✓";
					} else {
						alert('중복된 닉네임입니다.');
						document.getElementById("btn-nick-check").innerText= "중복확인";
						nickCheck = false;
					}
				},
				error:function(){  
		            alert('error');
				}
			})
				return;
			} else {
				alert("정상적인 닉네임 형식이 아닙니다.");
			}
			
		}
    
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
			
			if (!nickCheck) {
				alert("닉네임 중복 확인을 해주세요.");
				$('#user_nick').focus();
				return;
			}
			
			const data = {
				"user_name": $('#user_name').val(),
				"user_phone": $('#user_phone').val().replaceAll('-', ''),
				"user_nick": $('#user_nick').val()
			}
			if (user_phone.val())
			
			$.ajax({
				type: 'post',
				url : '/mypage/userUpdate',
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
    </script>
   

</body>

</html>