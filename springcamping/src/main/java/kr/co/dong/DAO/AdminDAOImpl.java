package kr.co.dong.DAO;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

@Repository
public class AdminDAOImpl implements AdminDAO{
	
	@Autowired
	SqlSession sqlSession;
	
	private static final String nameSpace = "kr.co.dong.adminMapper";
	
	@Override
	public List<BuyPayInVO> buyListAdmin() {
		return sqlSession.selectList(nameSpace + ".buyListAdmin");
	}
	
	@Override
	public ShopInfoDTO selectShopinfo(int shop_no) {
		return sqlSession.selectOne(nameSpace + ".selectShopinfo", shop_no);
	}
	
	@Override
	public BuyDTO selectBuy(int buy_no) {
		return sqlSession.selectOne(nameSpace + ".selectBuy", buy_no);
	}

	@Override
	public PayDTO selectPay(int pay_no) {
		return sqlSession.selectOne(nameSpace + ".selectPay", pay_no);
	}

	@Override
	public List<BuyPayOutVO> buyOutListAdmin() {
		return sqlSession.selectList(nameSpace + ".buyOutListAdmin");
	}

	@Override
	public int buyAddShop(BuyDTO buyDTO) {
		return sqlSession.insert(nameSpace + ".buyAddShop", buyDTO);
	}

	@Override
	public int cartInsert(CartDTO cartDTO) {
		return sqlSession.insert(nameSpace + ".cartInsert", cartDTO);
	}

	@Override
	public int payInsertCart(PayDTO payDTO) {
		return sqlSession.insert(nameSpace + ".payInsertCart", payDTO);
	}
	
	@Override
	public PayInDTO selectPayinPayno(int pay_no) {
		return sqlSession.selectOne(nameSpace + ".selectPayinPayno", pay_no);
	}

	@Override
	public int buyUpdate(BuyDTO buyDTO) {
		return sqlSession.update(nameSpace + ".buyUpdate", buyDTO);
	}

	@Override
	public int amountUpdate(BuyDTO buyDTO) {
		return sqlSession.update(nameSpace + ".amountUpdate", buyDTO);
	}

	@Override
	public List<PayInResVO> resListAdmin() {
		return sqlSession.selectList(nameSpace + ".resListAdmin");
	}
	
	@Override
	public List<RentalInfoDTO> selectRentalInfo() {
		return sqlSession.selectList(nameSpace + ".selectRentalInfo");
	}

	@Override
	public RentalDTO selectRental(int res_no) {
		return sqlSession.selectOne(nameSpace + ".selectRental", res_no);
	}

	@Override
	public ResDTO selectRes(int res_no) {
		return sqlSession.selectOne(nameSpace + ".selectRes", res_no);
	}

	@Override
	public PayDTO selectPayRentalres(int rentalres_no) {
		return sqlSession.selectOne(nameSpace + ".selectPayRentalres", rentalres_no);
	}

	@Override
	public List<PayOutResVO> resOutListAdmin() {
		return sqlSession.selectList(nameSpace + ".resOutListAdmin");
	}
	
	@Override
	public int resAdd(ResDTO resDTO) {
		return sqlSession.insert(nameSpace + ".resAdd", resDTO);
	}

	@Override
	public int resUpdate(ResDTO resDTO) {
		return sqlSession.update(nameSpace + ".resUpdate", resDTO);
	}

	@Override
	public int payinDelete(PayInDTO payinDTO) {
		return sqlSession.delete(nameSpace + ".payinDelete", payinDTO);
	}

	@Override
	public int buyAddPayin(String user_id) {
		return sqlSession.insert(nameSpace +".buyAddPayin", user_id);
	}

	@Override
	public int payoutInsert(PayOutDTO payoutDTO) {
		return sqlSession.insert(nameSpace + ".payoutInsert", payoutDTO);
	}

	@Override
	public int payInsert(PayDTO payDTO) {
		return sqlSession.insert(nameSpace + ".payInsert", payDTO);
	}

	@Override
	public int payInInsert(int pay_no) {
		return sqlSession.insert(nameSpace + ".payInInsert", pay_no);
	}

	@Override
	public int campInsert(ResDTO resDTO) {
		return sqlSession.insert(nameSpace + ".campInsert", resDTO);
	}

	@Override
	public int rentalInsert(RentalDTO rentalDTO) {
		return sqlSession.insert(nameSpace + ".rentalInsert", rentalDTO);
	}

	@Override
	public int campCart(ResDTO resDTO) {
		return sqlSession.insert(nameSpace+".campCart", resDTO);
	}

	@Override
	public List<PayInResVO> resCal(String date) {
		return sqlSession.selectOne(nameSpace + ".resCal", date);
	}

	@Override
	public int selectDate(String date) {
		return sqlSession.selectOne(nameSpace + ".selectDate", date);
	}
	
	// 매출통계 전체목록
	@Override
	public List<adminVO> sales(Map<String, Object> pay_dateMap) {
		
		return sqlSession.selectList(nameSpace + ".sales", pay_dateMap);
	}
	
//	회원목록조회
	@Override
	public List<UserDTO> listAll() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(nameSpace + ".listAll");
	}

//	회원상세보기
	@Override
	public UserDTO userDetail(UserDTO ud) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(nameSpace + ".userDetail", ud);
	}

//	회원정보 수정하기
	@Override
	public int userUpdate(UserDTO ud) {
		// TODO Auto-generated method stub
		return sqlSession.update(nameSpace + ".userUpdate", ud);
	}


}
