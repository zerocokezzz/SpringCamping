package kr.co.dong.DTO;


public class ShopInfoDTO {
	
	private String shop_no;
	private String shop_name;
	private String shop_content;
	private int shop_price;
	private int shop_cnt;
	private String shop_update;
	private String image_url;
	private int img_no;
	private int shop_limit;
	private int shop_promo;
	
	public ShopInfoDTO() {
		super();
	}
	public ShopInfoDTO(String shop_no, String shop_name, String shop_content, int shop_price, int shop_cnt,
			String shop_update, String image_url, int img_no, int shop_limit, int shop_promo) {
		super();
		this.shop_no = shop_no;
		this.shop_name = shop_name;
		this.shop_content = shop_content;
		this.shop_price = shop_price;
		this.shop_cnt = shop_cnt;
		this.shop_update = shop_update;
		this.image_url = image_url;
		this.img_no = img_no;
		this.shop_limit = shop_limit;
		this.shop_promo = shop_promo;
	}
	public String getShop_no() {
		return shop_no;
	}
	public void setShop_no(String shop_no) {
		this.shop_no = shop_no;
	}
	public String getShop_name() {
		return shop_name;
	}
	public void setShop_name(String shop_name) {
		this.shop_name = shop_name;
	}
	public String getShop_content() {
		return shop_content;
	}
	public void setShop_content(String shop_content) {
		this.shop_content = shop_content;
	}
	public int getShop_price() {
		return shop_price;
	}
	public void setShop_price(int shop_price) {
		this.shop_price = shop_price;
	}
	public int getShop_cnt() {
		return shop_cnt;
	}
	public void setShop_cnt(int shop_cnt) {
		this.shop_cnt = shop_cnt;
	}
	public String getShop_update() {
		return shop_update;
	}
	public void setShop_update(String shop_update) {
		this.shop_update = shop_update;
	}
	public String getImage_url() {
		return image_url;
	}
	public void setImage_url(String image_url) {
		this.image_url = image_url;
	}
	public int getImg_no() {
		return img_no;
	}
	public void setImg_no(int img_no) {
		this.img_no = img_no;
	}
	public int getShop_limit() {
		return shop_limit;
	}
	public void setShop_limit(int shop_limit) {
		this.shop_limit = shop_limit;
	}
	public int getShop_promo() {
		return shop_promo;
	}
	public void setShop_promo(int shop_promo) {
		this.shop_promo = shop_promo;
	}
	@Override
	public String toString() {
		return "ShopInfoDTO [shop_no=" + shop_no + ", shop_name=" + shop_name + ", shop_content=" + shop_content
				+ ", shop_price=" + shop_price + ", shop_cnt=" + shop_cnt + ", shop_update=" + shop_update
				+ ", image_url=" + image_url + ", img_no=" + img_no + ", shop_limit=" + shop_limit + ", shop_promo="
				+ shop_promo + "]";
	}
}