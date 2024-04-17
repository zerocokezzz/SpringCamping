<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
   <%@ include file ="../include/head.jsp" %> 
   <!-- 만약 이게 안될때는 세미콜론 앞에다가 !important 붙여주면 됨. by정우 -->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <style>
		label{cursor : default;}
		
		.fileDrop{
	    width: 80%,
	    height: 100px,
	    border: 1px dotted gray;
	    background-color: lightslategrey;
	    margin: auto;
    	}
   </style>
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
           alert("이미 존재하는 물품 입니다. 수정 메뉴를 이용해주세요");
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
    <!-- header-start -->
    <header>
       <%@ include file ="../include/nav.jsp" %>
    </header>
    <!-- header-end -->

    <!-- bradcam_area_start -->
    <div class="bradcam_area breadcam_bg_1">
        <h3> 렌탈정보 추가 </h3>
    </div>
    <!-- bradcam_area_end -->

    <!-- Main content -->
    <div class = "본문">
	    <form role="form" method="post" enctype="multipart/form-data">
			<div class="mt-10">
				<label>렌탈물품타입</label>
					<select name="rental_type" class="form-control">
						<option>F</option>
					</select>
			</div>
			<div class="mt-10">
				<label>렌탈물품번호</label>
					<select name="rental_index" class="form-control">
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
					</select>
			</div>
			<div class="mt-10">
				<label>렌탈물품명</label>
				<input name="rental_name" class="form-control" placeholder="렌탈물품명을 입력해주세요" required>
			</div>
			<div class="mt-10">
				<label style="cursor: default;">렌탈 가격</label>
				<input name="rental_price" class="form-control" placeholder="숫자로 입력해주세요" required>
			</div>
			<div class="mt-10">
				<label>설명</label>
				<textarea class="form-control" name="rental_content" rows="3"
					placeholder="설명을 입력하세요"></textarea>
			</div>
			<div class="mt-10">
				<label>추가내용</label>
				<textarea class="form-control" name="rental_etc" rows="3"
					placeholder="추가내용을 입력하세요"></textarea>
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
</body>

</html>