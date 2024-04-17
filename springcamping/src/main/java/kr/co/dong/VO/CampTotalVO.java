/*
 * Table: camp_info
 * Columns:
 * camp_no varchar(1000) PK 
 * camp_type varchar(1000) 
 * camp_index int 
 * camp_size varchar(1000) 
 * camp_cnt int 
 * camp_checkin datetime 
 * camp_checkout datetime 
 * camp_content varchar(1000) 
 * camp_etc varchar(1000) 
 * camp_defperson int 
 * camp_addperson int 
 * camp_allperson int 
 * camp_price int 
 * img_no int
 */
package kr.co.dong.VO;

public class CampTotalVO {
	private String camp_no;			// 캠핑 정보 사이트 일련번호 (사이트 타입 + 사이트 번호)
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
	private int img_no;				// 이미지 번호
	private String img_parents;		// 부모글 번호
	private String img_name;		// 이미지 파일명
	private String img_datetime;	// 이미지 업로드 일시
	
	public CampTotalVO() {}

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

	public int getImg_no() {
		return img_no;
	}

	public void setImg_no(int img_no) {
		this.img_no = img_no;
	}

	public String getImg_parents() {
		return img_parents;
	}

	public void setImg_parents(String img_parents) {
		this.img_parents = img_parents;
	}

	public String getImg_name() {
		return img_name;
	}

	public void setImg_name(String img_name) {
		this.img_name = img_name;
	}

	public String getImg_datetime() {
		return img_datetime;
	}

	public void setImg_datetime(String img_datetime) {
		this.img_datetime = img_datetime;
	}

	@Override
	public String toString() {
		return "CampInfoDTO [camp_no=" + camp_no + ", camp_type=" + camp_type + ", camp_index=" + camp_index
				+ ", camp_size=" + camp_size + ", camp_cnt=" + camp_cnt + ", camp_checkin=" + camp_checkin
				+ ", camp_checkout=" + camp_checkout + ", camp_content=" + camp_content + ", camp_etc=" + camp_etc
				+ ", camp_defperson=" + camp_defperson + ", camp_addperson=" + camp_addperson + ", camp_allperson="
				+ camp_allperson + ", camp_price=" + camp_price + ", img_no=" + img_no + ", img_parents=" + img_parents
				+ ", img_name=" + img_name + ", img_datetime=" + img_datetime + "]";
	}
	
}
