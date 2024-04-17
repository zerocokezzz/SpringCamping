package kr.co.dong.service;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.dong.DAO.FacilityDAOImpl;
import kr.co.dong.DTO.CampInfoDTO;
import kr.co.dong.DTO.ImgDTO;
import kr.co.dong.DTO.RentalInfoDTO;

@Service
public class FacilityServiceImpl implements FacilityService{
	
	// 본인의 워크스페이스 경로로
	private static final String workspacePath = "C:\\JAVAback\\springcamp_0307";
	
	@Autowired
	FacilityDAOImpl facilitydao;
	
	// 캠핑 정보 전체목록
	@Override
	public List<CampInfoDTO> campAll() {
		return facilitydao.campAll();
	}
	
	// 캠핑 정보 상세보기
	@Override
	public CampInfoDTO campDetail(String camp_no) {
		return facilitydao.campDetail(camp_no);
	}
	
	// 캠핑 이미지 상세보기
	@Override
	public List<ImgDTO> detailImage(String camp_no) {
		return facilitydao.detailImage(camp_no);
	}
	
	// 캠핑 정보 추가
	@Override
	public int campInsert(CampInfoDTO campInfoDTO, ImgDTO imgDTO, MultipartFile[] imgFile) {
	    // 캠핑 타입과 캠핑 인덱스를 결합하여 캠핑 번호 생성
	    campInfoDTO.setCamp_no(campInfoDTO.getCamp_type() + campInfoDTO.getCamp_index());
	    
	    // 기존에 캠핑 타입이 존재하는지 확인
	    CampInfoDTO campCheck = facilitydao.campDetail(campInfoDTO.getCamp_no());
	    if (campCheck != null) {
	        // 이미 존재하는 캠핑 타입이므로 추가 작업을 수행하지 않고 바로 종료
	        return 0;
	    }
	    
	    // 존재하지 않는 캠핑 타입이므로 캠핑 정보 추가 진행
	    for(MultipartFile multipartFile : imgFile) {
	        try {
	            String savedFileName = saveImage(multipartFile, campInfoDTO.getCamp_no());
	            
	            // 부모글PK 가져오기
	            String savedParents = campInfoDTO.getCamp_no();
	            
	            // 저장된 파일 이름과 부모글PK를 DTO에 설정
	            imgDTO.setImg_name(savedFileName);
	            imgDTO.setImg_parents(savedParents);
	            
	            // 캠핑 이미지 추가
	            int r = facilitydao.campInsertImage(imgDTO);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	    
	    // 캠핑 정보 추가
	    return facilitydao.campInsert(campInfoDTO);
	}
	
	// 이미지 저장 메소드
	private String saveImage(MultipartFile imgFile, String parents_no) throws Exception {
		
		String savedFileName = null;
		
		if(imgFile.getOriginalFilename().length() == 0) {
			return savedFileName;
		}
		
		String uploadPath = null;
		
		boolean result = isAlphaNumeric(parents_no);
		
		if(result == false) {
			uploadPath = workspacePath + "\\springcamping\\src\\main\\webapp\\resources\\img\\facilityImg\\campImg";
		}else {
			uploadPath = workspacePath + "\\springcamping\\src\\main\\webapp\\resources\\img\\facilityImg\\rentalImg";
		}
		
	    // 파일 이름 중복을 방지 (UUID 사용)
	    savedFileName = UUID.randomUUID().toString() + "_" + imgFile.getOriginalFilename();
	    
	    // 파일을 저장할 경로와 이름으로 파일 생성
	    File targetFile = new File(uploadPath, savedFileName);
	    
	    // 지정된 경로에 이미지 저장
	    imgFile.transferTo(targetFile);
	    
	    return savedFileName;
	}

	// 캠핑 정보 수정
	@Override
	public int campUpdate(CampInfoDTO campInfoDTO, ImgDTO imgDTO, MultipartFile[] imgFile) {
		
			campInfoDTO.setCamp_no(campInfoDTO.getCamp_type() + campInfoDTO.getCamp_index());
			
			for(MultipartFile multipartFile : imgFile) {
				
				// 이미지 파일을 업로드 및 저장된 파일 이름을 가져오기
				try {
					String savedFileName = saveImage(multipartFile, campInfoDTO.getCamp_no());
					
					// 부모글PK 가져오기
			        String savedParents = campInfoDTO.getCamp_no();
			        
			        // 저장된 파일 이름과 부모글PK를 DTO에 설정
			        imgDTO.setImg_name(savedFileName);
			        imgDTO.setImg_parents(savedParents);
			        
			        if(savedFileName == null) {
			        	return facilitydao.campUpdate(campInfoDTO);
			        }
			        
			        // 캠핑 이미지 추가
					int r = facilitydao.campInsertImage(imgDTO);
					
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			
		return facilitydao.campUpdate(campInfoDTO);
	}
	
	// 캠핑 정보 삭제
	@Override
	public int campDelete(String img_parents) {
		
		List<ImgDTO> imgDTO = facilitydao.detailImage(img_parents);
		
		
		for(ImgDTO list : imgDTO) {
			int r = facilitydao.campDeleteImage(img_parents);
			
			String path = workspacePath + "\\springcamping\\src\\main\\webapp\\resources\\img\\facilityImg\\campImg";
			
			File file = new File(path + "\\" + list.getImg_name());
			
			if(file.exists()) {
				file.delete();
			}
		}
		
		return facilitydao.campDelete(img_parents);
	}
	
	private boolean isAlphaNumeric(String str) {
		// 정규식을 사용하여 문자열이 영문자와 숫자로만 이루어져 있는지 확인
        return str.matches("F[1-5]");
	}

	// 렌탈 정보 전체목록
	@Override
	public List<RentalInfoDTO> rentalAll() {
		return facilitydao.rentalAll();
	}
	
	// 렌탈 정보 상세보기
	@Override
	public RentalInfoDTO rentalDetail(String rental_no) {
		System.out.println("서비스**********" + rental_no);
		return facilitydao.rentalDetail(rental_no);
	}
	
	// 렌탈 정보 추가
	@Override
	public int rentalInsert(RentalInfoDTO rentalInfoDTO, ImgDTO imgDTO, MultipartFile[] imgFile) {
		
		rentalInfoDTO.setRental_no(rentalInfoDTO.getRental_type() + rentalInfoDTO.getRental_index());
		
		// 기존에 캠핑 타입이 존재하는지 확인
		RentalInfoDTO rentalCheck = facilitydao.rentalDetail(rentalInfoDTO.getRental_no());
		
	    if (rentalCheck != null) {
	        return 0;
	    }
		
		for(MultipartFile multipartFile : imgFile) {
			
			// 이미지 파일을 업로드 및 저장된 파일 이름을 가져오기
			try {
				String savedFileName = saveImage(multipartFile, rentalInfoDTO.getRental_no());
				
				// 부모글PK 가져오기
		        String savedParents = rentalInfoDTO.getRental_no();
		        
		        // 저장된 파일 이름과 부모글PK를 DTO에 설정
		        imgDTO.setImg_name(savedFileName);
		        imgDTO.setImg_parents(savedParents);
		        
		        // 렌탈 이미지 추가
				int r = facilitydao.campInsertImage(imgDTO);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return facilitydao.rentalInsert(rentalInfoDTO);
	}
	
	// 렌탈 정보 수정
	@Override
	public int rentalUpdate(RentalInfoDTO rentalInfoDTO, ImgDTO imgDTO, MultipartFile[] imgFile) {
		
		rentalInfoDTO.setRental_no(rentalInfoDTO.getRental_type() + rentalInfoDTO.getRental_index());
		
		for(MultipartFile multipartFile : imgFile) {
			
			// 이미지 파일을 업로드 및 저장된 파일 이름을 가져오기
			try {
				String savedFileName = saveImage(multipartFile, rentalInfoDTO.getRental_no());
				
				// 부모글PK 가져오기
		        String savedParents = rentalInfoDTO.getRental_no();
		        
		        // 저장된 파일 이름과 부모글PK를 DTO에 설정
		        imgDTO.setImg_name(savedFileName);
		        imgDTO.setImg_parents(savedParents);
		        
		        if(savedFileName == null) {
		        	return facilitydao.rentalUpdate(rentalInfoDTO);
		        }
		        
		        // 렌탈 이미지 추가
				int r = facilitydao.campInsertImage(imgDTO);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return facilitydao.rentalUpdate(rentalInfoDTO);
	}
	
	// 렌탈 정보 삭제
	@Override
	public int rentalDelete(String img_parents) {
		
		List<ImgDTO> imgDTO = facilitydao.detailImage(img_parents);
		
		
		for(ImgDTO list : imgDTO) {
			int r = facilitydao.campDeleteImage(img_parents);
			
			String path = workspacePath + "\\springcamping_0307\\src\\main\\webapp\\resources\\img\\facilityImg\\rentalImg";
			
			File file = new File(path + "\\" + list.getImg_name());
			
			if(file.exists()) {
				file.delete();
			}
		}
		
		return facilitydao.rentalDelete(img_parents);
	}
	
}
