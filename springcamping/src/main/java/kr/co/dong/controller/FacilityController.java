package kr.co.dong.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.dong.DTO.CampInfoDTO;
import kr.co.dong.DTO.ImgDTO;
import kr.co.dong.DTO.RentalInfoDTO;
import kr.co.dong.service.FacilityServiceImpl;

@Controller
public class FacilityController {
	
	@Autowired
	FacilityServiceImpl facilityservice;
	
	private static final Logger logger = LoggerFactory.getLogger(FacilityController.class);
	
	// 캠핑 정보 안내
	@GetMapping(value="/camp/campInfo")
	public String campInfo(Model model) {
		logger.info("캠핑정보 안내");
		List<CampInfoDTO> campInfoDTO = facilityservice.campAll();
		model.addAttribute("campAll", campInfoDTO);
		List<RentalInfoDTO> rentalInfoDTO = facilityservice.rentalAll();
		model.addAttribute("rentalAll", rentalInfoDTO);
		return "/camp/campInfo";
	}
	
	// 캠핑 정보 안내2
	@GetMapping(value="/camp/campInfo2")
	public String campInfo2() {
		logger.info("캠핑정보 안내");
		return "/camp/campInfo2";
	}
	
	// 캠핑 정보 전체목록
	@GetMapping(value="/camp/campAll")
	public String campAll(Model model) {
		List<CampInfoDTO> campInfoDTO = facilityservice.campAll();
		model.addAttribute("campAll", campInfoDTO);
	    logger.info("캠핑정보 전체목록보기");
	    return "/camp/campAll";
	}
	
	// 캠핑 정보 상세보기
	@GetMapping(value="/camp/campDetail")
	public String campDetail(@RequestParam("camp_no")String camp_no, Model model) {
		CampInfoDTO campInfoDTO = facilityservice.campDetail(camp_no);
		List<ImgDTO> imgDTO = facilityservice.detailImage(camp_no);
		model.addAttribute("campInfo", campInfoDTO);
		model.addAttribute("imgDTO", imgDTO);
		logger.info("캠핑정보 선택목록보기" + campInfoDTO);
		logger.info("캠핑정보이미지 선택목록보기" + imgDTO);
		return "/camp/campDetail";
	}
	
	// 캠핑 정보 추가
	@GetMapping(value="/camp/campInsert")
	public String campInsert() {
		return "/camp/campInsert";
	}
	
	// 캠핑 정보 추가(이미지 ok)
	@PostMapping(value="/camp/campInsert")
	public String campInsert(CampInfoDTO campInfoDTO, ImgDTO imgDTO, @RequestParam("imgFile") MultipartFile[] imgFile) {
	    int r = facilityservice.campInsert(campInfoDTO, imgDTO, imgFile);
	    if (r != 0) {
	        logger.info("캠핑정보 추가완료");
	        return "redirect:/camp/campAll";
	    }
        String errorMessage = "An error occurred while adding camping information.";
        System.out.println("##############################" + errorMessage);
	    return "redirect:/camp/campInsert?error=" + errorMessage;
	}
	
	// 캠핑 정보 수정폼
	@GetMapping(value="/camp/campUpdate")
	public String campUpdate(@RequestParam("camp_no")String camp_no, Model model) {
		CampInfoDTO campInfoDTO = facilityservice.campDetail(camp_no);
		List<ImgDTO> imgDTO = facilityservice.detailImage(camp_no);
		logger.info("캠핑정보 수정폼");
		model.addAttribute("campInfo", campInfoDTO);
		model.addAttribute("imgDTO", imgDTO);
		return "/camp/campUpdate";
	}
	
	// 캠핑 정보 수정
	@PostMapping(value="/camp/campUpdate")
	public String campUpdate(CampInfoDTO campInfoDTO, ImgDTO imgDTO, @RequestParam("imgFile") MultipartFile[] imgFile) {
		int r = facilityservice.campUpdate(campInfoDTO, imgDTO, imgFile);
		logger.info("캠핑정보 수정완료");
		return "redirect:/camp/campAll";
	}
	
	// 캠핑 정보 삭제
	@GetMapping(value="/camp/campDelete")
	public String campDelete(String img_parents) {
		int r = facilityservice.campDelete(img_parents);
		logger.info("캠핑정보 삭제완료");
		return "redirect:/camp/campAll";
	}
	
