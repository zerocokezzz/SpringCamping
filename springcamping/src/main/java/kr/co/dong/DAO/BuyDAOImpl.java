package kr.co.dong.DAO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dong.DTO.BuyDTO;

@Repository
public class BuyDAOImpl implements BuyDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String nameSpace="kr.co.dong.BuyMapper";

	@Override
	public int insertBuy(BuyDTO buy) {
		return sqlSession.insert(nameSpace + ".insertBuy", buy);
	}
	
	
}
