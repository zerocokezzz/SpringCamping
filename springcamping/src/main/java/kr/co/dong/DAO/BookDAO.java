package kr.co.dong.DAO;

import java.util.List;

import kr.co.dong.DTO.CampInfoDTO;
import kr.co.dong.DTO.PayDTO;
import kr.co.dong.DTO.RentalDTO;
import kr.co.dong.DTO.RentalInfoDTO;
import kr.co.dong.DTO.ResDTO;

public interface BookDAO {
	
	public List<CampInfoDTO> selectCampInfo();
	
	public List<ResDTO> selectRes();
	
	public List<RentalInfoDTO> selectRentalInfo();
	
	public int insertRes(ResDTO res);
	
	public int insertRental(RentalDTO rental);
	
	public int insertPay(PayDTO pay);
	
	public int selectCampPrice(String camp_no);
	
	public int selectRentalPrice(String rental_no);

}
