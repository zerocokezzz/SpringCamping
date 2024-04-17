package kr.co.dong.DTO;

public class RentalDTO {
	
	private int rentalres_no;
	private int res_no;
	private String F1;
	private String F2;
	private String F3;
	private String F4;
	private String F5;
	private int F1_cnt;
	private int F2_cnt;
	private int F3_cnt;
	private int F4_cnt;
	private int F5_cnt;
	
	public RentalDTO() {
		super();
	}

	public RentalDTO(int rentalres_no, int res_no, String f1, String f2, String f3, String f4, String f5, int f1_cnt,
			int f2_cnt, int f3_cnt, int f4_cnt, int f5_cnt) {
		super();
		this.rentalres_no = rentalres_no;
		this.res_no = res_no;
		F1 = f1;
		F2 = f2;
		F3 = f3;
		F4 = f4;
		F5 = f5;
		F1_cnt = f1_cnt;
		F2_cnt = f2_cnt;
		F3_cnt = f3_cnt;
		F4_cnt = f4_cnt;
		F5_cnt = f5_cnt;
	}

	public int getRentalres_no() {
		return rentalres_no;
	}

	public void setRentalres_no(int rentalres_no) {
		this.rentalres_no = rentalres_no;
	}

	public int getRes_no() {
		return res_no;
	}

	public void setRes_no(int res_no) {
		this.res_no = res_no;
	}

	public String getF1() {
		return F1;
	}

	public void setF1(String f1) {
		F1 = f1;
	}

	public String getF2() {
		return F2;
	}

	public void setF2(String f2) {
		F2 = f2;
	}

	public String getF3() {
		return F3;
	}

	public void setF3(String f3) {
		F3 = f3;
	}

	public String getF4() {
		return F4;
	}

	public void setF4(String f4) {
		F4 = f4;
	}

	public String getF5() {
		return F5;
	}

	public void setF5(String f5) {
		F5 = f5;
	}

	public int getF1_cnt() {
		return F1_cnt;
	}

	public void setF1_cnt(int f1_cnt) {
		F1_cnt = f1_cnt;
	}

	public int getF2_cnt() {
		return F2_cnt;
	}

	public void setF2_cnt(int f2_cnt) {
		F2_cnt = f2_cnt;
	}

	public int getF3_cnt() {
		return F3_cnt;
	}

	public void setF3_cnt(int f3_cnt) {
		F3_cnt = f3_cnt;
	}

	public int getF4_cnt() {
		return F4_cnt;
	}

	public void setF4_cnt(int f4_cnt) {
		F4_cnt = f4_cnt;
	}

	public int getF5_cnt() {
		return F5_cnt;
	}

	public void setF5_cnt(int f5_cnt) {
		F5_cnt = f5_cnt;
	}

	@Override
	public String toString() {
		return "RentalDTO [rentalres_no=" + rentalres_no + ", res_no=" + res_no + ", F1=" + F1 + ", F2=" + F2 + ", F3="
				+ F3 + ", F4=" + F4 + ", F5=" + F5 + ", F1_cnt=" + F1_cnt + ", F2_cnt=" + F2_cnt + ", F3_cnt=" + F3_cnt
				+ ", F4_cnt=" + F4_cnt + ", F5_cnt=" + F5_cnt + "]";
	}
	
}