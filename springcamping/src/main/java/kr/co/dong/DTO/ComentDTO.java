package kr.co.dong.DTO;

public class ComentDTO {
	private Integer ct_no;
	private String ct_content;
	private String ct_todaydate;
	private String user_id;
	private Integer bno;
	
	public ComentDTO () {
	}

	public ComentDTO(Integer ct_no, String ct_content, String ct_todaydate, String user_id, Integer bno) {
		super();
		this.ct_no = ct_no;
		this.ct_content = ct_content;
		this.ct_todaydate = ct_todaydate;
		this.user_id = user_id;
		this.bno = bno;
	}

	public Integer getCt_no() {
		return ct_no;
	}

	public void setCt_no(Integer ct_no) {
		this.ct_no = ct_no;
	}

	public String getCt_content() {
		return ct_content;
	}

	public void setCt_content(String ct_content) {
		this.ct_content = ct_content;
	}

	public String getCt_todaydate() {
		return ct_todaydate;
	}

	public void setCt_todaydate(String ct_todaydate) {
		this.ct_todaydate = ct_todaydate;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public Integer getBno() {
		return bno;
	}

	public void setBno(Integer bno) {
		this.bno = bno;
	}

	@Override
	public String toString() {
		return "ComentDTO [ct_no=" + ct_no + ", ct_content=" + ct_content + ", ct_todaydate=" + ct_todaydate
				+ ", user_id=" + user_id + ", bno=" + bno + "]";
	}

	
}
