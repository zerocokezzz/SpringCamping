<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <%@ include file ="../include/head.jsp" %> 
    
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
$(document).ready(function(){
	qactlist();
      $(document).on('click','#btnqacomentsave', function(){ 
         var qact_content = $("#qact_content").val();
         var url = "${pageContext.request.contextPath}/qna_coments/qactinsert"; //댓글 쓰기
         var paramData = {
               "qact_content" : qact_content,
               "qact_title" : qact_content,
               "qa_no" : "${qnadetail.qa_no}"
         }; 
         $.ajax({
            type: "POST",
            url: url,
            data : paramData,
            dataType : 'json',
            success:function(result){
            	alert("댓글추가완료")
               qactlist();
            },
            error : function(data){
               console.log(data);
               alert("댓글 추가x.");
            }
         });         
      });
}); // 추가 끝

function qactlist(){
	var url = "${pageContext.request.contextPath}/qna_coments/qactlist";
	var paramData = {
			"qa_no" : "${qnadetail.qa_no}"
	}
	$.ajax({
		url : url,          
		data : paramData,   
		dataType : 'json',  
		type : 'POST',      
		success : function(result){
			var htmls = "";
            if(result.length < 1){
               htmls = htmls + "<h3 style='margin-left: 10px;'>등록된 QnA댓글 없음</h3>";
            }
            else{
               $(result).each(function(){
                  htmls = htmls + '<div class="" id="qact_no' +this.qact_no + '">';
                  htmls += '<span class="d-block" style="margin-left: 10px;">';
                  htmls += '  '+'관리자' + ' - ';
                  htmls += '<strong class="text-gray-dark" style="margin-left: 10px;">'+' date : ' + this.qact_todaydate + '</strong>';
                  htmls += '<strong class="text-gray-dark">' + this.qact_content;
                  htmls += '<span style="padding-left: 7px; font-size: 9pt">';
                  htmls += '<a href="javascript:void(0)" onclick="fn_qactupdate(' + this.qact_no + ', \'' + this.qact_content + '\' )" style="padding-right:5px; font-size: 14px;">수정</a>';
                  htmls += '<a href="javascript:void(0)" onclick="qactdelete(' + this.qact_no + ')" style="font-size:14px;">삭제</a>';
                  htmls += '</span>';
                  htmls += '</span><br>';
                  htmls += '</p>';
                  htmls += '</div>';   
               });  // each End
            }
            $("#qactlist").html(htmls);
			
		},
		error : function(data){
           console.log(data);
			alert("리스트에러." + data);
		}
	});
}// end of qactlist()

function fn_qactupdate(qact_no,qact_content) {
    var htmls="";
     htmls = htmls + '<div class="" id="qact_no' +qact_no + '">';
    htmls += '<span class="d-block">';
    htmls += "QnA수정하기" + ' - ';
    htmls += '<span style="padding-left: 7px; font-size: 9pt">';
    htmls += '<a href="javascript:void(0)" onclick="qactupdate(\'' + qact_no + '\',\'' +qact_content + '\')" style="padding-right:5px">수정</a>';
    htmls += '<a href="javascript:void(0)" onclick="qactlist()">취소</a>';
    htmls += '</span>';
    htmls += '</span><br>';
    htmls += '<textarea name="qactupdateresult" id="qactupdateresult" class="form-control  rows="3">'
    htmls += qact_content;
    htmls += '</textarea>'
    htmls += '</p>';
    htmls += '</div>';   
    $('#qact_no' +qact_no).replaceWith(htmls);
    $('#qact_no' +qact_no+'#qactupdateresult')
    
 }// 댓글수정 끝
 
 function qactupdate(qact_no,qact_content) {
    var qactupdateresult = $('#qactupdateresult').val();
    var url ="/qna_coments/qactupdate";
    var paramData = {
          "qact_content" : qactupdateresult,
          "qact_no" : qact_no,
          "qa_no" : "${qnadetail.qa_no}"
    };//수정데이터
          $.ajax({
                url : url,
                data : paramData,
                dataType : 'json',
                type : 'POST',
                success : function(result){
                   alert("수정성공")
                   qactlist(); //댓글목록 호출
                },
                error : function(data){
                   alert("QnA 수정 실패 다시고쳐");
                }
             });
          
       };// end of fn_updateReply()
       function qactdelete(qact_no) {
            var url ="/qna_coments/qactdelete";
            var paramData = {
                  "qact_no" : qact_no,
                  "qa_no" : "${qnadetail.qa_no}"
            };
                  $.ajax({
                        url : url,
                        data : paramData,
                        dataType : 'json',
                        type : 'POST',
                        success : function(result){
                           alert("삭제성공");
                           qactlist();
                        },
                        error : function(data){
                           alert("삭제 실패");
                        }
                     });
       } //큐엔에이 딜리트 끝

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
   
    <!-- bradcam_area_end -->

    <!-- Main content -->
   <div class="bradcam_area breadcam_bg_1">
        <h3>미지캠핑 게시판!</h3>
    </div>
    <!-- bradcam_area_end -->
    
    <!-- Main content -->
        <section class="contact-section">
      <div class="table-responsive">
	<div class="box">
			<div class="box-header">
			</div>
			<div class="box-body">
				<div class="form-group">
					<label>제목</label> <input type="text" name="qa_title"
						class="form-control" value="${qnadetail.qa_title}" readonly="readonly" />
				</div>
				<div class="form-group">
					<label>내용</label>
					<textarea name="qa_content" rows="5" readonly="readonly"
						class="form-control">${qnadetail.qa_content}</textarea>
				</div>
			</div>
		</div>
		<button class="datailbtn" style="margin-left: 10px;" onclick="location.href='qnaupdate?qa_no=${qnadetail.qa_no }'">QnA 수정</button>
		<button class="datailbtn" style="margin-left: 10px;" onclick="location.href='qnadelete?qa_no=${qnadetail.qa_no }'">QnA 삭제</button>
		<button class="datailbtn" onclick="location.href='../board/qnalist?num=1'">메인으로</button>
		<div>
		</div>
			<div class="box-footer">
			<div class="box-body" style="margin-bottom: 24px; margin-left: 10px;">
			<table>
			<tr>
			<td rowspan="2" width="90%">
				<textarea class="form-control" name="qact_content" id="qact_content" placeholder="QnA댓글작성" style="resize: none;"></textarea>
			</td>
			</tr>
			<tr>
				<td><button type="button" id="btnqacomentsave" style="height: 62px; border: 1px solid #ced4da; background-color: #fff; border-radius: 0.375rem; padding: 0 15px; cursor: pointer;">댓글작성</button></td>
			</tr>
			</table>			
			</div>
		</div>
		<div id="qactlist"></div>
		</div></section>
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