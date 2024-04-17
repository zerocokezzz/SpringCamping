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
    <!-- header-start -->
    <header>
       <%@ include file ="../include/nav.jsp" %>
    </header>
    <!-- header-end -->

    <!-- bradcam_area_start -->
    <div class="bradcam_area breadcam_bg_1">
        <h3>캠핑정보 전체목록</h3>
    </div>
    <!-- bradcam_area_end -->

    <!-- Main content -->
    <div class="container">
        <div class="table-responsive">
            <table class="table" border="1">
                <thead>
                    <tr>
                        <th>캠핑장번호</th>
                        <th>사이트타입</th>
                        <th>사이트번호</th>
                        <th>사이트넓이</th>
                        <th>사이트갯수</th>
                        <th>입실시간</th>
                        <th>퇴실시간</th>
                        <th>추가내용</th>
                        <th>기본인원</th>
                        <th>추가가능인원</th>
                        <th>최대가능인원</th>
                        <th>가격</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="campInfo" items="${campAll}">
                        <tr>
                            <td><strong><a href="campDetail?camp_no=${campInfo.camp_no}">${campInfo.camp_no}</a></strong></td>
                            <td>${campInfo.camp_index}</td>
                            <td>${campInfo.camp_size}</td>
                            <td>${campInfo.camp_cnt}</td>
                            <td>${campInfo.camp_checkin}</td>
                            <td>${campInfo.camp_checkout}</td>
                            <td>${campInfo.camp_content}</td>
                            <td>${campInfo.camp_etc}</td>
                            <td>${campInfo.camp_defperson}</td>
                            <td>${campInfo.camp_addperson}</td>
                            <td>${campInfo.camp_allperson}</td>
                            <td>${campInfo.camp_price}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <c:if test="${user.user_admin == true}">
            <div class="button-group-area" style="float: right;">
                <a href="campInsert" class="genric-btn primary">캠핑정보 추가</a>
            </div>
        </c:if>
    </div>
    <!-- Main content End -->

    <!-- footer -->
    <%@ include file ="../include/footer.jsp" %>
    
    
    <!-- form itself end-->
    
    <!-- 예약이랑 로그인 버튼인데..... 그건 구현 후 붙일거임! 여기 건들지 마세요 -->
    
    <!-- form itself end -->

</body>

</html>