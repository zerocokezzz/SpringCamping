package kr.co.dong.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.co.dong.DTO.CampInfoDTO;
import kr.co.dong.DTO.ImgDTO;
import kr.co.dong.DTO.RentalInfoDTO;

public interface FacilityService {
	
	//캠핑 정보 전체목록
	public List<CampInfoDTO> campAll();
	
	// 캠핑 정보 상세보기
	public CampInfoDTO campDetail(String camp_no);
	public List<ImgDTO> detailImage(String camp_no);
	
	// 캠핑 정보 추가
	public int campInsert(CampInfoDTO campInfoDTO, ImgDTO imgDTO, MultipartFile[] imgFile);

	// 캠핑 정보 수정
	public int campUpdate(CampInfoDTO campInfoDTO, ImgDTO imgDTO, MultipartFile[] imgFile);
	
	// 캠핑 정보 삭제
	public int campDelete(String img_parents);
	
	// 렌탈 정보 전체목록
	public List<RentalInfoDTO> rentalAll();
	
	// 렌탈 정보 상세보기
	public RentalInfoDTO rentalDetail(String rental_no);
	
	// 렌탈 정보 추가
	public int rentalInsert(RentalInfoDTO rentalInfoDTO, ImgDTO imgDTO, MultipartFile[] imgFile);
	
	// 렌탈 정보 수정
	public int rentalUpdate(RentalInfoDTO rentalInfoDTO, ImgDTO imgDTO, MultipartFile[] imgFile);
	
	// 렌탈 정보 삭제
	public int rentalDelete(String rental_no);
}
