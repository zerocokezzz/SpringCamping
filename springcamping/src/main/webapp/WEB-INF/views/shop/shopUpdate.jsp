<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
    <%@ include file ="../include/head.jsp" %> 
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
        <h3>상품 수정</h3>
    </div>
    <!-- bradcam_area_end -->

    <!-- Main content -->
    
    <div class="shop-detail">
      <form action="shopupdatePost" method="POSt" enctype="multipart/form-data">
    	<table>
	    	<tr>
		         <td><input type="text" name="shop_name" value="${shopInfo.shop_name}"></td>
		    </tr>
		    <tr>
		         <td><input type="text" name="shop_content" value="${shopInfo.shop_content}"></td>
	        </tr>
		    <tr>
		         <td><input type="text" name="shop_price" value="${shopInfo.shop_price}"></td>
	        </tr>
		    <tr>
		         <td><input type="text" name="shop_cnt" value="${shopInfo.shop_cnt}"></td>
	        </tr>
    	</table>
    		 <input type="hidden" name="shop_no" value="${shopInfo.shop_no}">
	         <input type="hidden" name="shop_update" value="${shopInfo.shop_update}">
         	 <div class="form-group">
			    <!-- 기존 이미지 보여주기 -->
			    <c:forEach var="imgDTO" items="${imgDTO}">
			        <div class="image-preview">
			            <img src="../resources/img/shopInfo/${imgDTO.img_name}" width="200" height="150" alt="이미지">
			            <!-- 이미지 삭제 버튼 -->
			            <button type="button" class="delete-image" data-img_name="${imgDTO.img_name}">이미지 삭제</button>
			        </div>
			    </c:forEach>
			    <!-- 새 이미지 선택 및 미리보기 기능 -->
			    <input type="file" name="imgFile" id="imgFile" multiple/>
			    <div id="preview-container"></div>
			    <hr>
			</div>
			<input type="submit" value="상품 수정">
   	  </form>
    </div>
    
    <!-- Main content End -->
    
    <!-- footer -->
    <%@ include file ="../include/footer.jsp" %>


</body>

</html>