package kr.co.dong.service;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.dong.DAO.FacilityDAOImpl;
import kr.co.dong.DAO.ShopInfoDAO;
import kr.co.dong.DTO.BuyDTO;
import kr.co.dong.DTO.CartDTO;
import kr.co.dong.DTO.ImgDTO;
import kr.co.dong.DTO.ShopInfoDTO;

@Service
public class ShopInfoServiceImpl implements ShopInfoService {
	
	// 본인의 워크스페이스 경로로
	private static final String workspacePath = "C:\\JAVAback\\springcamp_0307";

	@Autowired
	ShopInfoDAO shopinfoDAO;
	
	@Autowired
	FacilityDAOImpl facilitydao;
	
    @Override
    public List<ShopInfoDTO> getAllShopInfos() {
        return shopinfoDAO.selectAllShopInfo();
    }

    @Override
    public ShopInfoDTO getShopInfoById(String shopNo) {
        return shopinfoDAO.selectShopInfo(shopNo);
    }
    
    // 상품 추가
    @Override
    public int addShopInfo(ShopInfoDTO shopInfo, ImgDTO imgDTO, MultipartFile[] imgFile) {
    	// 새로운 상품 번호 생성
    	String shopNo = generateShopNo();
    	
    	// P1부터 P100까지 모두 사용 중인 경우
    	if (shopNo == null) {
            return 0;
    	}
    	
    	shopInfo.setShop_no(shopNo); // 생성된 번호를 상품에 설정
	    
	    for(MultipartFile multipartFile : imgFile) {
	        try {
	            String savedFileName = saveImage(multipartFile, shopInfo.getShop_no());
	            
	            // 부모글PK 가져오기
	            String savedParents = shopInfo.getShop_no();
	            
	            // 저장된 파일 이름과 부모글PK를 DTO에 설정
	            imgDTO.setImg_name(savedFileName);
	            imgDTO.setImg_parents(savedParents);
	            
	            // 이미지 추가
	            int r = facilitydao.campInsertImage(imgDTO);
	            
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
        return shopinfoDAO.insertShopInfo(shopInfo);
    }
    
    // 새로운 상품 번호 생성하는 메소드
    private String generateShopNo() {
        char prefix = 'P';
        int count = 1;
        
        while (count <= 3) {
            String shopNo = prefix + Integer.toString(count);
            
            ShopInfoDTO shopCheck = shopinfoDAO.selectShopInfo(shopNo);
            
            if (shopCheck == null) {
                return shopNo;
            }
            
            count++;
        }
        
        return null;
    }

	// 이미지 저장 메소드
	private String saveImage(MultipartFile imgFile, String shop_no) throws Exception {
		
		String savedFileName = null;
		
		if(imgFile.getOriginalFilename().length() == 0) {
			return savedFileName;
		}
		
		String uploadPath = workspacePath + "\\springcamping\\src\\main\\webapp\\resources\\img\\shopInfo";
		
	    // 파일 이름 중복을 방지 (UUID 사용)
	    savedFileName = UUID.randomUUID().toString() + "_" + imgFile.getOriginalFilename();
	    
	    // 파일을 저장할 경로와 이름으로 파일 생성
	    File targetFile = new File(uploadPath, savedFileName);
	    
	    // 지정된 경로에 이미지 저장
	    imgFile.transferTo(targetFile);
	    
	    return savedFileName;
	}
	
	
	
	// 상품 수정
    @Override
    public int updateShopInfo(ShopInfoDTO shop, ImgDTO imgDTO, MultipartFile[] imgFile) {
	    for(MultipartFile multipartFile : imgFile) {
	        try {
	            String savedFileName = saveImage(multipartFile, shop.getShop_no());
	            
	            // 부모글PK 가져오기
	            String savedParents = shop.getShop_no();
	            
	            // 저장된 파일 이름과 부모글PK를 DTO에 설정
	            imgDTO.setImg_name(savedFileName);
	            imgDTO.setImg_parents(savedParents);
	            
	            // 이미지 추가
	            int r = facilitydao.campInsertImage(imgDTO);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
        return shopinfoDAO.updateShopInfo(shop);
    }
    
    // 상품 이미지 url 수정
    public int updateShopInfo(ShopInfoDTO shop) {
    	return shopinfoDAO.updateShopInfo(shop);
    }
    
    // 상품 삭제
    @Override
    public int deleteShopInfo(String shopNo) {
		List<ImgDTO> imgDTO = facilitydao.detailImage(shopNo);
		
		for(ImgDTO list : imgDTO) {
			int r = facilitydao.campDeleteImage(shopNo);
			
			String path = workspacePath + "\\springcamping\\src\\main\\webapp\\resources\\img\\shopInfo";
			
			File file = new File(path + "\\" + list.getImg_name());
			
			if(file.exists()) {
				file.delete();
			}
		}
        return shopinfoDAO.deleteShopInfo(shopNo);
    }

	@Override
	public int insertBuy(BuyDTO buy) {
		return shopinfoDAO.insertBuy(buy);
	}

	@Override
	public int insertCart(CartDTO cart) {
		return shopinfoDAO.insertCart(cart);
	}
	
	@Override
    public CartDTO searchCart(CartDTO cart) {
        return shopinfoDAO.searchCart(cart);
    }
	
	@Override
	public int updateCartAmount(CartDTO cart) {
		return shopinfoDAO.updateCartAmount(cart);
	}
}
