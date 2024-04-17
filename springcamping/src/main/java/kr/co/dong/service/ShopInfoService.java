package kr.co.dong.service;

import kr.co.dong.DTO.BuyDTO;
import kr.co.dong.DTO.CartDTO;
import kr.co.dong.DTO.ImgDTO;
import kr.co.dong.DTO.ShopInfoDTO;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public interface ShopInfoService {
	
    List<ShopInfoDTO> getAllShopInfos();
    ShopInfoDTO getShopInfoById(String shopNo);
    int addShopInfo(ShopInfoDTO shopInfo, ImgDTO imgDTO, MultipartFile[] imgFile);
    int updateShopInfo(ShopInfoDTO shop, ImgDTO imgDTO, MultipartFile[] imgFile);
    int updateShopInfo(ShopInfoDTO shop);
    int deleteShopInfo(String shop_no);
    int insertBuy(BuyDTO buy);
    int insertCart(CartDTO cart);
    CartDTO searchCart(CartDTO cart);
    int updateCartAmount(CartDTO cart);
}
