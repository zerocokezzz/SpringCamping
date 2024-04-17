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
        <h3> 공지사항 </h3>
    </div>
    <!-- bradcam_area_end -->
    
    
    <!-- Main content -->

	<div class="container">
	<div class="section_title text-center mb-100">
	<div class="offers_area padding_top">
	<div class="row" style="margin-bottom: 20px; margin-left: 1px;">
	<div class="col-lg-12">
		<h1 class="page-header">공지사항</h1>
	</div>
	</div>
	</div>

	<div class="panel" style="margin-left:1px;">
	<div id="contAreaBox">
	<div class="panel">
	<div class="panel-body">
	<div class="table-responsive" style="text-align:center;">
	
	<form class="text-center" method="post">
	<table id="datatable-scroller"
		class="table table-bordered tbl_Form">

	<tbody>
	<tr>
		<th width=15% class="text-center">분류</th>
		<td width=15% class="text-center">공지</td>	
		<th width=15% class="text-center">작성일</th>
		<td width=25% class="text-center">${notice.notice_datetime }</td>	
		<th width=15% class="text-center">조회수</th>
		<td width=15% class="text-center">${notice.notice_readcnt }</td>	
	</tr>
	<tr>
		<th class="text-center">제목</th>	
		<td colspan="5" class="text-center">${notice.notice_title }</td>
	</tr>
	<tr>
		<th>내용</th>
		<td colspan="5" class="text-center">
		<textarea class="form-control" name="notice_content" required rows="5" style="background-color:white;" readonly>
			${notice.notice_content }</textarea></td>
	</tr>

	</tbody>
    
	</table>
	</form>


    <c:if test="${user.user_admin==true }">
	<div style="display: inline-block; margin: 0 5px; float:right;"> 
	<div style="margin-left:1px;">
		<a class="btn btn-warning" type="submit" href="../board/noticeUpdate?notice_no=${notice.notice_no }">수정</a>

		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
			
		<button class="btn btn-danger" type="button" data-toggle="modal" data-target="#deleteModal">삭제</button>
	</c:if>	
	
	<!-- Modal -->
		<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
 		<div class="modal-dialog">
    	<div class="modal-content">
     	<div class="modal-header">
        	<h5 class="modal-title" id="#deleteModalLabel">공지사항 삭제</h5>
			<button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>

		</div>
		<div class="modal-body">
			해당 공지사항을 삭제하시겠습니까?
		</div>
		<div class="modal-footer">
        	<a type="submit" class="btn btn-primary" href="../board/noticeDelete?notice_no=${notice.notice_no }">삭제완료</a>
        	<button type="button" class="btn btn-secondary" data-dismiss="modal">취소하기</button>
      	</div>
		</div>
		</div>
		</div>				
			
		<a class="btn btn-primary" type="submit" href="../board/noticeAll?num=1">목록</a>

	</div>
	</div>
	
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
    
    
    <!-- Main content End -->
    
    <!-- footer -->
    <%@ include file ="../include/footer.jsp" %>
    

</body>

</html>