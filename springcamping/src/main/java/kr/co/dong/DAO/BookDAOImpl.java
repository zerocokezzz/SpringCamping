package kr.co.dong.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dong.DTO.CampInfoDTO;
import kr.co.dong.DTO.PayDTO;
import kr.co.dong.DTO.RentalDTO;
import kr.co.dong.DTO.RentalInfoDTO;
import kr.co.dong.DTO.ResDTO;

@Repository
public class BookDAOImpl implements BookDAO{
	
	@Autowired
	SqlSession sqlsession;
	private static final String nameSpace="kr.co.dong.bookMapper";

	@Override
	public List<CampInfoDTO> selectCampInfo() {
		return sqlsession.selectList(nameSpace + ".selectCampInfo");
	}

	@Override
	public List<ResDTO> selectRes() {
		return sqlsession.selectList(nameSpace + ".selectRes");
	}

	@Override
	public List<RentalInfoDTO> selectRentalInfo() {
		return sqlsession.selectList(nameSpace + ".selectRentalInfo");
	}

	@Override
	public int insertRes(ResDTO res) {
		return sqlsession.insert(nameSpace + ".insertRes", res);
	}

	@Override
	public int insertRental(RentalDTO rental) {
		return sqlsession.insert(nameSpace + ".insertRental", rental);
	}

	@Override
	public int insertPay(PayDTO pay) {
		return sqlsession.insert(nameSpace + ".insertPay", pay);
	}

	@Override
	public int selectCampPrice(String camp_no) {
		return sqlsession.selectOne(nameSpace + ".selectCampPrice", camp_no);
	}

	@Override
	public int selectRentalPrice(String rental_no) {
		return sqlsession.selectOne(nameSpace + ".selectRentalPrice", rental_no);
	}

}
