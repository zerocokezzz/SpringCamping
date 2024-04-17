package kr.co.dong.DTO;


public class ResDTO {
	
	private int res_no; 
	private String user_id ;
	private String campres_checkin; 
	private String campres_checkout; 
	private int campres_person ;
	private String res_paystate  ;
	private String camp_no ;
	
	public ResDTO() {
		super();
	}

	public ResDTO(int res_no, String user_id, String campres_checkin, String campres_checkout, int campres_person,
			String res_paystate, String camp_no) {
		super();
		this.res_no = res_no;
		this.user_id = user_id;
		this.campres_checkin = campres_checkin;
		this.campres_checkout = campres_checkout;
		this.campres_person = campres_person;
		this.res_paystate = res_paystate;
		this.camp_no = camp_no;
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

	@Override
	public String toString() {
		return "ResDTO [res_no=" + res_no + ", user_id=" + user_id + ", campres_checkin=" + campres_checkin
				+ ", campres_checkout=" + campres_checkout + ", campres_person=" + campres_person + ", res_paystate="
				+ res_paystate + ", camp_no=" + camp_no + "]";
	}

}