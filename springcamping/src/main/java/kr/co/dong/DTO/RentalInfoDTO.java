/*Table: rental_info
 * Columns:
 * rental_no varchar(1000) PK 
 * rental_type varchar(1000) 
 * rental_index int 
 * rental_name varchar(1000) 
 * rental_content varchar(1000) 
 * rental_etc varchar(45) 
 * rental_price int
 */

package kr.co.dong.DTO;

public class RentalInfoDTO {
	private String rental_no;		// 렌탈 물품 일련번호(렌탈 물품 타입 + 렌탈 물품 번호)
	private String rental_type;		// 렌탈 물품 타입 
	private int rental_index;		// 렌탈 물품 번호
	private String rental_name;		// 렌탈 물품명
	private String rental_content;	// 렌탈 물품 설명
	private String rental_etc;		// 렌탈 물품 추가 설명
	private int rental_price;		// 렌탈 물품 가격
	
	public RentalInfoDTO() {}

	public RentalInfoDTO(String rental_no, String rental_type, int rental_index, String rental_name,
			String rental_content, String rental_etc, int rental_price) {
		super();
		this.rental_no = rental_no;
		this.rental_type = rental_type;
		this.rental_index = rental_index;
		this.rental_name = rental_name;
		this.rental_content = rental_content;
		this.rental_etc = rental_etc;
		this.rental_price = rental_price;
	}

	public String getRental_no() {
		return rental_no;
	}

	public void setRental_no(String rental_no) {
		this.rental_no = rental_no;
	}

	public String getRental_type() {
		return rental_type;
	}

	public void setRental_type(String rental_type) {
		this.rental_type = rental_type;
	}

	public int getRental_index() {
		return rental_index;
	}

	public void setRental_index(int rental_index) {
		this.rental_index = rental_index;
	}

	public String getRental_name() {
		return rental_name;
	}

	public void setRental_name(String rental_name) {
		this.rental_name = rental_name;
	}

	public String getRental_content() {
		return rental_content;
	}

	public void setRental_content(String rental_content) {
		this.rental_content = rental_content;
	}

	public String getRental_etc() {
		return rental_etc;
	}

	public void setRental_etc(String rental_etc) {
		this.rental_etc = rental_etc;
	}

	public int getRental_price() {
		return rental_price;
	}

	public void setRental_price(int rental_price) {
		this.rental_price = rental_price;
	}

	@Override
	public String toString() {
		return "RentalInfoDTO [rental_no=" + rental_no + ", rental_type=" + rental_type + ", rental_index="
				+ rental_index + ", rental_name=" + rental_name + ", rental_content=" + rental_content + ", rental_etc="
				+ rental_etc + ", rental_price=" + rental_price + "]";
	}
	
}
