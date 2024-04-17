package kr.co.dong.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.dong.DTO.BuyDTO;
import kr.co.dong.DTO.CartDTO;
import kr.co.dong.DTO.ImgDTO;
import kr.co.dong.DTO.ShopInfoDTO;
import kr.co.dong.DTO.UserDTO;
import kr.co.dong.service.BuyService;
import kr.co.dong.service.FacilityServiceImpl;
import kr.co.dong.service.ShopInfoService;

@Controller
public class ShopInfoController {

    @Autowired
    BuyService buyService;
    
    @Autowired
    ShopInfoService shopInfoService;
    
    @Autowired
    FacilityServiceImpl facilityservice;
    
    private static final Logger logger = LoggerFactory.getLogger(ShopInfoController.class);

    // 모든 상품 정보를 보여주는 페이지
    @GetMapping(value = "shop/shopAll")
    public String listAllShops(Model model) {
        List<ShopInfoDTO> shopList = shopInfoService.getAllShopInfos();
        
        // 각 상품에 대한 첫 번째 이미지만 가져와서 설정
        for (ShopInfoDTO shop : shopList) {
            String shopNo = shop.getShop_no();
            List<ImgDTO> imgDTO = facilityservice.detailImage(shopNo);
            System.out.println("찎어보자~~~~~~~~~"+imgDTO);
            if (!imgDTO.isEmpty()) {
                ImgDTO firstImage = imgDTO.get(0); // 첫 번째 이미지 가져오기
                shop.setImage_url(firstImage.getImg_name()); // 첫 번째 이미지 URL을 상품 정보에 설정
                shopInfoService.updateShopInfo(shop);
            }
        }
        
        model.addAttribute("shopList", shopList);
        return "shop/shopAll";
    }
    
    // 상품 상세 정보를 보여주는 페이지
    @GetMapping("shop/shopDetail")
    public String showShopDetail(@RequestParam("shop_no") String shop_no, Model model) {
        ShopInfoDTO shopInfo = shopInfoService.getShopInfoById(shop_no);
        List<ImgDTO> imgDTO = facilityservice.detailImage(shop_no);
        model.addAttribute("shopInfo", shopInfo);
        model.addAttribute("imgDTO", imgDTO);
        return "shop/shopDetail";
    }

    // Buy랑 Cart에 데이터 보내기
    @PostMapping(value = "/shop/addToCart")
    public String addToCart(BuyDTO buy, 
    		CartDTO cart, 
    		Model model, 
    		HttpServletRequest request, 
			HttpSession session) {
    	UserDTO user = (UserDTO)session.getAttribute("user");

    	buy.setUser_id(user.getUser_id());
    	shopInfoService.insertBuy(buy);
    	
    	cart.setUser_id(user.getUser_id());
    	cart.setBuy_no(buy.getBuy_no());
    	shopInfoService.insertCart(cart);
    	
    	return "redirect:shop/shopAll";
    }

    // 상품 등록 페이지
    @GetMapping(value = "shop/shopInsert")
    public String showRegisterForm() {
        return "shop/shopInsert";
    }

    // 상품 등록 처리
    @PostMapping(value = "/shop/shopInsertPost")
    public String registerShop(ShopInfoDTO shopInfoDTO, ImgDTO imgDTO, @RequestParam("imgFile") MultipartFile[] imgFile) {
        int r = shopInfoService.addShopInfo(shopInfoDTO, imgDTO, imgFile);
		if(r != 0) {
			return "redirect:shopAll";
		}
		String errorMessage = "An error occurred while adding camping information.";
		return "redirect:/rental/rentalInsert?error=" + errorMessage;
    }

    // 상품 정보 수정 페이지
    @GetMapping(value = "shop/shopUpdate")
    public String showUpdateForm(@RequestParam("shop_no") String shop_no, Model model) {
    	ShopInfoDTO shop = shopInfoService.getShopInfoById(shop_no);
    	List<ImgDTO> imgDTO = facilityservice.detailImage(shop_no);
        model.addAttribute("shopInfo", shop);
        model.addAttribute("imgDTO", imgDTO);
        return "shop/shopUpdate";
    }

    // 상품 정보 수정 처리
    @PostMapping(value = "shop/shopupdatePost")
    public String updateShop(ShopInfoDTO shop, ImgDTO imgDTO, @RequestParam("imgFile") MultipartFile[] imgFile) {
    	shopInfoService.updateShopInfo(shop, imgDTO, imgFile);
        return "redirect:shopDetail?shop_no=" + shop.getShop_no(); // 수정된 부분
    
    }

    // 상품 삭제 처리
    @GetMapping(value = "/shop/shopDelete")
    public String deleteShop(@RequestParam("shop_no") String shop_no) {
        int r = shopInfoService.deleteShopInfo(shop_no);
        return "redirect:/shop/shopAll";
        
    }
    
//  쇼핑몰 장바구니
	@PostMapping("shop/add/cart")
	@ResponseBody
	public Object login(CartDTO ct, HttpServletRequest request, HttpServletResponse response, HttpSession session,
		Model model) throws UnsupportedEncodingException {
		
		UserDTO user = (UserDTO)session.getAttribute("user");
  	ct.setUser_id(user.getUser_id());
  	
  	int addSuccess;
  	CartDTO cartDTO = shopInfoService.searchCart(ct);
  	if (cartDTO == null) {
  		addSuccess = shopInfoService.insertCart(ct);
  	} else {
  		ct.setCart_no(cartDTO.getCart_no());
  		addSuccess = shopInfoService.updateCartAmount(ct);
  	}
		
		Map<String, Object> resultMap = new HashMap<String, Object>();

		if (addSuccess > 0) {
			resultMap.put("addSuccess", false);
		} else {
			resultMap.put("addSuccess", true);
		}
		return resultMap;
	}


}
