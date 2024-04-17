<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<!doctype html>
<html class="no-js" lang="zxx">

<head>
<%@ include file ="include/head.jsp" %>
</head>

<body>
    <!--[if lte IE 9]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
        <![endif]-->

    <!-- header-start -->
    <header>
 <%@ include file ="include/nav.jsp" %>
    </header>
    <!-- header-end -->

    <!-- slider_area_start -->
    <div class="slider_area">
        <div class="slider_active owl-carousel">
            <div class="single_slider d-flex align-items-center justify-content-center slider_bg_1">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="slider_text text-center">
                                <h3>2024년 3월 8일 OPEN</h3>
                                <p>스프링 캠프</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="single_slider  d-flex align-items-center justify-content-center slider_bg_2">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="slider_text text-center">
                                <h3>캠핑의 감성과 힐링</h3>
                                <p>편리하게 이용 가능한 캠핑장</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
	            
        </div>
    </div>
    <!-- slider_area_end -->

    <!-- about_area_start -->
    <div class="about_area">
        <div class="container">
            <div class="row">
                <div class="col-xl-5 col-lg-5">
                    <div class="about_info">
                        <div class="section_title mb-20px">
                            <span>소개글</span>
                            <h3>Spring Camping <br>
                                스프링캠핑</h3>
                        </div>
                        <p>"각양각색의 다채로운 색감"</p>
                        <p>캠핑장내에 다양한 부대시설과 편의시설 등 이용객을 최대한 배려하여 공간을 구성하였습니다.
                        다양한 편의시설과 더불어 자연 속에서 힐링할 수 있는 최적의 캠핑공간을 제공합니다.</p>
                        <a href="${contextPath }/springcamping/story" class="line-button">더보기</a>
                    </div>
                </div>
                <div class="col-xl-7 col-lg-7">
                    <div class="about_thumb d-flex">
                        <div class="img_1">
                            <img src="/resources/img/about/about_1.png" style="width: 300px; height: 600;" alt="">
                        </div>
                        <div class="img_2">
                            <img src="/resources/img/about/about_2.png" style="width: 300px; height: 600;" alt="">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- about_area_end -->

    <!-- offers_area_start -->
    <div class="offers_area">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="section_title text-center mb-100">
                        <span>캠핑장</span>
                        <h3>캠핑장 안내</h3>
                    <div class="single_offers">
                        <img src="/resources/img/facilityImg/pix/campMap.jpg" style="width: 900px; height: 1500;" alt="">
                        <span>*상기 이미지에 있는 연출과 소품은 상황에 따라 실제와 다를 수 있습니다.</span>
                        <a href="camp/campInfo" class="book_now">캠핑장 안내보기</a>
                	</div>
             		</div>
       		   </div>
            </div>
		</div>
	</div>


    <!-- offers_area_end -->

    <!-- video_area_start -->
    <div class="video_area video_bg overlay">
        <div class="video_area_inner text-center">
            <span>스프링캠핑</span>
            <h3>스프링캠핑 영상보기</h3>
            <a href="https://www.youtube.com/watch?v=vLnPwxZdW4Y" class="video_btn popup-video">
                <i class="fa fa-play"></i>
            </a>
        </div>
    </div>
    <!-- video_area_end -->

    <!-- about_area_start -->
    <div class="about_area">
        <div class="container">
            <div class="row">
                <div class="col-xl-7 col-lg-7">
                    <div class="about_thumb2 d-flex">
                        <div class="img_1">
                            <img src="/resources/img/about/1.jpg" alt="">
                        </div>
                        <div class="img_2">
                            <img src="/resources/img/about/2.jpg" alt="">
                        </div>
                    </div>
                </div>
                <div class="col-xl-5 col-lg-5">
                    <div class="about_info">
                        <div class="section_title mb-20px">
                            <span>캠핑용품</span>
                            <h3>물품판매 / 물품대여</h3>
                        </div>
                        <p>캠핑에 필요한 다양한 물품을 합리적인 가격으로 편리하게<br>
                         구입/대여가 가능합니다. </p>
                        <a href="/shop/shopAll" class="line-button">더보기</a>
                    </div>
                </div>
                   	<span>*상기 이미지에 있는 연출과 소품은 상황에 따라 실제와 다를 수 있습니다.</span>
            </div>
        </div>
    </div>
    <!-- about_area_end -->

    <!-- features_room_startt -->
    <div class="features_room">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="section_title text-center mb-100">
                        <span>편의시설</span>
                        <h3>편의시설 안내</h3>
                    </div>
                </div>
            </div>
        </div>
        <div class="rooms_here">
            <div class="single_rooms">
                <div class="room_thumb">
                    <img src="/resources/img/facilityImg/store/매점1.png" alt="">
                    <div class="room_heading d-flex justify-content-between align-items-center">
                        <div class="room_heading_inner">
                            <h3>매점</h3>
                        </div>
                        <a href="/amenities/store" class="line-button">더보기</a>
                    </div>
                </div>
            </div>
            <div class="single_rooms">
                <div class="room_thumb">
                    <img src="/resources/img/facilityImg/toiletShowerKitchen/화장실개수대1.png" alt="">
                    <div class="room_heading d-flex justify-content-between align-items-center">
                        <div class="room_heading_inner">
                            <h3>화장실</h3>
                        </div>
                        <a href="/amenities/toiletShowerKitchen" class="line-button">더보기</a>
                    </div>
                </div>
            </div>
            <div class="single_rooms">
                <div class="room_thumb">
                    <img src="/resources/img/facilityImg/toiletShowerKitchen/화장실개수대2.png" alt="">
                    <div class="room_heading d-flex justify-content-between align-items-center">
                        <div class="room_heading_inner">
                            <h3>샤워실</h3>
                        </div>
                        <a href="/amenities/toiletShowerKitchen" class="line-button">더보기</a>
                    </div>
                </div>
            </div>
            <div class="single_rooms">
                <div class="room_thumb">
                    <img src="/resources/img/facilityImg/toiletShowerKitchen/화장실개수대3.png" alt="">
                    <div class="room_heading d-flex justify-content-between align-items-center">
                        <div class="room_heading_inner">
                            <h3>개수대</h3>
                        </div>
                        <a href="/amenities/toiletShowerKitchen" class="line-button">더보기</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- features_room_end -->

    <!-- forQuery_start -->
    <div class="forQuery">
        <div class="container">
            <div class="row">
                <div class="col-xl-10 offset-xl-1 col-md-12">
                    <div class="Query_border">
                        <div class="row align-items-center justify-content-center">
                            <div class="col-xl-6 col-md-6">
                                <div class="Query_text">
                                    <p> ☎ 스프링캠핑 문의 전화 ☎ </p>
                                </div>
                            </div>
                            <div class="col-xl-6 col-md-6">
                                <div class="phone_num">
                                    <a href="#" class="mobile_no"> 010-000-0000</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- forQuery_end-->

    <!-- instragram_area_start -->
    <div class="instragram_area">
        <div class="single_instagram">
            <img src="/resources/img/instragram/1.png" alt="">
            <div class="ovrelay">
                <a href="https://www.instagram.com/p/C4Kk4sIpPpO/">
                    <i class="fa fa-instagram"></i>
                </a>
            </div>
        </div>
        <div class="single_instagram">
            <img src="/resources/img/instragram/2.png" alt="">
            <div class="ovrelay">
                <a href="https://www.instagram.com/p/C4KiUzlJtMa/">
                    <i class="fa fa-instagram"></i>
                </a>
            </div>
        </div>
        <div class="single_instagram">
            <img src="/resources/img/instragram/3.png" alt="">
            <div class="ovrelay">
                <a href="https://www.instagram.com/mzcamping/p/C29X8UIpkHo/">
                    <i class="fa fa-instagram"></i>
                </a>
            </div>
        </div>
        <div class="single_instagram">
            <img src="/resources/img/instragram/4.png" alt="">
            <div class="ovrelay">
                <a href="https://www.instagram.com/mzcamping/p/C29Xn0vpgBd/">
                    <i class="fa fa-instagram"></i>
                </a>
            </div>
        </div>
        <div class="single_instagram">
            <img src="/resources/img/instragram/5.png" alt="">
            <div class="ovrelay">
                <a href="#">
                    <i class="fa fa-instagram"></i>
                </a>
            </div>
        </div>
    </div>
    <!-- instragram_area_end -->

    <!-- footer -->
