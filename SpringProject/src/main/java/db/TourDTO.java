package db;

public class TourDTO {
	private String localCode;
	private String corpID;
	private String localName;
	private String localPhone;
	private String localAddr;
	private String localCategory;
	private String localContent;
	private int requestStauts;
	private String travelCoord;
	
	public String getLocalCode() {
		return localCode;
	}
	public void setLocalCode(String localCode) {
		this.localCode = localCode;
	}
	public String getCorpID() {
		return corpID;
	}
	public void setCorpID(String corpID) {
		this.corpID = corpID;
	}
	public String getLocalName() {
		return localName;
	}
	public void setLocalName(String localName) {
		this.localName = localName;
	}
	public String getLocalPhone() {
		return localPhone;
	}
	public void setLocalPhone(String localPhone) {
		this.localPhone = localPhone;
	}
	public String getLocalAddr() {
		return localAddr;
	}
	public void setLocalAddr(String localAddr) {
		this.localAddr = localAddr;
	}
	public String getLocalCategory() {
		return localCategory;
	}
	public void setLocalCategory(String localCategory) {
		this.localCategory = localCategory;
	}
	public String getLocalContent() {
		return localContent;
	}
	public void setLocalContent(String localContent) {
		this.localContent = localContent;
	}
	public int getRequestStauts() {
		return requestStauts;
	}
	public void setRequestStauts(int requestStauts) {
		this.requestStauts = requestStauts;
	}
	public String getTravelCoord() {
		return travelCoord;
	}
	public void setTravelCoord(String travelCoord) {
		this.travelCoord = travelCoord;
	}
}
