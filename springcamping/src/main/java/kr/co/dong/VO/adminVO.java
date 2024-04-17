package kr.co.dong.VO;

public class adminVO {
	private int pay_no;				//결제    번호
	private String user_id;			//아이디
	private int pay_price;			//결제    총금액
	private String pay_ment;		//결제    방식
	private String pay_datetime;	//결제    일시
	private String pay_name;		//결제    상품정보
	private int cart_no;			//장바구니 번호
	private int rentalres_no;		//품목예약 번호
	private String payout_name;		//결제취소 상품정보
	private int payout_price;		//결제취소 총금액
	private String payout_ment;		//결제취소 방식
	private String payout_date;		//결제취소 일시
	private int buy_amount;			//쇼핑몰  구매 수량
	
	public adminVO() {}
	
	public adminVO(int pay_no, String user_id, int pay_price, String pay_ment, String pay_datetime, String pay_name,
			int cart_no, int rentalres_no, String payout_name, int payout_price, String payout_ment, String payout_date,
			int buy_amount) {
		super();
		this.pay_no = pay_no;
		this.user_id = user_id;
		this.pay_price = pay_price;
		this.pay_ment = pay_ment;
		this.pay_datetime = pay_datetime;
		this.pay_name = pay_name;
		this.cart_no = cart_no;
		this.rentalres_no = rentalres_no;
		this.payout_name = payout_name;
		this.payout_price = payout_price;
		this.payout_ment = payout_ment;
		this.payout_date = payout_date;
		this.buy_amount = buy_amount;
	}

	public int getPay_no() {
		return pay_no;
	}

	public void setPay_no(int pay_no) {
		this.pay_no = pay_no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getPay_price() {
		return pay_price;
	}

	public void setPay_price(int pay_price) {
		this.pay_price = pay_price;
	}

	public String getPay_ment() {
		return pay_ment;
	}

	public void setPay_ment(String pay_ment) {
		this.pay_ment = pay_ment;
	}

	public String getPay_datetime() {
		return pay_datetime;
	}

	public void setPay_datetime(String pay_datetime) {
		this.pay_datetime = pay_datetime;
	}

	public String getPay_name() {
		return pay_name;
	}

	public void setPay_name(String pay_name) {
		this.pay_name = pay_name;
	}

	public int getCart_no() {
		return cart_no;
	}

	public void setCart_no(int cart_no) {
		this.cart_no = cart_no;
	}

	public int getRentalres_no() {
		return rentalres_no;
	}

	public void setRentalres_no(int rentalres_no) {
		this.rentalres_no = rentalres_no;
	}

	public String getPayout_name() {
		return payout_name;
	}

	public void setPayout_name(String payout_name) {
		this.payout_name = payout_name;
	}

	public int getPayout_price() {
		return payout_price;
	}

	public void setPayout_price(int payout_price) {
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

	public int getBuy_amount() {
		return buy_amount;
	}

	public void setBuy_amount(int buy_amount) {
		this.buy_amount = buy_amount;
	}

	@Override
	public String toString() {
		return "adminVO [pay_no=" + pay_no + ", user_id=" + user_id + ", pay_price=" + pay_price + ", pay_ment="
				+ pay_ment + ", pay_datetime=" + pay_datetime + ", pay_name=" + pay_name + ", cart_no=" + cart_no
				+ ", rentalres_no=" + rentalres_no + ", payout_name=" + payout_name + ", payout_price=" + payout_price
				+ ", payout_ment=" + payout_ment + ", payout_date=" + payout_date + ", buy_amount=" + buy_amount + "]";
	}
}
