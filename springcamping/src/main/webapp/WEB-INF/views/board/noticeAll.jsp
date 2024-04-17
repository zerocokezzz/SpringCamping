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
        <h3>  </h3>
    </div>
    <!-- bradcam_area_end -->
    

    <!-- Main content -->
    
	<div class="container">
	<div class="section_title text-center mb-100">
	<div class="offers_area padding_top">
	<div class="row" style="margin-bottom: 20px; margin-left: 1px;">
	<div class="col-lg-12">
        <h3>공지사항</h3>
	</div>
	</div>
	</div>
	
	
    <!-- notice list area -->
    
	<div class="card-body">
	<div class="table-responsive">
	<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0" style="text-align:center">

		<thead>
                <tr>
                    <th width="10%" class="text-center">번호</th>
       				<th width="45%" class="text-center">제목</th>
       				<th width="20%" class="text-center">작성일</th>
       				<th width="20%" class="text-center">조회수</th>
                </tr>
        </thead>
                
        <tbody>
       		<c:forEach items="${noticeAll }" var="notice">
			<tr>
       			<td width="10%" class="text-center" style="font-size: 13px;">공지</td>
       			<td width="45%" class="text-center"><a href="/board/noticeDetail?notice_no=${notice.notice_no }" >${notice.notice_title }</a></td>
       			<td width="20%" class="text-center">${notice.notice_datetime }</td>
       			<td width="20%" class="text-center">${notice.notice_readcnt }</td>
       		</tr>
       		</c:forEach>
       	</tbody>

    </table>
    
	<div style="display: flex; justify-content: center;">
	<c:if test="${prev}">
		<span>[ <a href="${contextPath }/board/noticeAll?num=${startPageNum - 1}">이전</a> ] </span>
	</c:if>
	<c:forEach begin="${startPageNum}" end="${endPageNum}" var="num">
 		<span style="margin: 0px 10px 0px 0px;">
			<a href="${contextPath }/board/noticeAll?num=${num}">${num}</a> 
		</span>
	</c:forEach>

	<c:if test="${next}">
		<span>[ <a href="${contextPath }/board/noticeAll?num=${endPageNum + 1}">다음</a> ] </span>
	</c:if>
	</div>
	
	
      <c:if test="${user.user_admin==true }">
      	<div style="display: inline-block; margin: 0 5px; float:right;"> 
		<button class="btn" type="button" ><a href="noticeInsert">공지사항 등록</a></button>
	</div>
	</c:if>
	
	
	</div>
    </div>
    </div>
    </div>

    <!-- footer -->
    <%@ include file ="../include/footer.jsp" %>
    
    

</body>

</html>