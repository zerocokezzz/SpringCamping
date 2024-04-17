package kr.co.dong.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dong.DAO.AdminDAOImpl;
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
import kr.co.dong.VO.adminVO;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	AdminDAOImpl adminDAO;
	
	@Override
	public List<BuyPayInVO> buyListAdmin() {
		System.out.println("하...........");
		return adminDAO.buyListAdmin();
	}

	@Override
	public ShopInfoDTO selectShopinfo(int shop_no) {
		return adminDAO.selectShopinfo(shop_no);
	}

	@Override
	public BuyDTO selectBuy(int buy_no) {
		return adminDAO.selectBuy(buy_no);
	}

	@Override
	public PayDTO selectPay(int pay_no) {
		return adminDAO.selectPay(pay_no);
	}

	@Override
	public List<BuyPayOutVO> buyOutListAdmin() {
		return adminDAO.buyOutListAdmin();
	}

	@Override
	public int buyAddShop(BuyDTO buyDTO) {
		return adminDAO.buyAddShop(buyDTO);
	}

	@Override
	public int cartInsert(CartDTO cartDTO) {
		return adminDAO.cartInsert(cartDTO);
	}

	@Override
	public int payInsertCart(PayDTO payDTO) {
		return adminDAO.payInsertCart(payDTO);
	}

	@Override
	public int buyUpdate(BuyDTO buyDTO) {
		return adminDAO.buyUpdate(buyDTO);
	}

	@Override
	public int amountUpdate(BuyDTO buyDTO) {
		return adminDAO.amountUpdate(buyDTO);
	}

	@Override
	public PayInDTO selectPayinPayno(int pay_no) {
		return adminDAO.selectPayinPayno(pay_no);
	}

	@Override
	public List<PayInResVO> resListAdmin() {
		return adminDAO.resListAdmin();
	}
	
	@Override
	public List<RentalInfoDTO> selectRentalInfo() {
		return adminDAO.selectRentalInfo();
	}
	
	@Override
	public RentalDTO selectRental(int rentalres_no) {
		return adminDAO.selectRental(rentalres_no);
	}

	@Override
	public ResDTO selectRes(int res_no) {
		return adminDAO.selectRes(res_no);
	}
	
	@Override
	public PayDTO selectPayRentalres(int rentalres_no) {
		return adminDAO.selectPayRentalres(rentalres_no);
	}

	@Override
	public List<PayOutResVO> resOutListAdmin() {
		return adminDAO.resOutListAdmin();
	}

	@Override
	public int resAdd(ResDTO resDTO) {
		return adminDAO.resAdd(resDTO);
	}

	@Override
	public int resUpdate(ResDTO resDTO) {
		return adminDAO.resUpdate(resDTO);
	}

	@Override
	public int payinDelete(PayInDTO payinDTO) {
		return adminDAO.payinDelete(payinDTO);
	}

	@Override
	public int buyAddPayin(String user_id ) {
		return adminDAO.buyAddPayin(user_id);
	}

	@Override
	public int payoutInsert(PayOutDTO payoutDTO) {
		return adminDAO.payoutInsert(payoutDTO);
	}

	@Override
	public int payInsert(PayDTO payDTO) {
		return adminDAO.payInsert(payDTO);
	}
	
	@Override
	public int payInInsert(int pay_no) {
		return adminDAO.payInInsert(pay_no);
	}
	
	@Override
	public int campInsert(ResDTO resDTO) {
		return adminDAO.campInsert(resDTO);
	}

	@Override
	public int rentalInsert(RentalDTO rentalDTO) {
		return adminDAO.rentalInsert(rentalDTO);
	}

	@Override
	public int campCart(ResDTO resDTO) {
		return adminDAO.campCart(resDTO);
	}

	@Override
	public List<PayInResVO> resCal(String date) {
		return adminDAO.resCal(date);
	}

	@Override
	public int selectDate(String date) {
		return adminDAO.selectDate(date);
	}
	
	@Override
    public Map<String, Object> sales(Map<String, Object> pay_dateMap) {
        List<adminVO> sales = adminDAO.sales(pay_dateMap);
        
        // 총금액 초기화
        int totalPayPrice = 0;
        int totalPayoutPrice = 0;
        
        // 결제 및 결제 취소 총금액 계산
        for (adminVO sale : sales) {
            totalPayPrice += sale.getPay_price();
            totalPayoutPrice += sale.getPayout_price();
        }

        // 결과를 Map에 담아 JSON으로 반환
        Map<String, Object> result = new HashMap<>();
        result.put("salesData", sales);
        result.put("totalPayPrice", totalPayPrice);
        result.put("totalPayoutPrice", totalPayoutPrice);

        return result;
    }
	
//	회원목록조회
	@Override
	public List<UserDTO> listAll() {
		// TODO Auto-generated method stub
		return adminDAO.listAll();
	}

//	회원상세보기
	@Override
	public UserDTO userDetail(UserDTO ud) {
		// TODO Auto-generated method stub
		return adminDAO.userDetail(ud);
	}

//	회원정보 수정하기
	@Override
	public int userUpdate(UserDTO ud) {
		// TODO Auto-generated method stub
		return adminDAO.userUpdate(ud);
	}


}
