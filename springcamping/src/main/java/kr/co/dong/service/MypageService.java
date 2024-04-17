package kr.co.dong.service;

import java.util.List;
import java.util.Map;

import kr.co.dong.DTO.BuyDTO;
import kr.co.dong.DTO.CartDTO;
import kr.co.dong.DTO.PayDTO;
import kr.co.dong.DTO.ShopInfoDTO;
import kr.co.dong.DTO.UserDTO;
import kr.co.dong.VO.BuyPayInVO;
import kr.co.dong.VO.BuyPayOutVO;
import kr.co.dong.VO.CartVO;
import kr.co.dong.VO.PayInResVO;
import kr.co.dong.VO.PayOutResVO;

public interface MypageService {
	
//	마이페이지
//	구매내역
	
	//마이페이지의 구매확인내역
	public List<BuyPayInVO> buyList(String user_id);
	
	//마이페이지의 구매취소내역
	public List<BuyPayOutVO> buyOutList(String user_id);
	
	//구매상세내역
	public ShopInfoDTO selectShopInfo(int shop_no);
	
	public BuyDTO selectBuy(int buy_no);
	
	public PayDTO selectPay(int pay_no);
	
//	예약내역
	// 마이페이지의 예약확인내역
	public List<PayInResVO> resList(String user_id);
	
	// 마이페이지의 예약취소내역
	public List<PayOutResVO> resOutList(String user_id);
	
// 닉네임 수정
	public UserDTO nickCheck(UserDTO ud);
	
	// 회원정보 수정
	public int userUpdate(UserDTO ud);
	
	// 회원탈퇴
	public int userDelete(UserDTO ud);
	
	//장바구니
	public List<CartVO> cart(UserDTO ud);
	
	//장바구니
	public List<Map<String, Object>> cartMap(UserDTO ud);
	
	//장바구니 삭제
	public int deleteCart(CartDTO ct);


}
