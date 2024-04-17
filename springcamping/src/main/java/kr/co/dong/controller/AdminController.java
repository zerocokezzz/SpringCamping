package kr.co.dong.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import kr.co.dong.DTO.PayInDTO;
import kr.co.dong.DTO.PayOutDTO;
import kr.co.dong.DTO.RentalDTO;
import kr.co.dong.DTO.RentalInfoDTO;
import kr.co.dong.DTO.ResDTO;
import kr.co.dong.DTO.ShopInfoDTO;
import kr.co.dong.DTO.UserDTO;
import kr.co.dong.VO.BuyPayInVO;
import kr.co.dong.VO.BuyPayOutVO;
import kr.co.dong.VO.PayInResVO;
import kr.co.dong.VO.PayOutResVO;
import kr.co.dong.service.AdminService;
import kr.co.dong.service.MypageService;

@Controller
public class AdminController {
    
    @Autowired
    AdminService adminService;
    
	@Autowired
	MypageService mypageService;
    
//	Admin : 관리자ㅣ!!
	//buyListAdmin : 구매관리
	@GetMapping(value = "admin/buyAdmin")
	public String buyListAdmin(Model model) {
		List<BuyPayInVO> buyListAdmin = adminService.buyListAdmin();
		
		model.addAttribute("buyListAdmin", buyListAdmin);
		return "admin/buyAdmin";
	}
	
	//buyDetail
	@GetMapping(value="admin/buyDetail")
	public String buyDetailAdmin(Model model, @RequestParam("shop_no") int shop_no, @RequestParam("buy_no") int buy_no, @RequestParam("pay_no") int pay_no) {
		ShopInfoDTO shopInfo =  adminService.selectShopinfo(shop_no);
		BuyDTO buy = adminService.selectBuy(buy_no);
		PayDTO pay =  adminService.selectPay(pay_no);
		
		model.addAttribute("shopInfo", shopInfo);
		model.addAttribute("buy", buy);
		model.addAttribute("pay", pay);
		model.addAttribute("pay_no", pay_no);
		return "admin/buyDetail";
	}
	
	//buyOutList
	//select shop_info all 해서 넣으면 좋을 듯
	@GetMapping(value="admin/buyOutAdmin")
	public String buyOutListAdmin(Model model){
		List<BuyPayOutVO> buyOutListAdmin = adminService.buyOutListAdmin();
		
		model.addAttribute("buyOutListAdmin", buyOutListAdmin);
		return "admin/buyOutAdmin";
	}
	
	//buyAddShop
	//구매등록 -> buyAdmin 으로 보내기
	@PostMapping(value = "admin/buyAddShop")
	public String buyAddShop(BuyDTO buy, CartDTO cart, PayDTO pay) {
		//buyAddPayin : 결제완료정보 payin에 insert
		adminService.buyAddShop(buy);
		
		cart.setBuy_no(buy.getBuy_no());
		cart.setUser_id(buy.getUser_id());
		adminService.cartInsert(cart);
		
		ShopInfoDTO shopinfo = adminService.selectShopinfo(buy.getShop_no());
		int price = shopinfo.getShop_price() * buy.getBuy_amount();
		
		pay.setCart_no(cart.getCart_no());
		pay.setUser_id(buy.getUser_id());
		pay.setPay_price(price);
		pay.setPay_ment("계좌이체");
		
		adminService.payInsertCart(pay);
		adminService.payInInsert(pay.getPay_no());
		
		return "redirect:buyAdmin";
	}
	
	//buyInsert
	//구매등록이동
	@GetMapping(value = "admin/buyInsert")
	public String buyInsert() {
		System.out.println("구매등록이동");
		return "admin/buyInsert";
	}
	
	//buyUpdateForm
	@GetMapping(value = "/admin/buyUpdate")
	public String stupid(Model model, @RequestParam("shop_no") int shop_no, @RequestParam("buy_no") int buy_no, @RequestParam("pay_no") int pay_no) {
		ShopInfoDTO shopInfo =  adminService.selectShopinfo(shop_no);
		BuyDTO buy = adminService.selectBuy(buy_no);
		PayDTO pay = adminService.selectPay(pay_no);
		
		model.addAttribute("shopInfo", shopInfo);
		model.addAttribute("buy", buy);
		model.addAttribute("pay", pay);
		model.addAttribute("pay_no", pay_no);
		return "admin/buyUpdate";
	}
	
	//buyUpdate
	@PostMapping(value = "/admin/buyUpdatePost")
	public String buyUpdate(BuyDTO buy, @RequestParam("pay_no") int pay_no, PayOutDTO payout) {
		int a = adminService.buyUpdate(buy);
		
		if(buy.getBuy_paystate().equals("X")) {
			PayDTO pay = adminService.selectPay(pay_no);
			PayInDTO payin = adminService.selectPayinPayno(pay_no);
			
			payout.setPayout_name("2");
			payout.setPayout_price(pay.getPay_price());
			payout.setPayout_ment(pay.getPay_ment());
			payout.setPayin_no(payin.getPayin_no()); 
			
			adminService.payoutInsert(payout);
		}
		
		return "redirect:/admin/buyAdmin";
	}
	
	//amountUpdate
	
