package kr.co.dong.DAO;


import java.util.List;

import kr.co.dong.DTO.BuyDTO;
import kr.co.dong.DTO.CartDTO;
import kr.co.dong.DTO.ShopInfoDTO;

public interface ShopInfoDAO {
    // 상품 정보를 가져오는 메소드
    List<ShopInfoDTO> selectAllShopInfo();
    ShopInfoDTO selectShopInfo(String shopNo);
    
    // 상품을 추가하는 메소드
    int insertShopInfo(ShopInfoDTO shopInfo);
    
    // 상품 정보를 업데이트하는 메소드
    int updateShopInfo(ShopInfoDTO shop);
    
    // 상품을 삭제하는 메소드
    int deleteShopInfo(String shopNo);
    
    int insertBuy(BuyDTO buy);
    
    int insertCart(CartDTO cart);
    
    CartDTO searchCart(CartDTO cart);
    
    int updateCartAmount(CartDTO cart);
    
}
