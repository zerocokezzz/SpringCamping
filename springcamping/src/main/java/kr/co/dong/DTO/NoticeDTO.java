package kr.co.dong.DTO;

public class NoticeDTO {

	private int notice_no;
	private String notice_title;
	private String notice_content;
	private int notice_readcnt;
	private String notice_datetime;
	private String notice_etc;
	
	public int getNotice_no() {
		return notice_no;
	}
	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public int getNotice_readcnt() {
		return notice_readcnt;
	}
	public void setNotice_readcnt(int notice_readcnt) {
		this.notice_readcnt = notice_readcnt;
	}
	public String getNotice_datetime() {
		return notice_datetime;
	}
	public void setNotice_datetime(String notice_datetime) {
		this.notice_datetime = notice_datetime;
	}
	public String getNotice_etc() {
		return notice_etc;
	}
	public void setNotice_etc(String notice_etc) {
		this.notice_etc = notice_etc;
	}
	
	@Override
	public String toString() {
		return "NoticeDTO [notice_no=" + notice_no + ", notice_title=" + notice_title + ", notice_content="
				+ notice_content + ", notice_readcnt=" + notice_readcnt + ", notice_datetime=" + notice_datetime
				+ ", notice_etc=" + notice_etc + "]";
	}
	

	
}
