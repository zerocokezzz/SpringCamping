package kr.co.dong.service;
import java.util.List;

import kr.co.dong.DTO.BuyDTO;
import kr.co.dong.DTO.CartDTO;
import kr.co.dong.DTO.PayDTO;
import kr.co.dong.DTO.PayInDTO;
import kr.co.dong.DTO.PayOutDTO;
import kr.co.dong.DTO.RentalDTO;
import kr.co.dong.DTO.RentalInfoDTO;
import kr.co.dong.DTO.ResDTO;
import kr.co.dong.DTO.ShopInfoDTO;
import kr.co.dong.VO.BuyPayInVO;
import kr.co.dong.VO.BuyPayOutVO;
import kr.co.dong.VO.PayInResVO;
import kr.co.dong.VO.PayOutResVO;


public interface AdminService2 {

//	관리자페이지
//	구매관리
	//관리자의 구매확인내역
	public List<BuyPayInVO> buyListAdmin();
	
	//shop_info Select: 관리자구매상세내역을 위함
	public ShopInfoDTO selectShopinfo(int shop_no);
	
	//selectBuy
	public BuyDTO selectBuy(int buy_no);
	
	//selectPay
	public PayDTO selectPay(int pay_no);
	
	//관리자의 구매취소내역
	public List<BuyPayOutVO> buyOutListAdmin();
	
	//관리자의 구매등록
	public int buyAddShop(BuyDTO buyDTO);
	
	//CART insert
	public int cartInsert(CartDTO cartDTO);
	
	//cart_no로 pay insert
	public int payInsertCart(PayDTO payDTO);
	
	//관리자의 구매수정
	public int buyUpdate(BuyDTO buyDTO);
	
	//관리자의 쇼핑몰재고수정
	public int amountUpdate(BuyDTO buyDTO);
	
	//payin을 pay_no로 select
	public PayInDTO selectPayinPayno(int pay_no);
	
//	예약관리
	//관리자의 예약내역 (달력)
	
	//관리자의 에약내역(보고서)
	public List<PayInResVO> resListAdmin();
	
	//렌탈물품조회
	public List<RentalInfoDTO> selectRentalInfo();

	//렌탈물품예약조회
	public RentalDTO selectRental(int rentalres_no);
	
	//에약상세보기 : 선택예약조회
	public ResDTO selectRes(int res_no);
	
	//결제정보 조회 : 렌탈물품예약번호로 pay 데이터 보기
	public PayDTO selectPayRentalres(int rentalres_no);
	
	//관리자의 예약취소내역
	public List<PayOutResVO> resOutListAdmin();
	
	//관리자의 예약등록
	public int resAdd(ResDTO resDTO);
	
	//관리자의 예약수정
	public int resUpdate(ResDTO resDTO);
	
	//관리자의 에약&구매 취소
	public int payinDelete(PayInDTO payinDTO);

	//payin에 결제완료 정보 입력하기
	public int buyAddPayin(String user_id);
	
	//payout에 결제취소 정보 입력하기
	public int payoutInsert(PayOutDTO payoutDTO);
	
	//pay에 rentalres_no = 0으로 insert
	public int payInsert(PayDTO payDTO);
	
	//payInInsert : pay에서 pay_no 찾아서 payin에 insert
	public int payInInsert(int pay_no);
	
	
//	실시간예약
	//방 예약정보 입력
	public int campInsert(ResDTO resDTO);
	
	//렌탈 예약정보 입력
	public int rentalInsert(RentalDTO rentalDTO);
	
	//예약 장바구니에 넣기
	public int campCart(ResDTO resDTO);
	
	//예약 불가능한 방 목록 (해당 날짜에 예약되어있는 camp_no 출력 없으면 출려 안 함)
	public List<PayInResVO> resCal(String date);
	
	//예약 가능한 날짜 걸러내기 (예약가능하면 camp_no가 출력)
	public int selectDate(String date);

}
