package kr.co.dong.DAO;

import java.util.List;

import kr.co.dong.DTO.CampInfoDTO;
import kr.co.dong.DTO.ImgDTO;
import kr.co.dong.DTO.RentalInfoDTO;

public interface FacilityDAO {
	
	// 캠핑 정보 전체목록
	public List<CampInfoDTO> campAll();
	
	// 캠핑 정보 상세보기
	public CampInfoDTO campDetail(String camp_no);
	
	// 캠핑 정보 추가
	public int campInsert(CampInfoDTO campInfoDTO);

	// 캠핑 정보 수정
	public int campUpdate(CampInfoDTO campInfoDTO);
	
	// 캠핑 정보 삭제
	public int campDelete(String img_parents);
	
	// 캠핑 이미지 추가
	public int campInsertImage(ImgDTO imgDTO);
	
	// 캠핑 이미지 수정
	public int campUpdateImage(ImgDTO imgDTO);
	
	// 캠핑 이미지 삭제
	public int campDeleteImage(String img_parents);
	
	// 캠핑 이미지 상세보기
	public List<ImgDTO> detailImage(String img_parents);
	
	// 렌탈 정보 전체목록
	public List<RentalInfoDTO> rentalAll();
	
	// 렌탈 정보 상세보기
	public RentalInfoDTO rentalDetail(String rental_no);
	
	// 렌탈 정보 추가
	public int rentalInsert(RentalInfoDTO rentalInfoDTO);
	
	// 렌탈 정보 수정
	public int rentalUpdate(RentalInfoDTO rentalInfoDTO);
	
	// 렌탈 정보 삭제
	public int rentalDelete(String img_parents);
}
