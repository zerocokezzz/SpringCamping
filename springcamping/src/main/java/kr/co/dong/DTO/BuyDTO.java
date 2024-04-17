package kr.co.dong.DTO;

public class BuyDTO {
	
	private int buy_no;
	private String user_id;
	private String buy_date;
	private int buy_amount;
	private int shop_no;
	private String buy_paystate;
	public BuyDTO() {
		super();
	}
	public BuyDTO(int buy_no, String user_id, String buy_date, int buy_amount, int shop_no, String buy_paystate) {
		super();
		this.buy_no = buy_no;
		this.user_id = user_id;
		this.buy_date = buy_date;
		this.buy_amount = buy_amount;
		this.shop_no = shop_no;
		this.buy_paystate = buy_paystate;
	}
	public int getBuy_no() {
		return buy_no;
	}
	public void setBuy_no(int buy_no) {
		this.buy_no = buy_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
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
	public int getShop_no() {
		return shop_no;
	}
	public void setShop_no(int shop_no) {
		this.shop_no = shop_no;
	}
	public String getBuy_paystate() {
		return buy_paystate;
	}
	public void setBuy_paystate(String buy_paystate) {
		this.buy_paystate = buy_paystate;
	}
	@Override
	public String toString() {
		return "BuyDTO [buy_no=" + buy_no + ", user_id=" + user_id + ", buy_date=" + buy_date + ", buy_amount="
				+ buy_amount + ", shop_no=" + shop_no + ", buy_paystate=" + buy_paystate + "]";
	}
	
}
