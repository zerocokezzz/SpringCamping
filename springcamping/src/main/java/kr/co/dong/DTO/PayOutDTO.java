package kr.co.dong.DTO;


public class PayOutDTO {
	private int payout_no; 
	private String payout_name; 
	private int payout_price ;
	private String payout_ment; 
	private String payout_date; 
	private String user_id;
	private int payin_no;
	
	public PayOutDTO() {
		super();
	}

	public PayOutDTO(int payout_no, String payout_name, int payout_price, String payout_ment, String payout_date,
			String user_id, int payin_no) {
		super();
		this.payout_no = payout_no;
		this.payout_name = payout_name;
		this.payout_price = payout_price;
		this.payout_ment = payout_ment;
		this.payout_date = payout_date;
		this.user_id = user_id;
		this.payin_no = payin_no;
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

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getPayin_no() {
		return payin_no;
	}

	public void setPayin_no(int payin_no) {
		this.payin_no = payin_no;
	}

	@Override
	public String toString() {
		return "PayOutDTO [payout_no=" + payout_no + ", payout_name=" + payout_name + ", payout_price=" + payout_price
				+ ", payout_ment=" + payout_ment + ", payout_date=" + payout_date + ", user_id=" + user_id
				+ ", payin_no=" + payin_no + "]";
	}

}