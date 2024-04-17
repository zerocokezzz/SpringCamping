<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <%@ include file ="../include/head.jsp" %> 
   <!-- 만약 이게 안될때는 세미콜론 앞에다가 !important 붙여주면 됨. by정우 -->
   <style>
		label{cursor : default;}
   </style>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <script>
   
   // 파일 선택 시 미리보기
	function readURL(input) {
	    if (input.files && input.files[0]) {
	        var reader = new FileReader();
	        reader.onload = function (e) {
	            $('#preview').attr('src', e.target.result);
	        }
	        reader.readAsDataURL(input.files[0]);
	    }
	}
   
	   
	// URL에서 에러 메시지 파라미터 가져오기
   function getErrorMessage() {
       var urlParams = new URLSearchParams(window.location.search);
       var error = urlParams.get('error');
       return error;
   }

   // 에러 메시지를 alert 창으로 표시
   function showAlert() {
       var errorMessage = getErrorMessage();
       if (errorMessage) {
           alert("이미 존재하는 사이트 입니다.");
       }
   }

   // 페이지 로드 후 에러 메시지 확인 및 alert 창 표시
   window.onload = function() {
       showAlert();
   };
   
   	$(document).ready(function() {
		// 폼 제출 시 파일 선택 여부 확인
		$('form').submit(function(event) {
                var fileInput = $('#imgFile');
                // 파일이 선택되었는지 여부 확인
                if (!fileInput.val()) {
                    // 파일이 선택되지 않은 경우 경고 창 표시
                    alert('파일을 선택하세요.');
                    // 폼 제출 취소
                    event.preventDefault();
                }

                // 선택되지 않은 경우 추가완료 버튼 눌렀을 때 경고창 표시
                $('select').each(function() {
                    if ($(this).val() === '선택') {
                        alert('[선택]이라는 부분은 필수로 선택 해야 합니다.');
                        event.preventDefault();
                        return false; // 루프 중단
                    }
                });
            });
	   
	   // 파일 선택을 누를때마다
	   $(document).on('change', '#imgFile', function() {
		    var fileInput = $(this);
		    var file = fileInput[0].files[0];
		    if (!file) {
		        // 파일이 선택되지 않은 경우 미리보기 이미지 제거
		        $('#preview').attr('src', ''); // 이미지를 제거하고 빈 값으로 설정
		    }
		    else {
		        // 파일이 선택된 경우 미리보기 이미지 업데이트
		        var reader = new FileReader();
		        reader.onload = function (e) {
		            $('#preview').attr('src', e.target.result);
		        }
		        reader.readAsDataURL(file);
		    }
		});
   });
   </script>
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
        <h3> 캠핑정보 추가 </h3>
    </div>
    <!-- bradcam_area_end -->

    <!-- Main content -->
    
    <div class = "본문">
    
    
    
    
    
    
    
    
    <form role="form" method="post" enctype="multipart/form-data">
				<div class="mt-10">
					<label>사이트타입</label>
					<select name="camp_type" class="form-control" required>
						<option selected>선택</option>
						<option>A</option>
						<option>B</option>
						<option>C</option>
						<option>D</option>
						<option>E</option>
					</select>
				</div>
				<div class="mt-10">
					<label>사이트번호</label>
					<select name="camp_index" class="form-control" required>
						<option selected>선택</option>
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
						<option>6</option>
						<option>7</option>
						<option>8</option>
						<option>9</option>
						<option>10</option>
					</select>
				</div>
				<div class="mt-10">
					<label style="cursor: default;">사이트넓이</label>
					<select name="camp_size" class="form-control" required>
						<option selected>선택</option>
						<option>5x8</option>
						<option>6x7</option>
						<option>10x10</option>
					</select>
				</div>
				<div class="mt-10">
					<label>사이트갯수</label>
					<select name="camp_cnt" class="form-control" required>
						<option selected>선택</option>
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
						<option>6</option>
						<option>7</option>
						<option>8</option>
						<option>9</option>
						<option>10</option>
					</select>
				</div>
				<div class="mt-10">
					<label>입실시간</label>
					<select name="camp_checkin" class="form-control" required>
						<option selected>선택</option>
						<option>07시</option>
						<option>08시</option>
						<option>09시</option>
						<option>10시</option>
						<option>11시</option>
						<option>12시</option>
						<option>13시</option>
						<option>14시</option>
						<option>15시</option>
					</select>
				</div>
				<div class="mt-10">
					<label>퇴실시간</label>
					<select name="camp_checkout" class="form-control" required>
						<option selected>선택</option>
						<option>07시</option>
						<option>08시</option>
						<option>09시</option>
						<option>10시</option>
						<option>11시</option>
						<option>12시</option>
						<option>13시</option>
						<option>14시</option>
						<option>15시</option>
					</select>
				</div>
				<div class="mt-10">
					<label>가격</label> <input type="text"
						name="camp_price" class="form-control" placeholder="가격을 입력하세요" required>
				</div>
				<div class="mt-10">
					<label>설명</label>
					<textarea class="form-control" name="camp_content" rows="3"
						placeholder="설명을 입력하세요" required></textarea>
				</div>
				<div class="mt-10">
					<label>추가내용</label>
					<textarea class="form-control" name="camp_etc" rows="3"
						placeholder="추가내용을 입력하세요"></textarea>
				</div>
				<div class="mt-10">
					<label>기본인원</label>
					<select name="camp_defperson" class="form-control" required>
						<option selected>선택</option>
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
						<option>6</option>
						<option>7</option>
						<option>8</option>
						<option>9</option>
						<option>10</option>
					</select>
				</div>
				<div class="mt-10">
					<label>추가가능인원</label>
					<select name="camp_addperson" class="form-control">
						<option selected>선택</option>
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
						<option>6</option>
						<option>7</option>
						<option>8</option>
						<option>9</option>
						<option>10</option>
					</select>
				</div>
				<div class="mt-10">
					<label>최대가능인원</label>
					<select name="camp_allperson" class="form-control">
						<option selected>선택</option>
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
						<option>6</option>
						<option>7</option>
						<option>8</option>
						<option>9</option>
						<option>10</option>
					</select>
				</div>
			<div class="form-group" style="height: 150px; width: 200px;">
				<label>이미지 파일 첨부</label> 
	            <input type="file" id="imgFile" name="imgFile" onchange="readURL(this);" placeholder="이미지파일선택" multiple/>
				<img id="preview" src="#" width=200 height=150 alt="선택된 이미지가 없습니다" style="align-content: flex-end; ">
			</div>
			<div class="col-xl-12">
				<button type="submit" class="btn btn-primary">작성완료</button>
			</div>
		</form>
    
    
    </div>
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
   

</body>

    <style>
    .fileDrop{
    width: 80%,
    height: 100px,
    border: 1px dotted gray;
    background-color: lightslategrey;
    margin: auto;
    }
    </style>
</html>