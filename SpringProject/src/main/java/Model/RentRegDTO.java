package Model;

import java.util.Date;

public class RentRegDTO {
	private String rentalCode;
	private String prdName;
	private int pickupQty;
	private String pickupStation;
	private String pickupDate;
	private String returnDate;
	private String returnStation;
	private int returnedQty;
	private String verifyReturn;
	private String memberId;
	
	public RentRegDTO() {
		
	}
	
	public RentRegDTO(String rentalCode, String prdName, int pickupQty, String pickupStation, String pickupDate,
			String returnDate, String returnStation, int returnedQty, String verifyReturn, String memberId) {
		super();
		this.rentalCode = rentalCode;
		this.prdName = prdName;
		this.pickupQty = pickupQty;
		this.pickupStation = pickupStation;
		this.pickupDate = pickupDate;
		this.returnDate = returnDate;
		this.returnStation = returnStation;
		this.returnedQty = returnedQty;
		this.verifyReturn = verifyReturn;
		this.memberId = memberId;
	}
	
	public String getRentalCode() {
		return rentalCode;
	}
	public String getPrdName() {
		return prdName;
	}
	public int getPickupQty() {
		return pickupQty;
	}
	public String getPickupStation() {
		return pickupStation;
	}
	public String getPickupDate() {
		return pickupDate;
	}
	public String getReturnDate() {
		return returnDate;
	}
	public String getReturnStation() {
		return returnStation;
	}
	public int getReturnedQty() {
		return returnedQty;
	}
	public String getVerifyReturn() {
		return verifyReturn;
	}
	public String getMemberId() {
		return memberId;
	}
	
	public void setRentalCode(String rentalCode) {
		this.rentalCode = rentalCode;
	}
	public void setPrdName(String prdName) {
		this.prdName = prdName;
	}
	public void setPickupQty(int pickupQty) {
		this.pickupQty = pickupQty;
	}
	public void setPickupStation(String pickupStation) {
		this.pickupStation = pickupStation;
	}
	public void setPickupDate(String pickupDate) {
		this.pickupDate = pickupDate;
	}
	public void setReturnDate(String returnDate) {
		this.returnDate = returnDate;
	}
	public void setReturnStation(String returnStation) {
		this.returnStation = returnStation;
	}
	public void setReturnedQty(int returnedQty) {
		this.returnedQty = returnedQty;
	}
	public void setVerifyReturn(String verifyReturn) {
		this.verifyReturn = verifyReturn;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	
}
