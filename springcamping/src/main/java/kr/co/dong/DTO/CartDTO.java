package kr.co.dong.DTO;


public class CartDTO {
   private int cart_no;
   private String user_id;
   private String cart_date;
   private int cart_amount;
   private int shop_no;
   private int buy_no;
   
   public CartDTO() {
      super();
   }

   public CartDTO(int cart_no, String user_id, String cart_date, int cart_amount, int shop_no, int buy_no) {
      super();
      this.cart_no = cart_no;
      this.user_id = user_id;
      this.cart_date = cart_date;
      this.cart_amount = cart_amount;
      this.shop_no = shop_no;
      this.buy_no = buy_no;
   }

   public int getCart_no() {
      return cart_no;
   }

   public void setCart_no(int cart_no) {
      this.cart_no = cart_no;
   }

   public String getUser_id() {
      return user_id;
   }

   public void setUser_id(String user_id) {
      this.user_id = user_id;
   }

   public String getCart_date() {
      return cart_date;
   }

   public void setCart_date(String cart_date) {
      this.cart_date = cart_date;
   }

   public int getCart_amount() {
      return cart_amount;
   }

   public void setCart_amount(int cart_amount) {
      this.cart_amount = cart_amount;
   }

   public int getShop_no() {
      return shop_no;
   }

   public void setShop_no(int shop_no) {
      this.shop_no = shop_no;
   }

   public int getBuy_no() {
      return buy_no;
   }

   public void setBuy_no(int buy_no) {
      this.buy_no = buy_no;
   }

   @Override
   public String toString() {
      return "CartDTO [cart_no=" + cart_no + ", user_id=" + user_id + ", cart_date=" + cart_date + ", cart_amount="
            + cart_amount + ", shop_no=" + shop_no + ", buy_no=" + buy_no + "]";
   }
   
   
   
}