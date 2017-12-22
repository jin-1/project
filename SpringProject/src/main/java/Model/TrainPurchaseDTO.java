package Model;

import java.util.Date;

public class TrainPurchaseDTO {
	private String trainPurchaseCode;
	private String trainRegCode;
	private int trainCode;
	private int invoice;
	private int trainRefund;
	private String memberId;
	private String trainPubDate;
	
	
	public String getTrainPubDate() {
		return trainPubDate;
	}
	public void setTrainPubDate(String trainPubDate) {
		this.trainPubDate = trainPubDate;
	}
	public String getTrainPurchaseCode() {
		return trainPurchaseCode;
	}
	public void setTrainPurchaseCode(String trainPurchaseCode) {
		this.trainPurchaseCode = trainPurchaseCode;
	}
	public String getTrainRegCode() {
		return trainRegCode;
	}
	public void setTrainRegCode(String trainRegCode) {
		this.trainRegCode = trainRegCode;
	}
	public int getTrainCode() {
		return trainCode;
	}
	public void setTrainCode(int trainCode) {
		this.trainCode = trainCode;
	}
	public int getInvoice() {
		return invoice;
	}
	public void setInvoice(int invoice) {
		this.invoice = invoice;
	}
	public int getTrainRefund() {
		return trainRefund;
	}
	public void setTrainRefund(int trainRefund) {
		this.trainRefund = trainRefund;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	
	
}
