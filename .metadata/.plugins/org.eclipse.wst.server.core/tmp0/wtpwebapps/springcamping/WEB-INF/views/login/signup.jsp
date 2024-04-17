<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<!doctype html>
<html class="no-js" lang="zxx">


<head>
<%@ include file="../include/head.jsp"%>
<link rel="stylesheet" href="/resources/css/login.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

</head>

<body>
	<!--[if lte IE 9]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
        <![endif]-->



	<!-- features_room_startt -->

	<div class="col-xl-12">
		<div class="section_title text-center mb-100">
			<a href="/"><img src="/resources/img/캠핑로고2.png" alt=""></a>
		</div>
	</div>


	<!-- features_room_end -->

	<div class="container">

		<!-- Links -->
		<ul class="links">
			<li><a id="signup">회원가입</a></li>
		</ul>

		<!-- Form -->
		<form>
			<!-- email input -->
			<div class="first-input input__block first-input__block" style="display: flex; justify-content: space-between; ">
				<div style="width: 90%; max-width: 680px; height: 50px; margin: 0 auto; border-radius: 8px; border: none; background: #dde7e8; padding: 0 0 0 15px;">
				<input type="email" placeholder="이메일" class="input" id="user_id"
					name="user_id" onkeyup="onkeyupId()" style="width: 480px; float: left; padding: 0px 0px;"/>
				<button id="btn-email-check" class="btn btn-outline-secondary" type="button" onclick="btnEmailCheck()" style="float: right; width: 90px; height: 45px; border: none; margin: 2px 0;">중복확인</button>
				</div>
			
			</div>
			<!-- password input -->
			<div class="input__block">
				<input type="password" placeholder="비밀번호" class="input"
					id="user_password" name="user_password" />
			</div>
			<div class="input__block">
				<input type="password" placeholder="비밀번호 확인" class="input"
					id="user_password_check" name="user_password_check" />
			</div>
			<div class="input__block">
				<input type="text" placeholder="이름" class="input"
					id="user_name" name="user_name" />
			</div>
			
			<div class="input__block" style="display: flex; justify-content: space-between; ">
				<div style="width: 90%; max-width: 680px; height: 50px; margin: 0 auto; border-radius: 8px; border: none; background: #dde7e8; padding: 0 0 0 15px;">
				<input type="text" placeholder="닉네임" class="input" id="user_nick"
					name="user_nick" onkeyup="onkeyupNick()" style="width: 480px; float: left; padding: 0px 0px;"/>
				<button id="btn-nick-check" class="btn btn-outline-secondary" type="button" onclick="btnNickCheck()" style="float: right; width: 90px; height: 45px; border: none; margin: 2px 0;">중복확인</button>
				</div>
			
			</div>
			
			<div class="input__block">
				<input type="tel" placeholder="전화번호" class="input"
					id="user_phone" name="user_phone" />
			</div>
			<div class="my-4">
						<div class="custom-control custom-checkbox mb-3" style="margin: 0px 0px 20px 32px;">
							<input type="checkbox" class="custom-control-input"
								id="agree_terms" name="agree_terms"> <label
								class="custom-control-label" for="agree_terms">
								<span style="color:rgb(60,200,143)">이용약관</span> 동의 </label>
						</div>
						<div class="custom-control custom-checkbox" style="margin: 0px 0px 20px 32px;">
							<input type="checkbox" class="custom-control-input"
								id="privacy_terms" name="privacy_terms"> <label
								class="custom-control-label" for="privacy_terms">
								<span style="color:rgb(60,200,143)">개인정보 취급방침</span> 동의 </label>
						</div>
					</div>
			<!-- signup in button -->
			<button type="button" class="signin__btn" onclick="btnSignup()">회원가입</button>
		</form>


	</div>




	<!-- footer -->
	<%@ include file="../include/footer.jsp"%>

	<!-- link that opens popup -->



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
	
		let emailCheck = false;
		let nickCheck = false;
		
		$(user_phone).keyup(function () {
			    this.value = this.value
			        .match(/\d*/g).join('')
			        .match(/(\d{0,3})(\d{0,4})(\d{0,4})/).slice(1).join('-')
			        .replace(/-*$/g, '');
		});
		
		//이메일체크
		function btnEmailCheck() {
			var user_id = $('#user_id');
 			var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			

			if (user_id.val() === "") {
				alert("이메일을 입력해 주세요.");
				user_id.focus();
				return;
			}
			
 			if (user_id.val().match(regExp) != null) {
				// 타입이 맞으면
			var data = {'user_id' : user_id.val()}
			
			$.ajax({
				type: 'post',
				url : '/login/emailcheck',
				data : data,
				async : true,
				contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
				dataType : 'json',
				success: function(result){
					if (result.check) {
						emailCheck = true;
						document.getElementById("btn-email-check").innerText= "✓";
					} else {
						alert('중복된 이메일입니다.');
						document.getElementById("btn-email-check").innerText= "중복확인";
						emailCheck = false;
					}
				},
				error:function(){  
		            alert('error');
				}
			})
				return;
			} else {
				alert("정상적인 이메일 형식이 아닙니다.");
			}
			
		}
		
		function onkeyupId() {
			document.getElementById("btn-email-check").innerText= "중복확인";
			emailCheck = false;
		}
		
		//닉네임체크
		function btnNickCheck() {
			var user_nick = $('#user_nick');
 			var regExp2 = /^(?=.*[a-z0-9가-힣])[a-z0-9가-힣]{2,16}$/;

			
 			if (user_nick.val().match(regExp2) != null) {
				// 타입이 맞으면
			var data = {'user_nick' : user_nick.val()}
			
			$.ajax({
				type: 'post',
				url : '/login/nickcheck',
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
		
		function onkeyupNick() {
			document.getElementById("btn-nick-check").innerText= "중복확인";
			nickCheck = false;
		}
		
	
		function btnSignup() {
			var user_id = $('#user_id');
			
			if (!emailCheck) {
				alert("이메일 중복 확인을 해주세요.");
				user_id.focus();
				return;
			}
			
			if (!nickCheck) {
				alert("닉네임 중복 확인을 해주세요.");
				$('#user_nick').focus();
				return;
			}
			
			if (user_id.val() === "") {
				alert("이메일을 입력해 주세요.");
				user_id.focus();
				return;
			}
			
			var user_password = $('#user_password');
			if (user_password.val() === "") {
				alert("비밀번호를 입력해 주세요.");
				user_password.focus();
				return;
			}
			if (user_password.val().length < 4) {
				alert("비밀번호를 4자리 이상 입력해 주세요.");
				user_password.focus();
				return;
			}
			
			var user_password_check = $('#user_password_check');
			if (user_password_check.val() === "") {
				alert("비밀번호 확인을 입력해 주세요.");
				user_password_check.focus();
				return;
			}
			if (user_password_check.val() !== user_password.val()) {
				alert("비밀번호와 비밀번호 확인이 다릅니다.");
				user_password_check.focus();
				return;
			}
			
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
			if (user_phone.val())
			
			var agree_terms = $('#agree_terms');
			if (!agree_terms.prop('checked')) {
				alert("이용약관에 동의해 주세요.");
				agree_terms.focus();
				return;
			}
			
			var privacy_terms = $('#privacy_terms');
			if (!privacy_terms.prop('checked')) {
				alert("개인정보 취급방침에 동의해 주세요.");
				privacy_terms.focus();
				return;
			}
			const data = {
					"user_id": $('#user_id').val(),
					"user_password": $('#user_password').val(),
					"user_name": $('#user_name').val(),
					"user_nick": $('#user_nick').val(),
					"user_phone": $('#user_phone').val().replaceAll('-', '')
			}
			
			$.ajax({
				type: 'post',
				url : '/login/signup',
				data : data,
				async : true,
				contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
				dataType : 'json',
				success: function(result){
					if (result.signup) {
						alert('가입 완료');
						location.href = "/";	
					} else {
						alert('이미 가입된 핸드폰 번호입니다.');
					}
				},
				error:function(){  
		            alert('error');
				}
			})
			
		}
	</script>


</body>

</html>