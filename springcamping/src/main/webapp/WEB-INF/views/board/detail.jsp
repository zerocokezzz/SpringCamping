<%@page import="com.mysql.cj.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <%@ include file ="../include/head.jsp" %> 
    <link rel="stylesheet" href="/resources/css/login.css">
    
<style>
.datailbtn {
	border: none;
	background-color: #FF9999;
	color: #fff;
	border-radius: 0.375rem;
	padding: 6px 12px;
	margin: 0 0 20px 6px;
}
</style>
</head>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>

	// 댓글
	$(document).ready(function(){
		ctlist();
	      $(document).on('click','#btncomentsave', function(){ 
	    	 var bno=$("#bno").val();
	         var ct_content = $("#ct_content").val(); // $()=> 문서 객체를 생성함
	         var url = "${pageContext.request.contextPath}/coment/ctinsert"; //댓글 쓰기
	         var paramData = {
	               "ct_content" : ct_content,
	               "bno" :"${board.bno}"
	         }; 
	         $.ajax({
	            type: "POST",
	            url: url,
	            data : paramData,
	            dataType : 'json',
	            success:function(result){
	               ctlist();
	            },
	            error : function(data){
	               console.log(data);
	               alert("에러가 발생햇습니다.");
	            }
	         });         
	      });
	});
	
	// 댓글 목록 보여주기
	function ctlist(){
		var bno=$("#bno").val();
		var url = "${pageContext.request.contextPath}/coment/ctlist";
		var paramData = {
				"bno" : "${board.bno}"
		}
		$.ajax({
			url : url,          // 주소 : 매핑주소
			data : paramData,   // 요청데이터
			dataType : 'json',  // 데이터타입
			type : 'POST',      // 전송방식
			success : function(result){
				var htmls = "";
                if(result.length < 1){
                   htmls = htmls + "<h3>등록된 댓글 없음</h3>";
                }
                else{
                   $(result).each(function(){
                      htmls = htmls + '<div class="" id="ct_no' +this.ct_no + '">';
                      htmls += '<span class="d-block" style="margin-left: 10px;">';
                      htmls += '  '+this.user_id + ' - ';
                      htmls += '<strong class="text-gray-dark" style="margin-left: 10px;">' + this.ct_todaydate + '</strong>';
                      htmls += '<div style="padding: 6px 12px; border: 1px solid #ced4da; width: 500px; height: 56px; border-radius: 0.375rem;">' + this.ct_content + '</div>';
                      htmls += '<span style="padding-left: 7px; font-size: 9pt">';
                      htmls += '<a href="javascript:void(0)" onclick="fn_ctupdate(' + this.ct_no + ', \'' + this.ct_content + '\' )" style="padding-right:5px; font-size: 14px;">수정</a>';
                      htmls += '<a href="javascript:void(0)" onclick="ctdelete(' + this.ct_no + ')" style="font-size:14px;">삭제</a>';
                      htmls += '</span>';
                      htmls += '</span><br>';
                      htmls += '</p>';
                      htmls += '</div>';   
                   });  // each End
                }
                $("#ctlist").html(htmls);
				
			},
			error : function(data){
               console.log(data);
				alert("리스트에러." + data);
			}
		});
	}// end of ctlist()
	
	//댓글 삭제하기 폼없이 바로 삭제하기
	function ctdelete(ct_no) {
		//var ct_no = $('#ct_no').val();
  		var url ="/coment/ctdelete";
  		var paramData = {
  				"ct_no" : ct_no,
  		};
  		      $.ajax({
  		            url : url,
  		            data : paramData,
  		            dataType : 'json',
  		            type : 'POST',
  		            success : function(result){
  		               ctlist();
  		            },
  		            error : function(data){
  		               alert("삭제 실패");
  		            }
  		         });
	}
	
	//댓글 수정하기(form)
  	function fn_ctupdate(ct_no,ct_content) {
  		var htmls="";
  		 htmls = htmls + '<div class="" id="ct_no' +ct_no + '">';
           //<div id="reno12"> <div id="reno13">
  		htmls += '<span class="d-block">';
  		htmls += "댓글수정하기" + ' - ';
  		/* htmls += '<strong class="text-gray-dark">' + rewriter + '</strong>'; */
  		htmls += '<span style="padding-left: 7px; font-size: 9pt">';
  		htmls += '<a href="javascript:void(0)" onclick="ctupdate(\'' + ct_no + '\',\'' + ct_content + '\')" style="padding-right:5px; font-size: 14px;">저장</a>';
  		htmls += '<a href="javascript:void(0)" onclick="ctlist()" style="font-size: 14px;">취소</a>';
  		htmls += '</span>';
  		htmls += '</span><br>';
  		htmls += '<textarea name="ctupdateresult" id="ctupdateresult" class="form-control  rows="3">'
  		htmls += ct_content;
  		htmls += '</textarea>'
  		htmls += '</p>';
  		htmls += '</div>';   
  		// 선택한 요소를 다른것으로 변경합니다.
  		$('#ct_no' +ct_no).replaceWith(htmls);
  		$('#ct_no' +ct_no+'#ctupdateresult')
  		
  	}// 댓글수정 끝
  	
  	function ctupdate(ct_no,ct_content) {
  		var ctupdateresult = $('#ctupdateresult').val();
  		var url ="/coment/ctupdate";
  		var paramData = {
  				"ct_content" : ctupdateresult,
  				"ct_no" : ct_no,
  		};//수정데이터
  		      $.ajax({
  		            url : url,
  		            data : paramData,
  		            dataType : 'json',
  		            type : 'POST',
  		            success : function(result){
  		               ctlist(); //댓글목록 호출
  		            },
  		            error : function(data){
  		               alert("수정 실패 다시고쳐");
  		            }
  		         });
  		      
  		   };// end of fn_updateReply()
	
