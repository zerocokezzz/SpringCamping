package kr.co.dong.VO;

public class PayOutResVO {
	
	private int res_no; 
	private String user_id ;
	private String campres_checkin; 
	private String campres_checkout; 
	private int campres_person ;
	private String res_paystate  ;
	private String camp_no ;
	private int payout_no; 
	private String payout_name; 
	private int payout_price ;
	private String payout_ment; 
	private String payout_date; 
	private int pay_no;
	
	public PayOutResVO() {
		super();
	}

	public PayOutResVO(int res_no, String user_id, String campres_checkin, String campres_checkout, int campres_person,
			String res_paystate, String camp_no, int payout_no, String payout_name, int payout_price,
			String payout_ment, String payout_date, int pay_no) {
		super();
		this.res_no = res_no;
		this.user_id = user_id;
		this.campres_checkin = campres_checkin;
		this.campres_checkout = campres_checkout;
		this.campres_person = campres_person;
		this.res_paystate = res_paystate;
		this.camp_no = camp_no;
		this.payout_no = payout_no;
		this.payout_name = payout_name;
		this.payout_price = payout_price;
		this.payout_ment = payout_ment;
		this.payout_date = payout_date;
		this.pay_no = pay_no;
	}

	public int getRes_no() {
		return res_no;
	}

	public void setRes_no(int res_no) {
		this.res_no = res_no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getCampres_checkin() {
		return campres_checkin;
	}

	public void setCampres_checkin(String campres_checkin) {
		this.campres_checkin = campres_checkin;
	}

	public String getCampres_checkout() {
		return campres_checkout;
	}

	public void setCampres_checkout(String campres_checkout) {
		this.campres_checkout = campres_checkout;
	}

	public int getCampres_person() {
		return campres_person;
	}

	public void setCampres_person(int campres_person) {
		this.campres_person = campres_person;
	}

	public String getRes_paystate() {
		return res_paystate;
	}

	public void setRes_paystate(String res_paystate) {
		this.res_paystate = res_paystate;
	}

	public String getCamp_no() {
		return camp_no;
	}

	public void setCamp_no(String camp_no) {
		this.camp_no = camp_no;
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

	public int getPay_no() {
		return pay_no;
	}

	public void setPay_no(int pay_no) {
		this.pay_no = pay_no;
	}

	@Override
	public String toString() {
		return "PayOutResVO [res_no=" + res_no + ", user_id=" + user_id + ", campres_checkin=" + campres_checkin
				+ ", campres_checkout=" + campres_checkout + ", campres_person=" + campres_person + ", res_paystate="
				+ res_paystate + ", camp_no=" + camp_no + ", payout_no=" + payout_no + ", payout_name=" + payout_name
				+ ", payout_price=" + payout_price + ", payout_ment=" + payout_ment + ", payout_date=" + payout_date
				+ ", pay_no=" + pay_no + "]";
	}
	
	
}