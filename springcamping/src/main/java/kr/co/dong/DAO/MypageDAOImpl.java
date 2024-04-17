package kr.co.dong.DAO;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

@Repository
public class MypageDAOImpl implements MypageDAO{

	@Autowired
	private SqlSession sqlSession;
	
	private static final String nameSpace="kr.co.dong.mypageMapper";

	@Override
	public List<BuyPayInVO> buyList(String user_id) {
		return sqlSession.selectList(nameSpace + ".buyList", user_id);
	}

	@Override
	public List<BuyPayOutVO> buyOutList(String user_id) {
		return sqlSession.selectList(nameSpace + ".buyOutList", user_id);
	}

	@Override
	public ShopInfoDTO selectShopInfo(int shop_no) {
		return sqlSession.selectOne(nameSpace + ".selectShopInfo", shop_no);
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
	public List<PayInResVO> resList(String user_id) {
		return sqlSession.selectList(nameSpace + ".resList", user_id);
	}

	@Override
	public List<PayOutResVO> resOutList(String user_id) {
		return sqlSession.selectList(nameSpace + ".resOutList", user_id);
	}
	
//	닉네임수정
	@Override
	public UserDTO nickCheck(UserDTO ud) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(nameSpace + ".nickCheck", ud);
	}

//	회원정보 수정
	@Override
	public int userUpdate(UserDTO ud) {
		// TODO Auto-generated method stub
		return sqlSession.update(nameSpace + ".userUpdate", ud);
	}
//	회원탈퇴
	@Override
	public int userDelete(UserDTO ud) {
		// TODO Auto-generated method stub
		return sqlSession.update(nameSpace + ".userDelete", ud);
	}

	// 장바구니
	@Override
	public List<CartVO> cart(UserDTO ud) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(nameSpace + ".cart", ud);
	}

	
	// 장바구니
	@Override
	public List<Map<String, Object>> cartMap(UserDTO ud) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(nameSpace + ".cartMap", ud);
	}
	
	// 장바구니 삭제
	@Override
	public int deleteCart(CartDTO ct) {
		// TODO Auto-generated method stub
		return sqlSession.delete(nameSpace + ".deleteCart", ct);
	}


}