</script>


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
        <h3>미지캠핑 게시판!</h3>
    </div>
    <!-- bradcam_area_end -->

    <!-- Main content -->
        <section class="contact-section">
      <div class="table-responsive">
    
   <div class="box">
			<div class="box-body">
				<div class="form-group">
					<label>작성자 아이디</label> <input type="text" name="user_id"
						class="form-control" value="${board.user_id }" readonly="readonly" />
				</div>
				<div class="form-group">
					<label>제목</label> <input type="text" name="title"
						class="form-control" value="${board.board_title}" readonly="readonly" />
				</div>
				<div class="form-group">
					<label>내용</label>
					<textarea name="content" rows="5" readonly="readonly"
						class="form-control">${board.board_content}</textarea>
				</div>
			</div>
		</div>
		<br>
		<button class="datailbtn" style="margin-left: 10px;" onclick="location.href='update?bno=${board.bno }'">게시글 수정</button>
		<button class="datailbtn" onclick="location.href='delete?bno=${board.bno }'">게시글 삭제</button>
		<button class="datailbtn" onclick="location.href='../board/boardmain?num=1'">메인으로</button>
		<div>
		</div>
		<div class="box-footer">
			<div class="box-body" style="margin-bottom: 24px; margin-left: 10px;">
			<table>
			<tr>
			<td rowspan="2" width="90%">
				<textarea class="form-control" name="ct_content" id="ct_content" placeholder="댓글작성" style="resize: none;"></textarea>
			</td>
			</tr>
			<tr>
				<td><button type="button" id="btncomentsave" style="height: 62px; border: 1px solid #ced4da; background-color: #fff; border-radius: 0.375rem; padding: 0 15px; cursor: pointer;">저장</button></td>
			</tr>
			</table>			
			</div>
		</div>
		<div id="ctlist"></div>
		</div>
		</section>
    
    <!-- Main content End -->
    
    <!-- footer -->
    <%@ include file ="../include/footer.jsp" %>
    
    
    <!-- form itself end-->
    
    <!-- 에약이랑 로그인 버튼인데..... 그건 구현 후 붙일거임! 여기 건들 ㄴㄴ -->
    
	<!-- form itself end -->


    <!-- JS here -->
    <script src="js/vendor/modernizr-3.5.0.min.js"></script>
    <script src="js/vendor/jquery-1.12.4.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/isotope.pkgd.min.js"></script>
    <script src="js/ajax-form.js"></script>
    <script src="js/waypoints.min.js"></script>
    <script src="js/jquery.counterup.min.js"></script>
    <script src="js/imagesloaded.pkgd.min.js"></script>
    <script src="js/scrollIt.js"></script>
    <script src="js/jquery.scrollUp.min.js"></script>
    <script src="js/wow.min.js"></script>
    <script src="js/nice-select.min.js"></script>
    <script src="js/jquery.slicknav.min.js"></script>
    <script src="js/jquery.magnific-popup.min.js"></script>
    <script src="js/plugins.js"></script>
    <script src="js/gijgo.min.js"></script>

    <!--contact js-->
    <script src="js/contact.js"></script>
    <script src="js/jquery.ajaxchimp.min.js"></script>
    <script src="js/jquery.form.js"></script>
    <script src="js/jquery.validate.min.js"></script>
    <script src="js/mail-script.js"></script>

    <script src="js/main.js"></script>
   

</body>

</html>