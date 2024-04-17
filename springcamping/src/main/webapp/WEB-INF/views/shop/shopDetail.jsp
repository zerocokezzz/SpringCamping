<%@page import="com.mysql.cj.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <%@ include file ="../include/head.jsp" %> 
    
    <style type="text/css">
	    .right {
			  	width:60%;
				display: flex;
				top:25%;
		        float:  right;
		        box-sizing:  border-box;
		        background:   #0ff;
				margin-top: 3%;
				padding-left: 20px;
			}
			
			 .left {
			 	width:40%;
			 	float: left;
			    left:29%;
			    top:25%;
			    display: flex;
			    justify-content:space-evenly;
			    width: 42%;
			    background-color: white;
			    box-shadow: 1px 1px 25px rgb(0, 0, 0 / 17%);
			    border-radius: 50px;
			}
    </style>
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
        <h3> 상품상세 </h3>
    </div>
    <!-- bradcam_area_end -->

    <!-- Main content -->
        <div class="shop-detail">
       	<c:forEach var="imgDTO" items="${imgDTO }">
			<div class="aa">
				<img src="../resources/img/shopInfo/${imgDTO.img_name}" width="200" height="150" name="img_name">
			</div>
		</c:forEach>
        <h2>${shopInfo.shop_name}</h2>
        <p>${shopInfo.shop_content}</p>
        <p>Price: ${shopInfo.shop_price}</p>
        <p>Stock: ${shopInfo.shop_cnt}</p>
        <!-- Update and Delete buttons -->
        <!-- Update and Delete buttons -->
        
      <c:if test="${user.user_admin==true }">
       
        <!-- Form for quantity selection and pickup date -->
        <form action="addToCart" method="post">
            <input type="hidden" name="shop_no" value="${shopInfo.shop_no}" />
            <label for="quantity">Quantity:</label>
            <input type="number" id="quantity" name="buy_amount" min="1" max="${shopInfo.shop_cnt}" />
            <label for="pickupDate">Pickup Date:</label>
            <input type="date" id="pickupDate" name="buy_date" />
            <button type="button" onclick="btnAddCart()">Add to Cart</button>

        </form>
        
        </c:if>

		<a href="shopUpdate?shop_no=${shopInfo.shop_no }"><button>Update</button></a>
		<a href="shopDelete?shop_no=${shopInfo.shop_no }"><button>Delete</button></a>
        
    </div>
    
    
    <!-- Main content End -->
    
    
    <!-- footer -->
    <%@ include file ="../include/footer.jsp" %>
    
     <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script type="text/javascript">
    	function btnAddCart() {
    		const cart_date = $('#pickupDate');
    		if (cart_date.val() === '') {
    			alert("픽업 날짜를 선택해 주세요.");
    			cart_date.focus();
    			return;
    		}
    		
    		const data = {
    				'cart_date': cart_date.val(),
    				'cart_amount': $('#quantity').val(),
    				'shop_no': '${shopInfo.shop_no}'
    		}
    		
    		$.ajax({
				type : 'post',
				url : '/shop/add/cart',
				data : data,
				async : true,
				contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
				success : function(result) {
					if (confirm("장바구니에 담았습니다. 장바구니로 이동 하시겠습니까?")) {
						location.href = "/mypage/mypage";
					} else {
						location.href = "/shop/shopAll";
					}
				},
				error : function() {
					alert('error');
				}
			})
    	}
				
    </script>
    
    
    
</body>

</html>