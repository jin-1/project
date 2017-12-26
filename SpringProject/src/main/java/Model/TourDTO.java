package Model;

import java.io.Serializable;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

@SuppressWarnings("serial")
public class TourDTO implements Serializable{
	private int localCode;
	private String corpId;
	private String localName;
	private String localPhone;
	private String localAddr;
	private String localCategory;
	private String[] localCategorySave;
	private String localContent;
	private int requestStatus;
	private String travelCoord;
	//private String localImage;
	private String localImage;
	private MultipartFile localImageSave;
	private String registrationNum;
	
	public int getLocalCode() {
		return localCode;
	}
	public void setLocalCode(int localCode) {
		this.localCode = localCode;
	}
	public String getCorpId() {
		return corpId;
	}
	public void setCorpId(String corpId) {
		this.corpId = corpId;
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
	public String[] getLocalCategorySave() {
		return localCategorySave;
	}
	public void setLocalCategorySave(String[] localCategorySave) {
		this.localCategorySave = localCategorySave;
	}
	/*public void setLocalCategory(String localCategory) {
		this.localCategory = localCategory;
	}*/
	public String getLocalContent() {
		
		return localContent;
	}
	public void setLocalContent(String localContent) {
		this.localContent = localContent;
	}
	public int getRequestStatus() {
		return requestStatus;
	}
	public void setRequestStatus(int requestStatus) {
		this.requestStatus = requestStatus;
	}
	public String getTravelCoord() {
		return travelCoord;
	}
	public void setTravelCoord(String travelCoord) {
		this.travelCoord = travelCoord;
	}
	/*public String getLocalImage() {
		return localImage;
	}
	public void setLocalImage(String localImage) {
		this.localImage = localImage;
	}*/
	public String getLocalImage() {
		return localImage;
	}
	public void setLocalImage(String localImage) {
		this.localImage = localImage;
	}
	public MultipartFile getLocalImageSave() {
		return localImageSave;
	}
	public void setLocalImageSave(MultipartFile localImageSave) {
		this.localImageSave = localImageSave;
	}
	public String getRegistrationNum() {
		return registrationNum;
	}
	public void setRegistrationNum(String registrationNum) {
		this.registrationNum = registrationNum;
	}
}
