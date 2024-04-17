<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <%@ include file ="../include/head.jsp" %> 
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
        <h3> 공지사항 수정 </h3>
    </div>
    <!-- bradcam_area_end -->

    <!-- Main content -->

	<div class="container">
	<div class="section_title text-center mb-100">
	<div class="offers_area padding_top">
	<div class="row" style="margin-bottom: 20px; margin-left: 1px;">
	<div class="col-lg-12">
	<h1 class="page-header">공지사항 수정</h1>
	</div>
	</div>
	</div>

	<div class="panel" style="margin-left:1px;">
	<div id="contAreaBox">
	<div class="panel">
	<div class="panel-body">
	<form role="form" method="post">
	<div class="table-responsive" style="text-align:center;">
	<table id="datatable-scroller" class="table table-bordered tbl_Form">
	
	<colgroup>
		<col width="250px" />
	</colgroup>
	
	<tbody>
	<tr>
		<th width=10% class="text-center">분류</th>
		<td width=10% class="text-center">공지</td>	
		<th width=10% class="text-center">제목</th>	
		<td width=70% class="text-center"><input type="text" name="notice_title" class="form-control" value="${notice.notice_title }"></td>	
	</tr>
	
	<tr>
		<th>내용</th>
		<td colspan="3" valign="top">
   		<pre width=100% class="text-center"><textarea class="form-control" name="notice_content">${notice.notice_content }</textarea></pre>
   		</td>
	</tr>

	</tbody>
    
	
	</table>
	<div style="display: inline-block; margin: 0 5px; float:right;"> 
	<div style="margin-left:1px;">
	
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

		<button class="btn btn-warning" type="button" data-toggle="modal" data-target="#updateModal">수정완료</button>
	
	<!-- Modal -->
		<div class="modal fade" id="updateModal" tabindex="-1" aria-labelledby="updateModalLabel" aria-hidden="true">
 		<div class="modal-dialog">
    	<div class="modal-content">
     	<div class="modal-header">
        	<h5 class="modal-title" id="#updateModalLabel">공지사항 수정</h5>
			<button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>

		</div>
		<div class="modal-body">
			해당 공지사항을 수정하시겠습니까?
		</div>
		<div class="modal-footer">
        	<button type="submit" class="btn btn-primary">수정완료</button>
        	<button type="button" class="btn btn-secondary" data-dismiss="modal">취소하기</button>
      	</div>
		</div>
		</div>
		</div>

		<a class="btn btn-primary" type="button" href="../board/noticeAll?num=1">수정취소</a>
		
	</div>
	</div>
	
	</div>
	</form>
	</div>
	</div>
	</div>
	</div>    


    </div>
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

</html>