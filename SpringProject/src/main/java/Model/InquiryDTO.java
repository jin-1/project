package Model;

public class InquiryDTO {
	private int inquiryNum;
	private String inquiryTitle;
	private String inquiryContent;
	private String inquiryDate;
	private String inquiryReply;
	private String memberId;
	private String corporId;
	private int inquiryReplyNum;
	private int peplyNum;

	public int getPeplyNum() {
		return peplyNum;
	}
	public void setPeplyNum(int peplyNum) {
		this.peplyNum = peplyNum;
	}
	public int getInquiryReplyNum() {
		return inquiryReplyNum;
	}
	public void setInquiryReplyNum(int inquiryReplyNum) {
		this.inquiryReplyNum = inquiryReplyNum;
	}

	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getInquiryNum() {
		return inquiryNum;
	}
	public void setInquiryNum(int inquiryNum) {
		this.inquiryNum = inquiryNum;
	}
	public String getInquiryTitle() {
		return inquiryTitle;
	}
	public void setInquiryTitle(String inquiryTitle) {
		this.inquiryTitle = inquiryTitle;
	}
	public String getInquiryContent() {
		return inquiryContent;
	}
	public void setInquiryContent(String inquiryContent) {
		this.inquiryContent = inquiryContent;
	}
	public String getInquiryDate() {
		return inquiryDate;
	}
	public void setInquiryDate(String inquiryDate) {
		this.inquiryDate = inquiryDate;
	}
	public String getInquiryReply() {
		return inquiryReply;
	}
	public void setInquiryReply(String inquiryReply) {
		this.inquiryReply = inquiryReply;
	}
	public String getCorporId() {
		return corporId;
	}
	public void setCorporId(String corporId) {
		this.corporId = corporId;
	}
	
	
}
