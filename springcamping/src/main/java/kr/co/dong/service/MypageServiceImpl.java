package kr.co.dong.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dong.DAO.MypageDAO;
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

@Service
public class MypageServiceImpl implements MypageService{
	
	@Autowired
	MypageDAO mypageDAO;
	
	@Override
	public List<BuyPayInVO> buyList(String user_id) {
		return mypageDAO.buyList(user_id);
	}

	@Override
	public List<BuyPayOutVO> buyOutList(String user_id) {
		return mypageDAO.buyOutList(user_id);
	}
	
	@Override
	public ShopInfoDTO selectShopInfo(int shop_no) {
		return mypageDAO.selectShopInfo(shop_no);
	}

	@Override
	public BuyDTO selectBuy(int buy_no) {
		return mypageDAO.selectBuy(buy_no);
	}

	@Override
	public PayDTO selectPay(int pay_no) {
		return mypageDAO.selectPay(pay_no);
	}

	@Override
	public List<PayInResVO> resList(String user_id) {
		return mypageDAO.resList(user_id);
	}

	@Override
	public List<PayOutResVO> resOutList(String user_id) {
		return mypageDAO.resOutList(user_id);
	}
	
//	닉네임수정
	@Override
	public UserDTO nickCheck(UserDTO ud) {
		// TODO Auto-generated method stub
		return mypageDAO.nickCheck(ud);
	}
	
	// 회원정보수정
	public int userUpdate(UserDTO ud) {
		// TODO Auto-generated method stub
		return mypageDAO.userUpdate(ud);
	}

	// 회원탈퇴
	public int userDelete(UserDTO ud) {
		// TODO Auto-generated method stub
		return mypageDAO.userDelete(ud);
	}

	// 장바구니
	@Override
	public List<CartVO> cart(UserDTO ud) {
		// TODO Auto-generated method stub
		return mypageDAO.cart(ud);
	}
	
	// 장바구니
	@Override
	public List<Map<String, Object>> cartMap(UserDTO ud) {
		// TODO Auto-generated method stub
		return mypageDAO.cartMap(ud);
	}
	
	// 장바구니 삭제
	@Override
	public int deleteCart(CartDTO ct) {
		// TODO Auto-generated method stub
		return mypageDAO.deleteCart(ct);
	}


}
