package Model;

public class ProductDTO {
	private String prdName;
	private int prdPrice;
	private String prdCode;
	private String prdImg;
	
	public ProductDTO() {
		
	}
	public ProductDTO(String prdCode, String prdName, int prdPrice, String prdImg) {
		this.prdName = prdName;
		this.prdCode = prdCode;
		this.prdPrice = prdPrice;
		this.prdImg = prdImg;
	}
	public String getPrdName() {
		return prdName;
	}
	public int getPrdPrice() {
		return prdPrice;
	}
	public String getPrdCode() {
		return prdCode;
	}
	public String getPrdImg() {
		return prdImg;
	}

	public void setPrdName(String prdName) {
		this.prdName = prdName;
	}
	public void setPrdPrice(int prdPrice) {
		this.prdPrice = prdPrice;
	}
	public void setPrdCode(String prdCode) {
		this.prdCode = prdCode;
	}
	public void setPrdImg(String prdImg) {
		this.prdImg = prdImg;
	}

}
