package kr.co.dong.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dong.DTO.BuyDTO;
import kr.co.dong.DTO.CartDTO;
import kr.co.dong.DTO.ShopInfoDTO;

@Repository
public class ShopInfoDAOImpl implements ShopInfoDAO {

   @Autowired
   SqlSession sqlsession;
   
   private static final String nameSpace = "kr.co.dong.ShopInfoMapper";

	@Override
	public List<ShopInfoDTO> selectAllShopInfo() {
		return sqlsession.selectList(nameSpace + ".selectAllShopInfo");
	}
	
	@Override
	public ShopInfoDTO selectShopInfo(String shopNo) {
		return sqlsession.selectOne(nameSpace + ".selectShopInfo", shopNo);
	}
	
	@Override
	public int insertShopInfo(ShopInfoDTO shopInfo) {
		return sqlsession.insert(nameSpace + ".insertShopInfo", shopInfo);
	}
	
	@Override
	public int updateShopInfo(ShopInfoDTO shop) {
		return sqlsession.update(nameSpace + ".updateShopInfo", shop);
	}
	
	@Override
	public int deleteShopInfo(String shop_no) {
		return sqlsession.delete(nameSpace + ".deleteShopInfo", shop_no);
}

	@Override
	public int insertBuy(BuyDTO buy) {
		return sqlsession.insert(nameSpace + ".insertBuy", buy);
	}

	@Override
	public int insertCart(CartDTO cart) {
		return sqlsession.insert(nameSpace + ".insertCart", cart);
	}
   
	@Override
	public CartDTO searchCart(CartDTO cart) {
		return sqlsession.selectOne(nameSpace + ".searchCart", cart);
	}
   
   
	@Override
	public int updateCartAmount(CartDTO cart) {
		return sqlsession.insert(nameSpace + ".updateCartAmount", cart);
	}
   
   
}