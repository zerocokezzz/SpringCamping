<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <%@ include file ="../include/head.jsp" %> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
        <h3> 제목 </h3>
    </div>
    <!-- bradcam_area_end -->

    <!-- Main content -->
    
    <div class = "본문">
    
        <form role="form" method="post" enctype="multipart/form-data">
			<div class="box-body">
				<div class="mt-10">
					<label>사이트타입</label> <input type="text"
						name="camp_type" class="form-control" value="${campInfo.camp_type }" readonly>
				</div>
				<div class="mt-10">
					<label>사이트번호</label> <input type="text"
						name="camp_index" class="form-control" value="${campInfo.camp_index }" readonly>
				</div>
				<div class="mt-10">
					<label>사이트넓이</label> <input type="text"
						name="camp_size" class="form-control" value="${campInfo.camp_size }">
				</div>
				<div class="mt-10">
					<label>사이트갯수</label> <input type="text"
						name="camp_cnt" class="form-control" value="${campInfo.camp_cnt }">
				</div>
				<div class="mt-10">
					<label>입실시간</label> <input type="text"
						name="camp_checkin" class="form-control" value="${campInfo.camp_checkin }">
				</div>
				<div class="mt-10">
					<label>퇴실시간</label> <input type="text"
						name="camp_checkout" class="form-control" value="${campInfo.camp_checkout }">
				</div>
				<div class="mt-10">
					<label>가격</label> <input type="text"
						name="camp_price" class="form-control" value="${campInfo.camp_price }">
				</div>
				<div class="mt-10">
					<label>설명</label>
					<textarea class="form-control" name="camp_content" rows="3"
						>${campInfo.camp_content }</textarea>
				</div>
				<div class="mt-10">
					<label>추가내용</label>
					<textarea class="form-control" name="camp_etc" rows="3"
						>${campInfo.camp_etc }</textarea>
				</div>
				<div class="mt-10">
					<label>기본인원</label> <input type="text"
						name="camp_defperson" class="form-control" value="${campInfo.camp_defperson }">
				</div>
				<div class="mt-10">
					<label>추가가능인원</label> <input type="text"
						name="camp_addperson" class="form-control" value="${campInfo.camp_addperson }">
				</div>
				<div class="mt-10">
					<label>최대가능인원</label> <input type="text"
						name="camp_allperson" class="form-control" value="${campInfo.camp_allperson }">
				</div>
				<div class="form-group">
				    <label>이미지 파일 첨부</label>
				    <hr>
				    <br>
				    <!-- 기존 이미지 보여주기 -->
				    <c:forEach var="imgDTO" items="${imgDTO}">
				        <div class="image-preview">
				            <img src="../resources/img/facilityImg/campImg/${imgDTO.img_name}" width="200" height="150" alt="이미지">
				            <!-- 이미지 삭제 버튼 -->
				            <button type="button" class="delete-image" data-img_name="${imgDTO.img_name}">이미지 삭제</button>
				        </div>
				    </c:forEach>
				    <!-- 새 이미지 선택 및 미리보기 기능 -->
				    <input type="file" name="imgFile" id="imgFile" multiple/>
				    <div id="preview-container"></div>
				    <hr>
				</div>
			</div>
			<div class="col-xl-12">
				<button type="submit" class="btn btn-primary">수정완료</button>
			</div>
		</form>
	
    
<script type="text/javascript">

$(document).ready(function() {
    // 파일 선택 시 미리보기
    $('#imgFile').on('change', function() {
        $('#preview-container').empty(); // 기존에 미리보기한 이미지 제거
        var files = $(this)[0].files;
        for (var i = 0; i < files.length; i++) {
            var file = files[i];
            var reader = new FileReader();
            reader.onload = function(e) {
                $('#preview-container').append('<div class="image-preview"><img src="' + e.target.result + '" width="200" height="150" alt="미리보기"><button type="button" class="delete-new-image">이미지 삭제</button></div>');
            }
            reader.readAsDataURL(file);
        }
    });
    
    // 파일 선택 취소 버튼 클릭 시
    $(document).on('click', '.delete-new-image', function() {
        // 파일 입력 요소를 선택하여 값을 비움
        $('#imgFile').val('');
        // 선택한 이미지 미리보기를 제거
        $(this).parent('.image-preview').remove();
    });

 	// 기존 이미지 삭제 버튼 클릭 시
    $(document).on('click', '.delete-image', function() {
        var img_name = $(this).data('img_name');
        // 이미지 파일 이름을 서버로 전송
        var $imagePreview = $(this).closest('.image-preview');
        $.ajax({
            url: '/camp/campDeleteImage',
            type: 'POST',
            data: {img_name: img_name},
            success: function(response) {
                // 이미지가 성공적으로 삭제되었을 때의 동작
                // 미리보기를 포함한 이미지를 삭제
                $imagePreview.remove(); // 이미지를 감싸는 컨테이너를 제거
            },
            error: function(xhr, status, error) {
                console.error(error);
            }
        });
    });

    // 새로 업로드한 이미지 삭제
    $(document).on('click', '.delete-new-image', function() {
        $(this).parent('.image-preview').remove();
    });
    
    // 폼 전송 이벤트
    $('form').submit(function(event) {
        // 파일 입력 요소 선택
        var fileInput = $('#imgFile');
        // 파일이 선택되었는지 여부 확인
        if (fileInput.get(0).files.length === 0) {
            // 파일이 선택되지 않은 경우 경고 창 표시
            alert('파일을 선택하세요.');
            // 폼 전송 취소
            event.preventDefault();
        }
    });
});
	
</script>    
    
    
    
    
    
    </div>
    <!-- Main content End -->
    
    <!-- footer -->
    <%@ include file ="../include/footer.jsp" %>
    
    
    <!-- form itself end-->
    
    <!-- 에약이랑 로그인 버튼인데..... 그건 구현 후 붙일거임! 여기 건들 ㄴㄴ -->
    
	<!-- form itself end -->


    <!-- JS here -->
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

</html>