package kr.co.dong.VO;

import kr.co.dong.DTO.BuyDTO;
import kr.co.dong.DTO.ShopInfoDTO;
import kr.co.dong.DTO.UserDTO;

public class CartVO {
	private int cart_no;
	private UserDTO user;
	private String cart_date;
	private int cart_amount;
	private ShopInfoDTO shop;
	private BuyDTO buy;
	
	public CartVO() {}
	
	public CartVO(int cart_no, UserDTO user, String cart_date, int cart_amount, ShopInfoDTO shop, BuyDTO buy) {
		super();
		this.cart_no = cart_no;
		this.user = user;
		this.cart_date = cart_date;
		this.cart_amount = cart_amount;
		this.shop = shop;
		this.buy = buy;
	}

	public int getCart_no() {
		return cart_no;
	}

	public void setCart_no(int cart_no) {
		this.cart_no = cart_no;
	}

	public UserDTO getUser() {
		return user;
	}

	public void setUser(UserDTO user) {
		this.user = user;
	}

	public String getCart_date() {
		return cart_date;
	}

	public void setCart_date(String cart_date) {
		this.cart_date = cart_date;
	}

	public int getCart_amount() {
		return cart_amount;
	}

	public void setCart_amount(int cart_amount) {
		this.cart_amount = cart_amount;
	}

	public ShopInfoDTO getShop() {
		return shop;
	}

	public void setShop(ShopInfoDTO shop) {
		this.shop = shop;
	}

	public BuyDTO getBuy() {
		return buy;
	}

	public void setBuy(BuyDTO buy) {
		this.buy = buy;
	}

	@Override
	public String toString() {
		return "CartVO [cart_no=" + cart_no + ", user=" + user + ", cart_date=" + cart_date + ", cart_amount="
				+ cart_amount + ", shop=" + shop + ", buy=" + buy + "]";
	}

	
}
