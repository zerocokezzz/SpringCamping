/*
 * pay_no int PK 
user_id varchar(50) 
pay_price int 
pay_ment varchar(100) 
pay_datetime datetime 
pay_name varchar(1000) 
cart_no int 
rentalres_no int
 */

package kr.co.dong.VO;

import kr.co.dong.DTO.UserDTO;

public class PayVO {
	private int pay_no;
	private UserDTO user;
	private int pay_price;
	private String pay_ment;
	private String pay_datetime;
	private String pay_name;
	private CartVO cart_no;
	
	public PayVO() {
		
	}

	public PayVO(int pay_no, UserDTO user, int pay_price, String pay_ment, String pay_datetime, String pay_name,
			CartVO cart_no) {
		super();
		this.pay_no = pay_no;
		this.user = user;
		this.pay_price = pay_price;
		this.pay_ment = pay_ment;
		this.pay_datetime = pay_datetime;
		this.pay_name = pay_name;
		this.cart_no = cart_no;
	}

	public int getPay_no() {
		return pay_no;
	}

	public void setPay_no(int pay_no) {
		this.pay_no = pay_no;
	}

	public UserDTO getUser() {
		return user;
	}

	public void setUser(UserDTO user) {
		this.user = user;
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

	public CartVO getCart_no() {
		return cart_no;
	}

	public void setCart_no(CartVO cart_no) {
		this.cart_no = cart_no;
	}

	@Override
	public String toString() {
		return "PayVO [pay_no=" + pay_no + ", user=" + user + ", pay_price=" + pay_price + ", pay_ment=" + pay_ment
				+ ", pay_datetime=" + pay_datetime + ", pay_name=" + pay_name + ", cart_no=" + cart_no + "]";
	}
	
	
	
}