	// 캠핑 정보 이미지 삭제
	@ResponseBody
	@PostMapping(value="/camp/campDeleteImage")
	public int campDeletImage(String img_name) {
		return facilityservice.campDelete(img_name);
	}
	
	// 렌탈 정보 전체목록
	@GetMapping(value="/rental/rentalAll")
	public String rentalAll(Model model) {
		List<RentalInfoDTO> rentalInfoDTO = facilityservice.rentalAll();
		model.addAttribute("rentalAll", rentalInfoDTO);
		logger.info("렌탈정보 전체목록보기");
		return "/rental/rentalAll";
	}
	
	// 렌탈 정보 상세보기
	@GetMapping(value="/rental/rentalDetail")
	public String rentalDetail(@RequestParam("rental_no")String rental_no, Model model) {
		logger.info(rental_no);
		RentalInfoDTO rentalInfoDTO = facilityservice.rentalDetail(rental_no);
		List<ImgDTO> imgDTO = facilityservice.detailImage(rental_no);
		model.addAttribute("rentalInfo", rentalInfoDTO);
		model.addAttribute("imgDTO", imgDTO);
		logger.info("렌탈정보 선택목록보기" + rentalInfoDTO);
		logger.info("렌탈정보이미지 선택목록보기" + imgDTO);
		return "/rental/rentalDetail";
	}
	
	// 렌탈 정보 추가
	@GetMapping(value="/rental/rentalInsert")
	public String rentalInsert() {
		logger.info("렌탈 정보 추가 폼으로 이동");
		return "/rental/rentalInsert";
	}
	
	// 렌탈 정보 추가(이미지 확인 필요)
	@PostMapping(value="/rental/rentalInsert")
	public String rentalInsert(RentalInfoDTO rentalInfoDTO, ImgDTO imgDTO, @RequestParam("imgFile") MultipartFile[] imgFile) {
		
		int r = facilityservice.rentalInsert(rentalInfoDTO, imgDTO, imgFile);
		
		if(r != 0) {
			logger.info("캠핑정보 추가완료");
			return "redirect:/rental/rentalAll";
		}
		String errorMessage = "An error occurred while adding camping information.";
		return "redirect:/rental/rentalInsert?error=" + errorMessage;
	}
	
	// 렌탈 정보 수정폼
	@GetMapping(value="/rental/rentalUpdate")
	public String rentalUpdate(@RequestParam("rental_no")String rental_no, Model model) {
		RentalInfoDTO rentalInfoDTO = facilityservice.rentalDetail(rental_no);
		List<ImgDTO> imgDTO = facilityservice.detailImage(rental_no);
		logger.info("렌탈물품정보 수정폼");
		model.addAttribute("rentalInfo", rentalInfoDTO);
		model.addAttribute("imgDTO", imgDTO);
		return "/rental/rentalUpdate";
	}
	
	// 렌탈 정보 수정
	@PostMapping(value="/rental/rentalUpdate")
	public String rentalUpdate(RentalInfoDTO rentalInfoDTO, ImgDTO imgDTO, @RequestParam("imgFile") MultipartFile[] imgFile) {
		int r = facilityservice.rentalUpdate(rentalInfoDTO, imgDTO, imgFile);
		logger.info("렌탈물품정보 수정완료");
		return "redirect:/rental/rentalAll";
	}
	
	// 렌탈 정보 이미지 삭제
	@ResponseBody
	@PostMapping(value="/rental/rentalDeleteImage")
	public int rentalDeletImage(String img_name) {
		return facilityservice.rentalDelete(img_name);
	}

	// 렌탈 정보 삭제
	@GetMapping(value="/rental/rentalDelete")
	public String rentalDelete(String img_parents) {
		int r = facilityservice.rentalDelete(img_parents);
		logger.info("렌탈정보 삭제완료");
		return "redirect:/rental/rentalAll";
	}
	
	// 매점 보기
	@GetMapping(value="/amenities/store")
	public String store() {
		return "/amenities/store";
	}
	
	// 화장실개수대 보기
	@GetMapping(value="/amenities/toiletShowerKitchen")
	public String toiletShowerKitchen() {
		return "/amenities/toiletShowerKitchen";
	}
	
}
