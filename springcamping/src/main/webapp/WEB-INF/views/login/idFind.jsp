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
			<li><a href="#" id="signin">아이디 찾기</a></li>
			<li><a href="#" id="signup">비밀번호 찾기</a></li>
		</ul>
		<br>
		<br>



		<!-- Form -->
		<form action="" method="post">
			<!-- email input -->
			<div class="first-input input__block first-input__block">
				<input type="text" placeholder=" 이름" class="input" id="user_id" />
			</div>



			<!-- sign in button -->
			<button class="signin__btn">아이디 찾기</button>
		</form>
	</div>





	<!-- footer -->
	<%@ include file="../include/footer.jsp"%>

	<!-- link that opens popup -->


	<script>
		$('#datepicker').datepicker({
			iconsLibrary : 'fontawesome',
			icons : {
				rightIcon : '<span class="fa fa-caret-down"></span>'
			}
		});
		$('#datepicker2').datepicker({
			iconsLibrary : 'fontawesome',
			icons : {
				rightIcon : '<span class="fa fa-caret-down"></span>'
			}

		});

		$(document).ready(
				function() {
					let signup = $(".links").find("li").find("#signup");
					let signin = $(".links").find("li").find("#signin");
					let reset = $(".links").find("li").find("#reset");
					let first_input = $("form").find(".first-input");
					let hidden_input = $("form").find(".input__block").find(
							"#repeat__password");
					let signin_btn = $("form").find(".signin__btn");

					//----------- pass find---------------------
					signup.on("click", function(e) {
						e.preventDefault();
						$(this).parent().parent().siblings("h1")
								.text("비밀번호 찾기");
						$(this).parent().css("opacity", "1");
						$(this).parent().siblings().css("opacity", ".6");
						first_input.removeClass("first-input__block").addClass(
								"signup-input__block");
						hidden_input.css({
							"opacity" : "1",
							"display" : "block"
						});
						signin_btn.text("비밀번호 찾기");
					});

					//----------- id find ---------------------
					signin.on("click",
							function(e) {
								e.preventDefault();
								$(this).parent().parent().siblings("h1").text(
										"아이디 찾기");
								$(this).parent().css("opacity", "1");
								$(this).parent().siblings()
										.css("opacity", ".6");
								first_input.addClass("first-input__block")
										.removeClass("signup-input__block");
								hidden_input.css({
									"opacity" : "0",
									"display" : "none"
								});
								signin_btn.text("아이디 찾기");
							});

					//----------- reset ---------------------
					reset.on("click", function(e) {
						e.preventDefault();
						$(this).parent().parent().siblings("form").find(
								".input__block").find(".input").val("");
					})
				});
	</script>



</body>

</html>