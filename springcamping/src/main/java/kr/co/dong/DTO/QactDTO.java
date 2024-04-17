package kr.co.dong.DTO;

public class QactDTO {
	private int qact_no;
	private String qact_title;
	private String qact_content;
	private String qact_todaydate;
	private String user_id;
	private int qa_no;
	
	public QactDTO() {
		
	}

	public QactDTO(int qact_no, String qact_title, String qact_content, String qact_todaydate, String user_id,
			int qa_no) {
		super();
		this.qact_no = qact_no;
		this.qact_title = qact_title;
		this.qact_content = qact_content;
		this.qact_todaydate = qact_todaydate;
		this.user_id = user_id;
		this.qa_no = qa_no;
	}

	public int getQact_no() {
		return qact_no;
	}

	public void setQact_no(int qact_no) {
		this.qact_no = qact_no;
	}

	public String getQact_title() {
		return qact_title;
	}

	public void setQact_title(String qact_title) {
		this.qact_title = qact_title;
	}

	public String getQact_content() {
		return qact_content;
	}

	public void setQact_content(String qact_content) {
		this.qact_content = qact_content;
	}

	public String getQact_todaydate() {
		return qact_todaydate;
	}

	public void setQact_todaydate(String qact_todaydate) {
		this.qact_todaydate = qact_todaydate;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getQa_no() {
		return qa_no;
	}

	public void setQa_no(int qa_no) {
		this.qa_no = qa_no;
	}

	@Override
	public String toString() {
		return "QactDTO [qact_no=" + qact_no + ", qact_title=" + qact_title + ", qact_content=" + qact_content
				+ ", qact_todaydate=" + qact_todaydate + ", user_id=" + user_id + ", qa_no=" + qa_no + "]";
	}

	
	
	

}