<%@ include file ="include/footer.jsp" %>

    <!-- link that opens popup -->
    <jsp:include page="popup.jsp"/>

    <!-- form itself end-->
        <form id="test-form" class="white-popup-block mfp-hide">
                <div class="popup_box ">
                        <div class="popup_inner">
                            <h3>Check Availability</h3>
                            <form action="#">
                                <div class="row">
                                    <div class="col-xl-6">
                                        <input id="datepicker" placeholder="Check in date">
                                    </div>
                                    <div class="col-xl-6">
                                        <input id="datepicker2" placeholder="Check out date">
                                    </div>
                                    <div class="col-xl-6">
                                        <select class="form-select wide" id="default-select" class="">
                                            <option data-display="Adult">1</option>
                                            <option value="1">2</option>
                                            <option value="2">3</option>
                                            <option value="3">4</option>
                                        </select>
                                    </div>
                                    <div class="col-xl-6">
                                        <select class="form-select wide" id="default-select" class="">
                                            <option data-display="Children">1</option>
                                            <option value="1">2</option>
                                            <option value="2">3</option>
                                            <option value="3">4</option>
                                        </select>
                                    </div>
                                    <div class="col-xl-12">
                                        <select class="form-select wide" id="default-select" class="">
                                            <option data-display="Room type">Room type</option>
                                            <option value="1">Laxaries Rooms</option>
                                            <option value="2">Deluxe Room</option>
                                            <option value="3">Signature Room</option>
                                            <option value="4">Couple Room</option>
                                        </select>
                                    </div>
                                    <div class="col-xl-12">
                                        <button type="submit" class="boxed-btn3">Check Availability</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
            </form>
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
    <script>
        $('#datepicker').datepicker({
            iconsLibrary: 'fontawesome',
            icons: {
             rightIcon: '<span class="fa fa-caret-down"></span>'
         }
        });
        $('#datepicker2').datepicker({
            iconsLibrary: 'fontawesome',
            icons: {
             rightIcon: '<span class="fa fa-caret-down"></span>'
         }

        });
    </script>



</body>

</html>