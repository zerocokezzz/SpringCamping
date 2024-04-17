<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<!doctype html>
<html class="no-js" lang="zxx">


<head>
<%@ include file="../include/head.jsp"%>
<link rel="stylesheet" href="/resources/css/login.css">
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
			<li><a id="signin">로그인</a></li>
			<li><a href="signup">회원가입</a></li>
		</ul>

		<!-- Form -->
		<form method="post">
			<!-- email input -->
			<div class="first-input input__block first-input__block">
				<input type="email" placeholder="이메일" class="input" id="user_id"
					name="user_id" />
			</div>
			<!-- password input -->
			<div class="input__block">
				<input type="password" placeholder="비밀번호" class="input"
					id="user_password" name="user_password" />
			</div>
			<!-- sign in button -->
			<button type="button" class="signin__btn" onclick="btnEmaillogin()">로그인</button>
		</form>
		<!-- separator -->
		<div class="separator">
			<p>OR</p>
		</div>
		<!-- google button -->
		
		<button class="github__btn" style="height: unset;">
			<a id="kakao-login-btn" href="javascript:loginWithKakao()">
  				<img src="https://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" width="222"
    	 			 alt="카카오 로그인 버튼" />
			</a>
		</button>
		
<!--  
		<footer>
			<p>
				<a href="idFind">로그인 정보를 잊으셨나요?</a>
			</p>

		</footer>
		-->


	</div>
	




	<!-- footer -->
	<%@ include file="../include/footer.jsp"%>

	<!-- link that opens popup -->

	<!--contact js-->
	<script src="/resources/js/contact.js"></script>
	<script src="/resources/js/jquery.ajaxchimp.min.js"></script>
	<script src="/resources/js/jquery.form.js"></script>
	<script src="/resources/js/jquery.validate.min.js"></script>
	<script src="/resources/js/mail-script.js"></script>
	<script src="/resources/js/main.js"></script>

	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	
	<!-- 카카오 로그인 -->
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	
	<script type="text/javascript">
		const KaApiKey = "81846d077282b604a3ee324e8089b47d";
	      //2. 카카오 초기화
	      Kakao.init(KaApiKey);
	      Kakao.isInitialized();
	      //3. 카카오로그인 코드 확인
	      function loginWithKakao() {
	        Kakao.Auth.login({
	          success: function (authObj) {
	            console.log(authObj); //access토큰 값
	            Kakao.Auth.setAccessToken(authObj.access_token); //access 토큰 값 저장
	            getInfo();
	          },
	          fail: function (err) {
	            console.log(err);
	          },
	        });
	      }
	      //4. 엑세스 토큰을 발급받고, 아래 함수를 호출시켜 사용자 정보 받아옴.
	      function getInfo() {
	        Kakao.API.request({
	          url: "/v2/user/me",
	          success: function (res) {
	            console.log(res);
	            var kakaoId = res.id;
	            // KAKAO id 획득
	            
	            const data = {
	            	"user_id": kakaoId,
	            	"user_intype" : "kakao"
	            }
	            $.ajax({
						type : 'post',
						url : '/login/kakao',
						data : data,
						async : true,
						contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
						success : function(result) {
							location.href = "/";
						},
						error : function() {
							alert('error');
						}
					})
	          },
	          fail: function (error) {
	            alert("카카오 로그인 실패" + JSON.stringify(error));
	          },
	        });
	      }
	
		function btnEmaillogin() {
			if ($("#user_id").val() == "") {
				alert("이메일을 입력하세요.")
				$("#user_id").focus();
				return false;
			}

			if ($("#user_password").val() == "") {
				alert("패스워드를 입력하세요.");
				$("#user_password").focus();
				return false;
			}

			var data = {
				'user_id' : $("#user_id").val(),
				'user_password' : $("#user_password").val()
			}
			$.ajax({
						type : 'post',
						url : '/login/login',
						data : data,
						async : true,
						contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
						success : function(result) {
							if (result && result.login) {
								location.href = "/";
							} else {
								alert('이메일 또는 패스워드가 틀립니다.');
							}
						},
						error : function() {
							alert('error');
						}
					})
		}
	</script>



</body>

</html>