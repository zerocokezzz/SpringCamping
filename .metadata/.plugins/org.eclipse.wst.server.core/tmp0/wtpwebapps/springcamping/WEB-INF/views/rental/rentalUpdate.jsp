<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <%@ include file ="../include/head.jsp" %> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript">
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
		});
		
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
	
	 	// 기존 이미지 삭제 버튼 클릭 시
	    $(document).on('click', '.delete-image', function() {
	        var img_name = $(this).data('img_name');
	        // 이미지 파일 이름을 서버로 전송
	        var $imagePreview = $(this).closest('.image-preview');
	        $.ajax({
	            url: '/rental/rentalDeleteImage',
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
					<label>렌탈일련번호</label>
					<input name="rental_no" class="form-control" value="${rentalInfo.rental_no}" readonly>
				</div>
				<div class="mt-10">
					<label>렌탈타입</label>
					<input name="rental_type" class="form-control" value="${rentalInfo.rental_type}" readonly>
				</div>
				<div class="mt-10">
					<label>렌탈번호</label>
					<input name="rental_index" class="form-control" value="${rentalInfo.rental_index}" readonly>
				</div>
				<div class="mt-10">
					<label>렌탈물품명</label>
					<input name="rental_name" class="form-control" value="${rentalInfo.rental_name}">
				</div>
				<div class="mt-10">
					<label style="cursor: default;">1일 대여 가격</label>
					<input name="rental_price" class="form-control" value="${rentalInfo.rental_price}">
				</div>
				<div class="mt-10">
					<label>설명</label>
					<textarea class="form-control" name="rental_content" rows="3"
						>${rentalInfo.rental_content}</textarea>
				</div>
				<div class="mt-10">
					<label>추가내용</label>
					<textarea class="form-control" name="rental_etc" rows="3"
						>${rentalInfo.rental_etc}</textarea>
				</div>
				<div class="form-group">
				    <label>이미지 파일 첨부</label>
				    <hr>
				    <br>
				    <!-- 기존 이미지 보여주기 -->
				    <c:forEach var="imgDTO" items="${imgDTO}">
				        <div class="image-preview">
				            <img src="../resources/img/facilityImg/rentalImg/${imgDTO.img_name}" width="200" height="150" alt="이미지">
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
    </div>
    <!-- Main content End -->
    
    <!-- footer -->
    <%@ include file ="../include/footer.jsp" %>
    
    
    <!-- form itself end-->
    
    <!-- 에약이랑 로그인 버튼인데..... 그건 구현 후 붙일거임! 여기 건들 ㄴㄴ -->
    
	<!-- form itself end -->

</body>

</html>