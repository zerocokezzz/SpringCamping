package kr.co.dong.service;

import kr.co.dong.DAO.BuyDAO;
import kr.co.dong.DTO.BuyDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BuyServiceImpl implements BuyService {

    @Autowired
    private BuyDAO buyservice;

	@Override
	public int addBuy(BuyDTO buy) {
		return buyservice.insertBuy(buy);
	}

	
    
    

}
