package kr.co.dong.DTO;

public class CampInfoDTO {
	private String camp_no;			// 캠핑 정보 사이트 일련번호
	private String camp_type;		// 캠핑 정보 사이트 타입
	private int camp_index;			// 캠핑 정보 사이트 번호
	private String camp_size;		// 캠핑 정보 사이트 크기
	private int camp_cnt;			// 캠핑 정보 사이트 갯수
	private String camp_checkin;	// 캠핑 정보 입실 시간
	private String camp_checkout;	// 캠핑 정보 퇴실 시간
	private String camp_content;	// 캠핑 정보 사이트 설명
	private String camp_etc;		// 캠핑 정보 사이트 추가설명
	private int camp_defperson;		// 캠핑 정보 기본 가능 인원
	private int camp_addperson;		// 캠핑 정보 추가 가능 인원
	private int camp_allperson;		// 캠핑 정보 총 예약 가능 인원
	private int camp_price;			// 캠핑 정보 사이트 가격
	
	public CampInfoDTO() {}
	
	public CampInfoDTO(String camp_no, String camp_type, int camp_index, String camp_size, int camp_cnt,
			String camp_checkin, String camp_checkout, String camp_content, String camp_etc, int camp_defperson,
			int camp_addperson, int camp_allperson, int camp_price) {
		super();
		this.camp_no = camp_no;
		this.camp_type = camp_type;
		this.camp_index = camp_index;
		this.camp_size = camp_size;
		this.camp_cnt = camp_cnt;
		this.camp_checkin = camp_checkin;
		this.camp_checkout = camp_checkout;
		this.camp_content = camp_content;
		this.camp_etc = camp_etc;
		this.camp_defperson = camp_defperson;
		this.camp_addperson = camp_addperson;
		this.camp_allperson = camp_allperson;
		this.camp_price = camp_price;
	}

	public String getCamp_no() {
		return camp_no;
	}

	public void setCamp_no(String camp_no) {
		this.camp_no = camp_no;
	}

	public String getCamp_type() {
		return camp_type;
	}

	public void setCamp_type(String camp_type) {
		this.camp_type = camp_type;
	}

	public int getCamp_index() {
		return camp_index;
	}

	public void setCamp_index(int camp_index) {
		this.camp_index = camp_index;
	}

	public String getCamp_size() {
		return camp_size;
	}

	public void setCamp_size(String camp_size) {
		this.camp_size = camp_size;
	}

	public int getCamp_cnt() {
		return camp_cnt;
	}

	public void setCamp_cnt(int camp_cnt) {
		this.camp_cnt = camp_cnt;
	}

	public String getCamp_checkin() {
		return camp_checkin;
	}

	public void setCamp_checkin(String camp_checkin) {
		this.camp_checkin = camp_checkin;
	}

	public String getCamp_checkout() {
		return camp_checkout;
	}

	public void setCamp_checkout(String camp_checkout) {
		this.camp_checkout = camp_checkout;
	}

	public String getCamp_content() {
		return camp_content;
	}

	public void setCamp_content(String camp_content) {
		this.camp_content = camp_content;
	}

	public String getCamp_etc() {
		return camp_etc;
	}

	public void setCamp_etc(String camp_etc) {
		this.camp_etc = camp_etc;
	}

	public int getCamp_defperson() {
		return camp_defperson;
	}

	public void setCamp_defperson(int camp_defperson) {
		this.camp_defperson = camp_defperson;
	}

	public int getCamp_addperson() {
		return camp_addperson;
	}

	public void setCamp_addperson(int camp_addperson) {
		this.camp_addperson = camp_addperson;
	}

	public int getCamp_allperson() {
		return camp_allperson;
	}

	public void setCamp_allperson(int camp_allperson) {
		this.camp_allperson = camp_allperson;
	}

	public int getCamp_price() {
		return camp_price;
	}

	public void setCamp_price(int camp_price) {
		this.camp_price = camp_price;
	}

	@Override
	public String toString() {
		return "CampInfoDTO [camp_no=" + camp_no + ", camp_type=" + camp_type + ", camp_index=" + camp_index
				+ ", camp_size=" + camp_size + ", camp_cnt=" + camp_cnt + ", camp_checkin=" + camp_checkin
				+ ", camp_checkout=" + camp_checkout + ", camp_content=" + camp_content + ", camp_etc=" + camp_etc
				+ ", camp_defperson=" + camp_defperson + ", camp_addperson=" + camp_addperson + ", camp_allperson="
				+ camp_allperson + ", camp_price=" + camp_price + "]";
	}
	
}
