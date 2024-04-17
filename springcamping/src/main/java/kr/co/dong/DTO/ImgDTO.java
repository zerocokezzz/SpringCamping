/*
 * Table: img
 * Columns:
 * img_no int AI PK 
 * img_parents varchar(1000) 
 * img_name varchar(1000) 
 * img_datetime datetime
 */

package kr.co.dong.DTO;

public class ImgDTO {
	private int img_no;				// 이미지 번호
	private String img_parents;		// 부모글 번호
	private String img_name;		// 이미지 파일명
	private String img_datetime;	// 이미지 업로드 일시
	
	public ImgDTO() {}
	
	public ImgDTO(int img_no, String img_parents, String img_name, String img_datetime) {
		super();
		this.img_no = img_no;
		this.img_parents = img_parents;
		this.img_name = img_name;
		this.img_datetime = img_datetime;
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
		return "ImgDTO [img_no=" + img_no + ", img_parents=" + img_parents + ", img_name=" + img_name
				+ ", img_datetime=" + img_datetime + "]";
	}
	
}
