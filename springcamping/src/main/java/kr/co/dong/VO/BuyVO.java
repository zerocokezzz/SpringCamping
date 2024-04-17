package kr.co.dong.VO;

import kr.co.dong.DTO.UserDTO;

public class BuyVO {
	public int buy_no;
	public UserDTO user_id;
	public String buy_date;
	public int buy_amount;;
	public String buy_paystate;
	public ShopInfoVO shop_no;
	
	public BuyVO() {
		
	}

	public BuyVO(int buy_no, UserDTO user_id, String buy_date, int buy_amount, String buy_paystate,
			ShopInfoVO shop_no) {
		super();
		this.buy_no = buy_no;
		this.user_id = user_id;
		this.buy_date = buy_date;
		this.buy_amount = buy_amount;
		this.buy_paystate = buy_paystate;
		this.shop_no = shop_no;
	}

	public int getBuy_no() {
		return buy_no;
	}

	public void setBuy_no(int buy_no) {
		this.buy_no = buy_no;
	}

	public UserDTO getUser() {
		return user_id;
	}

	public void setUser(UserDTO user) {
		this.user_id = user;
	}

	public String getBuy_date() {
		return buy_date;
	}

	public void setBuy_date(String buy_date) {
		this.buy_date = buy_date;
	}

	public int getBuy_amount() {
		return buy_amount;
	}

	public void setBuy_amount(int buy_amount) {
		this.buy_amount = buy_amount;
	}

	public String getBuy_paystate() {
		return buy_paystate;
	}

	public void setBuy_paystate(String buy_paystate) {
		this.buy_paystate = buy_paystate;
	}

	public ShopInfoVO getShop_no() {
		return shop_no;
	}

	public void setShop_no(ShopInfoVO shop_no) {
		this.shop_no = shop_no;
	}

	@Override
	public String toString() {
		return "ShopInfoVO [buy_no=" + buy_no + ", user_id=" + user_id + ", buy_date=" + buy_date + ", buy_amount="
				+ buy_amount + ", buy_paystate=" + buy_paystate + ", shop_no=" + shop_no + "]";
	}
	
	
	
}

