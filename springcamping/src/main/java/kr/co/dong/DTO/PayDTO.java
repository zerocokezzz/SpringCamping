package kr.co.dong.DTO;


public class PayDTO {
	
	private int pay_no; 
	private String user_id; 
	private int pay_price;
	private String pay_ment; 
	private String pay_datetime; 
	private String pay_name; 
	private int cart_no;
	private int rentalres_no;
	
	public PayDTO() {
		super();
	}
	
	public PayDTO(String user_id, int pay_price, String pay_ment, int cart_no) {
		super();
		this.user_id = user_id;
		this.pay_price = pay_price;
		this.pay_ment = pay_ment;
		this.cart_no = cart_no;
	}

	public PayDTO(int pay_no, String user_id, int pay_price, String pay_ment, String pay_datetime, String pay_name,
			int cart_no) {
		super();
		this.pay_no = pay_no;
		this.user_id = user_id;
		this.pay_price = pay_price;
		this.pay_ment = pay_ment;
		this.pay_datetime = pay_datetime;
		this.pay_name = pay_name;
		this.cart_no = cart_no;
	}

	public PayDTO(int pay_no, String user_id, int pay_price, String pay_ment, String pay_datetime, String pay_name,
			int cart_no, int rentalres_no) {
		super();
		this.pay_no = pay_no;
		this.user_id = user_id;
		this.pay_price = pay_price;
		this.pay_ment = pay_ment;
		this.pay_datetime = pay_datetime;
		this.pay_name = pay_name;
		this.cart_no = cart_no;
		this.rentalres_no = rentalres_no;
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
	@Override
	public String toString() {
		return "PayDTO [pay_no=" + pay_no + ", user_id=" + user_id + ", pay_price=" + pay_price + ", pay_ment="
				+ pay_ment + ", pay_datetime=" + pay_datetime + ", pay_name=" + pay_name + ", cart_no=" + cart_no
				+ ", rentalres_no=" + rentalres_no + "]";
	}
	
}