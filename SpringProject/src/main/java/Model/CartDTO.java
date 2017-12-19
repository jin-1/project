package Model;

public class CartDTO {
	private String prdCode;
	private String prdName;
	private int price;
	private int qty;
	private String eventCode;
	
	public String getPrdCode() {
		return prdCode;
	}
	public String getPrdName() {
		return prdName;
	}
	public int getPrice() {
		return price;
	}
	public int getQty() {
		return qty;
	}
	public String getEventCode() {
		return eventCode;
	}
	
	public void setPrdCode(String prdCode) {
		this.prdCode = prdCode;
	}
	public void setPrdName(String prdName) {
		this.prdName = prdName;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public void setEventCode(String eventCode) {
		this.eventCode = eventCode;
	}
}