  //예약관리!!!
	//resListAdmin
	@GetMapping(value = "admin/resAdmin")
	public String resListAdmin(Model model) {
		List<PayInResVO> payInResVO = adminService.resListAdmin();
		
		model.addAttribute("payInResVO", payInResVO);
		
		return "admin/resAdmin";
	}
	
	//resDetail
	@GetMapping(value = "admin/resDetail")
	public String resDetailAdmin(Model model, @RequestParam("res_no") int res_no) {
	
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
		
		return "admin/resDetail";
	}
	
	//resOutListAdmin
	@GetMapping(value = "admin/resOutAdmin")
	public String resOutListAdmin(Model model) {
		List<PayOutResVO> payOutRes = adminService.resOutListAdmin();
		model.addAttribute("payOutRes", payOutRes);
		return "admin/resOutAdmin";
	}
	
	//resAddCamp
	//예약등록 -> resAdmin 으로 보내기
	@PostMapping(value = "admin/resAddCamp")
	public String resAddCamp(ResDTO resDTO, RentalDTO rentalDTO, PayDTO payDTO) {
		//buyAddPayin : 결제완료정보 payin에 insert
		adminService.resAdd(resDTO);
		
		rentalDTO.setRes_no(resDTO.getRes_no());
		adminService.rentalInsert(rentalDTO);
		
		payDTO.setRentalres_no(rentalDTO.getRentalres_no());
		adminService.payInsert(payDTO);
		
		payDTO.setPay_price(0);
		adminService.payInInsert(payDTO.getPay_no());
		return "redirect:resAdmin";
	}
	
	//resInsert
	//예약등록이동
	@GetMapping(value = "admin/resInsert")
	public String bresInsert(Model model) {
		List<RentalInfoDTO> rentalinfo = adminService.selectRentalInfo();
		model.addAttribute("rentalinfo", rentalinfo);
		return "admin/resInsert";
	}
	
	//resUpdate
	@GetMapping(value="/admin/resUpdate")
	public String resupdate(Model model, ResDTO resDTO) {
		RentalDTO rental = adminService.selectRental(resDTO.getRes_no());
		ResDTO res = adminService.selectRes(resDTO.getRes_no());
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
		return "admin/resUpdate";
	}
	
	//resUpdate
	@PostMapping(value = "/admin/resUpdatePost")
	public String resupdatepost(ResDTO res, @RequestParam("pay_no") int pay_no, PayOutDTO payout) {
		adminService.resUpdate(res);
		
		if(res.getRes_paystate().equals("X")) {
			PayDTO pay = adminService.selectPay(pay_no);
			PayInDTO payin = adminService.selectPayinPayno(pay_no);
			
			payout.setPayout_name("1");
			payout.setUser_id(res.getUser_id());
			payout.setPayout_price(pay.getPay_price());
			payout.setPayout_ment(pay.getPay_ment());
			payout.setPayin_no(payin.getPayin_no());
			
			adminService.payoutInsert(payout);
		}
		return "redirect:/admin/resAdmin";
	}
	
	//payinDelete
	
	//buyAddPayin
	//결제완료정보 payin에 insert
	
	
	//payoutInsert
	
	//campInsert
	
	//rentalInsert
	
	//campCart
	
	//resCal
	
	//selectDate
    
    // 매출통계 전체목록
    @GetMapping(value="/admin/sales")
    public String sales() {
        return "/admin/sales";
    }
 
    // 매출통계 전체목록   
    @ResponseBody
    @PostMapping(value="/admin/sales")
	public Map<String, Object> sales(String start_pay_datetime, String end_pay_datetime) {
    	Map<String, Object> pay_dateMap = new HashMap<>();
    	pay_dateMap.put("start_pay_datetime", start_pay_datetime);
    	pay_dateMap.put("end_pay_datetime", end_pay_datetime);
        return adminService.sales(pay_dateMap);
	}
    
//	admin 회원목록
	@GetMapping("admin/userAdmin")
	public String userAdmin(Model model) {
		
		List<UserDTO> listAll = adminService.listAll();
		model.addAttribute("listAll", listAll);
		
		return "admin/userAdmin";
	}
	
//	회원상세보기
	@GetMapping("admin/userDetail")
	public Object userDetail(@RequestParam ("user_id") String user_id, Model model) {
		UserDTO ud = new UserDTO();
		ud.setUser_id(user_id);

		UserDTO userDTO = adminService.userDetail(ud);
		model.addAttribute("user", userDTO);
		return "admin/userDetail";
	}
	
//	회원정보 수정하기
	@PostMapping("admin/userUpdate")
	@ResponseBody
	public Object userUpdate(UserDTO ud, HttpSession session) {
		int userUpdate = adminService.userUpdate(ud);	
		Map<String, Object> resultMap = new HashMap<String, Object>();
		if (userUpdate > 0) {
			resultMap.put("userUpdate", true);
		} else {
			resultMap.put("userUpdate", false);
		}
		return resultMap;
		
	}
	
//	회원탈퇴하기
	@PostMapping("admin/userDelete")
	@ResponseBody
	public Object userDelete(UserDTO ud, HttpSession session) {
		
		int userDelete = mypageService.userDelete(ud);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		if(userDelete > 0) {
			resultMap.put("userDelete", true);
		}else {
			resultMap.put("userDelete", false);
		}
		
		return resultMap;
	}

    
    
}