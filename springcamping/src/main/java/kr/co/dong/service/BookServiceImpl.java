package kr.co.dong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dong.DAO.BookDAO;
import kr.co.dong.DTO.CampInfoDTO;
import kr.co.dong.DTO.PayDTO;
import kr.co.dong.DTO.RentalDTO;
import kr.co.dong.DTO.RentalInfoDTO;
import kr.co.dong.DTO.ResDTO;

@Service
public class BookServiceImpl implements BookService{
	
	@Autowired
	BookDAO book;

	@Override
	public List<CampInfoDTO> selectCampInfo() {
		return book.selectCampInfo();
	}

	@Override
	public List<ResDTO> selectRes() {
		return book.selectRes();
	}

	@Override
	public List<RentalInfoDTO> selectRentalInfo() {
		return book.selectRentalInfo();
	}

	@Override
	public int insertRes(ResDTO res) {
		return book.insertRes(res);
	}

	@Override
	public int insertRental(RentalDTO rental) {
		return book.insertRental(rental);
	}

	@Override
	public int insertPay(PayDTO pay) {
		return book.insertPay(pay);
	}

	@Override
	public int selectCampPrice(String camp_no) {
		return book.selectCampPrice(camp_no);
	}

	@Override
	public int selectRentalPrice(String rental_no) {
		return book.selectRentalPrice(rental_no);
	}
	
	

}