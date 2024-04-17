package kr.co.dong.DTO;

public class QnaDTO {
	private int qa_no;
	private String qa_content;
	private String qa_todaydate;
	private String qa_etc;
	private String qa_title;
	private String user_id;
	
	public QnaDTO() {
		
	}

	public QnaDTO(int qa_no, String qa_content, String qa_todaydate, String qa_etc, String qa_title, String user_id) {
		super();
		this.qa_no = qa_no;
		this.qa_content = qa_content;
		this.qa_todaydate = qa_todaydate;
		this.qa_etc = qa_etc;
		this.qa_title = qa_title;
		this.user_id = user_id;
	}

	public int getQa_no() {
		return qa_no;
	}

	public void setQa_no(int qa_no) {
		this.qa_no = qa_no;
	}

	public String getQa_content() {
		return qa_content;
	}

	public void setQa_content(String qa_content) {
		this.qa_content = qa_content;
	}

	public String getQa_todaydate() {
		return qa_todaydate;
	}

	public void setQa_todaydate(String qa_todaydate) {
		this.qa_todaydate = qa_todaydate;
	}

	public String getQa_etc() {
		return qa_etc;
	}

	public void setQa_etc(String qa_etc) {
		this.qa_etc = qa_etc;
	}

	public String getQa_title() {
		return qa_title;
	}

	public void setQa_title(String qa_title) {
		this.qa_title = qa_title;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	@Override
	public String toString() {
		return "QnaDTO [qa_no=" + qa_no + ", qa_content=" + qa_content + ", qa_todaydate=" + qa_todaydate + ", qa_etc="
				+ qa_etc + ", qa_title=" + qa_title + ", user_id=" + user_id + "]";
	}
}