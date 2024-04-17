<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <%@ include file ="../include/head.jsp" %> 
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
		function readURL(input) {
		    var file = input.files[0]; 
		    if (file) {
		        var reader = new FileReader();
		        reader.readAsDataURL(file);
		        reader.onload = function (e) { 
		            $('#preview').attr('src', e.target.result);
		        }
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
		           alert("상품 등록은 최대 100까지 가능합니다. 기존 상품 삭제 후 시도해주세요.");
		       }
		   }

		   // 페이지 로드 후 에러 메시지 확인 및 alert 창 표시
		   window.onload = function() {
		       showAlert();
		   };
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
        <h3> 상품추가 </h3>
    </div>
    <!-- bradcam_area_end -->

    <!-- Main content -->
    
    <div class = "본문">
    
    
    <h2>상품 등록</h2>
	<form action="shopInsertPost" method="post" enctype="multipart/form-data">
    <table>
        <tr>
            <td><label>상품명:</label></td>
            <td><input type="text" id="shop_name" name="shop_name" /></td>
        </tr>
        <tr>
            <td><label>상품 설명:</label></td>
            <td><textarea id="shop_content" name="shop_content"></textarea></td>
        </tr>
        <tr>
            <td><label>가격:</label></td>
            <td><input type="text" id="shop_price" name="shop_price" /></td>
        </tr>
        <tr>
            <td><label>수량:</label></td>
            <td><input type="text" id="shop_cnt" name="shop_cnt" /></td>
        </tr>
        <!-- 기타 필요한 정보 입력 -->
    </table>
    <input type="hidden" name = "image_no">
  	<div class="form-group" style="height: 150px; width: 200px;">
		<label>이미지 파일 첨부</label> 
           <input type="file" name="imgFile" onchange="readURL(this);" placeholder="이미지파일선택" multiple/>
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

   

</body>

</html>