package kr.co.dong.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.dong.DTO.BuyDTO;
import kr.co.dong.DTO.CartDTO;
import kr.co.dong.DTO.PayDTO;
import kr.co.dong.DTO.RentalDTO;
import kr.co.dong.DTO.RentalInfoDTO;
import kr.co.dong.DTO.ResDTO;
import kr.co.dong.DTO.ShopInfoDTO;
import kr.co.dong.DTO.UserDTO;
import kr.co.dong.VO.BuyPayInVO;
import kr.co.dong.VO.BuyPayOutVO;
import kr.co.dong.VO.CartVO;
import kr.co.dong.VO.PayInResVO;
import kr.co.dong.VO.PayOutResVO;
import kr.co.dong.service.AdminService;
import kr.co.dong.service.BookService;
import kr.co.dong.service.MypageService;

@Controller
public class MypageController {
	
	@Autowired
	MypageService mypageService;
	
	@Autowired
	AdminService adminService;
	
	@Autowired
	BookService bookService;
	
//	mypage
	
	//구매랑 구매취소 다 보여줌
	//myBuyAll
	@GetMapping( value = "mypage/myBuyAll")
	public String myBuyList(HttpServletRequest request, 
			HttpSession session, 
			Model model) {
		UserDTO user =  (UserDTO) session.getAttribute("user");
		List<BuyPayInVO> buyList = mypageService.buyList(user.getUser_id());
		List<BuyPayOutVO> buyOutList = mypageService.buyOutList(user.getUser_id());
		model.addAttribute("buyList", buyList);
		model.addAttribute("buyOutList", buyOutList);
		return "mypage/myBuyAll";
	}
	
	//myBuyDetail
	@GetMapping( value = "mypage/myBuyDetail")
	public String myBuyDetail(@RequestParam("shop_no") int shop_no,
			@RequestParam("buy_no") int buy_no,
			@RequestParam("pay_no") int pay_no,
			HttpServletRequest request, 
			HttpSession session, 
			Model model) {
		UserDTO user =  (UserDTO) session.getAttribute("user");
		ShopInfoDTO shopInfo =  mypageService.selectShopInfo(shop_no);
		BuyDTO buy = mypageService.selectBuy(buy_no);
		PayDTO pay =  mypageService.selectPay(pay_no);
		
		model.addAttribute("shopInfo", shopInfo);
		model.addAttribute("buy", buy);
		model.addAttribute("pay", pay);
		return "mypage/myBuyDetail";
	}
	
	
	//예약이랑 예약취소 다 보여줌
	//resList
	@GetMapping(value = "mypage/myResAll")
	public String myResList(HttpServletRequest request, 
			HttpSession session, 
			Model model) {
		UserDTO user =  (UserDTO) session.getAttribute("user");
		List<PayInResVO> resList = mypageService.resList(user.getUser_id());
		List<PayOutResVO> resOutList = mypageService.resOutList(user.getUser_id());
		
		System.out.println(resOutList);
		
		model.addAttribute("resList", resList);
		model.addAttribute("resOutList", resOutList);
		
		return "mypage/myResAll";
	}
	
	//myResDetail
	@GetMapping(value = "mypage/myResDetail")
	public String myResDetail(@RequestParam("res_no") int res_no, Model model) {
		
		ResDTO res = adminService.selectRes(res_no);
		RentalDTO rental = adminService.selectRental(res_no);
		PayDTO pay = adminService.selectPayRentalres(rental.getRentalres_no());
		List<RentalInfoDTO> rentalinfo = adminService.selectRentalInfo();
		
		HashMap<String, Integer> rentalamount = new HashMap<String, Integer>();
		rentalamount.put("F1", rental.getF1_cnt());
		rentalamount.put("F2", rental.getF2_cnt());
		rentalamount.put("F3", rental.getF3_cnt());
		rentalamount.put("F4", rental.getF4_cnt());
		rentalamount.put("F5", rental.getF5_cnt());
		
		model.addAttribute("rental", rental);
		model.addAttribute("res", res);
		model.addAttribute("pay", pay);
		model.addAttribute("rentalinfo", rentalinfo);
		model.addAttribute("rentalamount", rentalamount);
		
		
		return "mypage/myResDetail";
	}
	
//	마이페이지로이동
	@GetMapping("mypage/mypage")
	public String mypage(HttpServletRequest request) {
		return "mypage/mypage";
	}

//	회원수정페이지이동
	@GetMapping("mypage/userUpdate")
	public String userUpdate() {

		return "mypage/userUpdate";
	}

//	닉네임 중복체크
	@PostMapping("mypage/nickcheck")
	@ResponseBody
	public Object nickCheck(UserDTO ud) {
		UserDTO userDTO = mypageService.nickCheck(ud);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		if (userDTO == null) {
			resultMap.put("check", true);
		} else {
			resultMap.put("check", false);
		}
		return resultMap;
	}

//	회원정보 수정하기
	@PostMapping("mypage/userUpdate")
	@ResponseBody
	public Object userUpdate(UserDTO ud, HttpSession session) {
		// Get User Information
		UserDTO userDTO = (UserDTO) session.getAttribute("user");
		ud.setUser_id(userDTO.getUser_id());
		ud.setUser_admin(userDTO.getUser_admin());

		int userUpdate = mypageService.userUpdate(ud);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		if (userUpdate > 0) {
			resultMap.put("userUpdate", true);
			session.setAttribute("user", ud);
		} else {
			resultMap.put("userUpdate", false);
		}
		return resultMap;
	}


//	회원탈퇴
	@PostMapping("mypage/userDelete")
	@ResponseBody
	public Object userDelete(HttpSession session) {

		UserDTO userDTO = (UserDTO) session.getAttribute("user");

		int userDelete = mypageService.userDelete(userDTO);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		if (userDelete > 0) {
			resultMap.put("userDelete", true);
			session.removeAttribute("user");
			session.removeAttribute("sessionTime");
			session.removeAttribute("user_id");
			session.invalidate();
		} else {
			resultMap.put("userDelete", false);
		}

		return resultMap;
	}

	// 장바구니
	@GetMapping("mypage/cart")
	@ResponseBody
	public Object cart(HttpServletRequest request) {
		// Get User Information
		UserDTO userDTO = (UserDTO) request.getSession().getAttribute("user");

		List<CartVO> cartList = mypageService.cart(userDTO);
		List<Map<String, Object>> cartMapList = mypageService.cartMap(userDTO);

		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("cartList", cartMapList);

		return resultMap;
	}
	
	// 장바구니 삭제
	@PostMapping("mypage/delete/cart")
	@ResponseBody
	public Object deleteCart(CartDTO ct, HttpServletRequest request) {
		mypageService.deleteCart(ct);

		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("success", true);

		return resultMap;
	}

	
}
