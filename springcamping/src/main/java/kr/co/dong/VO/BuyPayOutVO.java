package kr.co.dong.VO;

public class BuyPayOutVO {
	
	private int buy_no;
	private String user_id;
	private String buy_date;
	private int buy_amount;
	private int shop_no;
	private int payout_no; 
	private String payout_name; 
	private String payout_price; 
	private String payout_ment; 
	private String payout_date; 
	private int payin_no;
	public BuyPayOutVO() {
		super();
	}
	public BuyPayOutVO(int buy_no, String user_id, String buy_date, int buy_amount, int shop_no, int payout_no,
			String payout_name, String payout_price, String payout_ment, String payout_date, int payin_no) {
		super();
		this.buy_no = buy_no;
		this.user_id = user_id;
		this.buy_date = buy_date;
		this.buy_amount = buy_amount;
		this.shop_no = shop_no;
		this.payout_no = payout_no;
		this.payout_name = payout_name;
		this.payout_price = payout_price;
		this.payout_ment = payout_ment;
		this.payout_date = payout_date;
		this.payin_no = payin_no;
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
	public int getPayout_no() {
		return payout_no;
	}
	public void setPayout_no(int payout_no) {
		this.payout_no = payout_no;
	}
	public String getPayout_name() {
		return payout_name;
	}
	public void setPayout_name(String payout_name) {
		this.payout_name = payout_name;
	}
	public String getPayout_price() {
		return payout_price;
	}
	public void setPayout_price(String payout_price) {
		this.payout_price = payout_price;
	}
	public String getPayout_ment() {
		return payout_ment;
	}
	public void setPayout_ment(String payout_ment) {
		this.payout_ment = payout_ment;
	}
	public String getPayout_date() {
		return payout_date;
	}
	public void setPayout_date(String payout_date) {
		this.payout_date = payout_date;
	}
	public int getPayin_no() {
		return payin_no;
	}
	public void setPayin_no(int payin_no) {
		this.payin_no = payin_no;
	}
	@Override
	public String toString() {
		return "BuyPayOutVO [buy_no=" + buy_no + ", user_id=" + user_id + ", buy_date=" + buy_date + ", buy_amount="
				+ buy_amount + ", shop_no=" + shop_no + ", payout_no=" + payout_no + ", payout_name=" + payout_name
				+ ", payout_price=" + payout_price + ", payout_ment=" + payout_ment + ", payout_date=" + payout_date
				+ ", payin_no=" + payin_no + "]";
	}
	
	
}