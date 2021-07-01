package order.model.vo;

import java.sql.Date;

public class Order {
	private int orderNum;
	private String prodName;
	private int totalPrice;
	private String buyerEmail;
	private String buyerName;
	private String buyerPhone;
	private Date revDate;
	private int prodNum;
	private int hostNum;
	private Date orderDate;
	
	public Order() {}
	
	public Order(int orderNum, String prodName, int totalPrice, String buyerEmail, String buyerName, String buyerPhone,
			Date revDate, int prodNum, int hostNum) {
		super();
		this.orderNum = orderNum;
		this.prodName = prodName;
		this.totalPrice = totalPrice;
		this.buyerEmail = buyerEmail;
		this.buyerName = buyerName;
		this.buyerPhone = buyerPhone;
		this.revDate = revDate;
		this.prodNum = prodNum;
		this.hostNum = hostNum;
	}

	public Order(String prodName, String buyerEmail, String buyerName, String buyerPhone,
			int prodNum, int hostNum, int totalPrice, Date revDate) {
		super();
		this.prodName = prodName;
		this.totalPrice = totalPrice;
		this.buyerEmail = buyerEmail;
		this.buyerName = buyerName;
		this.buyerPhone = buyerPhone;
		this.revDate = revDate;
		this.hostNum = hostNum;
	}
	

	public Order(String prodName, int totalPrice, String buyerEmail, String buyerName, String buyerPhone,
			Date revDate, int prodNum, int hostNum, Date orderDate, int orderNum) {
		super();
		this.prodName = prodName;
		this.totalPrice = totalPrice;
		this.buyerEmail = buyerEmail;
		this.buyerName = buyerName;
		this.buyerPhone = buyerPhone;
		this.revDate = revDate;
		this.prodNum = prodNum;
		this.hostNum = hostNum;
		this.orderDate = orderDate;
		this.orderNum = orderNum;
	}

	
	
	public Order(String prodName, int totalPrice, String buyerName, Date revDate, int prodNum, Date orderDate,
			int orderNum) {
		super();
		this.prodName = prodName;
		this.totalPrice = totalPrice;
		this.buyerName = buyerName;
		this.revDate = revDate;
		this.prodNum = prodNum;
		this.orderDate = orderDate;
		this.orderNum = orderNum;
	}

	public String getProdName() {
		return prodName;
	}

	public void setProdName(String prodName) {
		this.prodName = prodName;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public String getBuyerEmail() {
		return buyerEmail;
	}

	public void setBuyerEmail(String buyerEmail) {
		this.buyerEmail = buyerEmail;
	}

	public String getBuyerName() {
		return buyerName;
	}

	public void setBuyerName(String buyerName) {
		this.buyerName = buyerName;
	}

	public String getBuyerPhone() {
		return buyerPhone;
	}

	public void setBuyerPhone(String buyerPhone) {
		this.buyerPhone = buyerPhone;
	}

	public Date getRevDate() {
		return revDate;
	}

	public void setRevDate(Date revDate) {
		this.revDate = revDate;
	}

	public int getProdNum() {
		return prodNum;
	}

	public void setProdNum(int prodNum) {
		this.prodNum = prodNum;
	}

	public int getHostNum() {
		return hostNum;
	}

	public void setHostNum(int hostNum) {
		this.hostNum = hostNum;
	}


	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public int getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}

	@Override
	public String toString() {
		return "Order [prodName=" + prodName + ", totalPrice=" + totalPrice + ", buyerEmail=" + buyerEmail
				+ ", buyerName=" + buyerName + ", buyerPhone=" + buyerPhone + ", revDate=" + revDate + ", prodNum="
				+ prodNum + ", hostNum=" + hostNum + ", orderDate=" + orderDate + ", orderNum=" + orderNum + "]";
	}


	
	
}
