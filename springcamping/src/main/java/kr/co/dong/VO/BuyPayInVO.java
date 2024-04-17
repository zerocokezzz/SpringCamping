package kr.co.dong.VO;

public class BuyPayInVO {
	
	private int buy_no;
	private String user_id;
	private String buy_date;
	private int buy_amount;
	private int shop_no;
	private int payin_no;
	private int pay_no;
	public BuyPayInVO() {
		super();
	}
	public BuyPayInVO(int buy_no, String user_id, String buy_date, int buy_amount, int shop_no, int payin_no,
			int pay_no) {
		super();
		this.buy_no = buy_no;
		this.user_id = user_id;
		this.buy_date = buy_date;
		this.buy_amount = buy_amount;
		this.shop_no = shop_no;
		this.payin_no = payin_no;
		this.pay_no = pay_no;
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
	public int getPayin_no() {
		return payin_no;
	}
	public void setPayin_no(int payin_no) {
		this.payin_no = payin_no;
	}
	public int getPay_no() {
		return pay_no;
	}
	public void setPay_no(int pay_no) {
		this.pay_no = pay_no;
	}
	@Override
	public String toString() {
		return "BuyPayInVO [buy_no=" + buy_no + ", user_id=" + user_id + ", buy_date=" + buy_date + ", buy_amount="
				+ buy_amount + ", shop_no=" + shop_no + ", payin_no=" + payin_no + ", pay_no=" + pay_no + "]";
	}
	
	
}
