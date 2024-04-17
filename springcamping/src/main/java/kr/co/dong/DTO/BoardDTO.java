package kr.co.dong.DTO;

public class BoardDTO {

	private int bno;
	private String board_title;
	private String board_content;
	private String board_todaydate;
	private int board_readcnt;
	private int board_love;
	private String user_id;
	
	public BoardDTO() {
		super();
	}

	public BoardDTO(int bno, String board_title, String board_content, String board_todaydate, int board_readcnt,
			int board_love, String user_id) {
		super();
		this.bno = bno;
		this.board_title = board_title;
		this.board_content = board_content;
		this.board_todaydate = board_todaydate;
		this.board_readcnt = board_readcnt;
		this.board_love = board_love;
		this.user_id = user_id;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public String getBoard_content() {
		return board_content;
	}

	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}

	public String getBoard_todaydate() {
		return board_todaydate;
	}

	public void setBoard_todaydate(String board_todaydate) {
		this.board_todaydate = board_todaydate;
	}

	public int getBoard_readcnt() {
		return board_readcnt;
	}

	public void setBoard_readcnt(int board_readcnt) {
		this.board_readcnt = board_readcnt;
	}

	public int getBoard_love() {
		return board_love;
	}

	public void setBoard_love(int board_love) {
		this.board_love = board_love;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	@Override
	public String toString() {
		return "BoardDTO [bno=" + bno + ", board_title=" + board_title + ", board_content=" + board_content
				+ ", board_todaydate=" + board_todaydate + ", board_readcnt=" + board_readcnt + ", board_love="
				+ board_love + ", user_id=" + user_id + "]";
	}
	
}
