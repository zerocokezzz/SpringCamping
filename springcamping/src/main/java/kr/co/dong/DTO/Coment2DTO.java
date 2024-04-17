package kr.co.dong.DTO;

public class Coment2DTO {
	private int ct2_no;
	private String ct2_content;
	private String ct2_todaydate;
	private String ct2_deep;
	private int ct_no;
	
	public Coment2DTO () {
		
	}

	public Coment2DTO(int ct2_no, String ct2_content, String ct2_todaydate, String ct2_deep, int ct_no) {
		super();
		this.ct2_no = ct2_no;
		this.ct2_content = ct2_content;
		this.ct2_todaydate = ct2_todaydate;
		this.ct2_deep = ct2_deep;
		this.ct_no = ct_no;
	}

	public int getCt2_no() {
		return ct2_no;
	}

	public void setCt2_no(int ct2_no) {
		this.ct2_no = ct2_no;
	}

	public String getCt2_content() {
		return ct2_content;
	}

	public void setCt2_content(String ct2_content) {
		this.ct2_content = ct2_content;
	}

	public String getCt2_todaydate() {
		return ct2_todaydate;
	}

	public void setCt2_todaydate(String ct2_todaydate) {
		this.ct2_todaydate = ct2_todaydate;
	}

	public String getCt2_deep() {
		return ct2_deep;
	}

	public void setCt2_deep(String ct2_deep) {
		this.ct2_deep = ct2_deep;
	}

	public int getCt_no() {
		return ct_no;
	}

	public void setCt_no(int ct_no) {
		this.ct_no = ct_no;
	}

	@Override
	public String toString() {
		return "Coment2DTO [ct2_no=" + ct2_no + ", ct2_content=" + ct2_content + ", ct2_todaydate=" + ct2_todaydate
				+ ", ct2_deep=" + ct2_deep + ", ct_no=" + ct_no + "]";
	}

	

	
	
	
}
