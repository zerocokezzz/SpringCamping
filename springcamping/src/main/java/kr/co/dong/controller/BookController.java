package kr.co.dong.controller;

import java.time.LocalDateTime;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import kr.co.dong.DTO.CampInfoDTO;
import kr.co.dong.DTO.PayDTO;
import kr.co.dong.DTO.RentalDTO;
import kr.co.dong.DTO.RentalInfoDTO;
import kr.co.dong.DTO.ResDTO;
import kr.co.dong.DTO.UserDTO;
import kr.co.dong.service.BookService;

@Controller
public class BookController {
	
	@Autowired
	BookService bookservice;
	
	@GetMapping(value = "book/reservation")
	public String reservation(Model model){
		
		List<CampInfoDTO> campinfo = bookservice.selectCampInfo();
		List<RentalInfoDTO> rentalinfo = bookservice.selectRentalInfo();
		
		model.addAttribute("campinfo", campinfo);
		model.addAttribute("rentalinfo", rentalinfo);
		
		return "book/reservation";
	}
	
	@PostMapping(value = "book/reservationPost")
	public String respaypost(ResDTO res, 
			RentalDTO rental, 
			PayDTO pay,
			HttpServletRequest request, 
			HttpSession session, 
			Model model) {
		UserDTO user =  (UserDTO) session.getAttribute("user");
		
		res.setUser_id(user.getUser_id());
		
		bookservice.insertRes(res);
		
		rental.setRes_no(res.getRes_no());
		bookservice.insertRental(rental);
		
		int price = rental.getF1_cnt() * bookservice.selectRentalPrice("F1");
			price += rental.getF2_cnt() * bookservice.selectRentalPrice("F2");
			price += rental.getF3_cnt() * bookservice.selectRentalPrice("F3");
			price += rental.getF4_cnt() * bookservice.selectRentalPrice("F4");
			price += rental.getF5_cnt() * bookservice.selectRentalPrice("F5");
			
		pay.setPay_price(price);
		pay.setUser_id(user.getUser_id());
		pay.setRentalres_no(rental.getRentalres_no());
		bookservice.insertPay(pay);
				
		return "pay/pay";
	}
	
	
}

