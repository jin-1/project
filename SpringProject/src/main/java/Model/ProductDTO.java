package Model;

public class ProductDTO {
	private String prdName;
	private int prdPrice;
	private String prdCode;
	private String prdImg;
	private String prdType;
	private String prdCategory;
	
	public ProductDTO() {
		
	}
	public ProductDTO(String prdCode, String prdName, int prdPrice, String prdImg, String prdType, String prdCategory) {
		this.prdName = prdName;
		this.prdCode = prdCode;
		this.prdPrice = prdPrice;
		this.prdImg = prdImg;
		this.prdType = prdType;
		this.prdCategory = prdCategory;
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
	public String getPrdType() {
		return prdType;
	}
	public String getPrdCategory() {
		return prdCategory;
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
	public void setPrdType(String prdType) {
		this.prdType = prdType;
	}
	public void setPrdCategory(String prdCategory) {
		this.prdCategory = prdCategory;
	}

}
