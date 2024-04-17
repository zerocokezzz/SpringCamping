package kr.co.dong.DTO;

public class UserDTO {
	private String user_id;
	private int user_no;
	private String user_nick;
	private String user_password;
	private String user_name;
	private String user_phone;
	private String user_intype;
	private String user_indatetime;
	private String user_outdatetime;
	private Boolean user_admin;

	public UserDTO() {
		
	}

	public UserDTO(String user_id, int user_no, String user_nick, String user_password, String user_name,
			String user_phone, String user_intype, String user_indatetime, String user_outdatetime,
			Boolean user_admin) {
		super();
		this.user_id = user_id;
		this.user_no = user_no;
		this.user_nick = user_nick;
		this.user_password = user_password;
		this.user_name = user_name;
		this.user_phone = user_phone;
		this.user_intype = user_intype;
		this.user_indatetime = user_indatetime;
		this.user_outdatetime = user_outdatetime;
		this.user_admin = user_admin;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public String getUser_nick() {
		return user_nick;
	}

	public void setUser_nick(String user_nick) {
		this.user_nick = user_nick;
	}

	public String getUser_password() {
		return user_password;
	}

	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_phone() {
		return user_phone;
	}

	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}

	public String getUser_intype() {
		return user_intype;
	}

	public void setUser_intype(String user_intype) {
		this.user_intype = user_intype;
	}

	public String getUser_indatetime() {
		return user_indatetime;
	}

	public void setUser_indatetime(String user_indatetime) {
		this.user_indatetime = user_indatetime;
	}

	public String getUser_outdatetime() {
		return user_outdatetime;
	}

	public void setUser_outdatetime(String user_outdatetime) {
		this.user_outdatetime = user_outdatetime;
	}

	public Boolean getUser_admin() {
		return user_admin;
	}

	public void setUser_admin(Boolean user_admin) {
		this.user_admin = user_admin;
	}

	@Override
	public String toString() {
		return "UserDTO [user_id=" + user_id + ", user_no=" + user_no + ", user_nick=" + user_nick + ", user_password="
				+ user_password + ", user_name=" + user_name + ", user_phone=" + user_phone + ", user_intype="
				+ user_intype + ", user_indatetime=" + user_indatetime + ", user_outdatetime=" + user_outdatetime
				+ ", user_admin=" + user_admin + "]";
	}

	
	

	

	
}
