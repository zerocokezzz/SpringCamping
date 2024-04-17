package kr.co.dong.DTO;

public class PayInDTO {
	
	private int payin_no;
	private String user_id;
	private int pay_no;
	
	public PayInDTO() {
		super();
	}
	public PayInDTO(int payin_no, String user_id, int pay_no) {
		super();
		this.payin_no = payin_no;
		this.user_id = user_id;
		this.pay_no = pay_no;
	}
	public int getPayin_no() {
		return payin_no;
	}
	public void setPayin_no(int payin_no) {
		this.payin_no = payin_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getPay_no() {
		return pay_no;
	}
	public void setPay_no(int pay_no) {
		this.pay_no = pay_no;
	}
	@Override
	public String toString() {
		return "PayInDTO [payin_no=" + payin_no + ", user_id=" + user_id + ", pay_no=" + pay_no + "]";
	}
	
	
}
