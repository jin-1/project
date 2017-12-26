package Model;

public class TrainRegistrationDTO {
	private String trainRegCode;
	private int trainCode;
	private String seatNum;
	private String memberId;
	private String departingStation;
	private String arrivalStation;
	private String trainDate;
	private String trainPassengers;
	private String price;
	private TrainPurchaseDTO trainPurchaseDTO;
	private TrainStationTimeDTO trainStationTimeDTO;



	public TrainStationTimeDTO getTrainStationTimeDTO() {
		return trainStationTimeDTO;
	}

	public void setTrainStationTimeDTO(TrainStationTimeDTO trainStationTimeDTO) {
		this.trainStationTimeDTO = trainStationTimeDTO;
	}

	public TrainPurchaseDTO getTrainPurchaseDTO() {
		return trainPurchaseDTO;
	}

	public void setTrainPurchaseDTO(TrainPurchaseDTO trainPurchaseDTO) {
		this.trainPurchaseDTO = trainPurchaseDTO;
	}

	public String getTrainPassengers() {
		return trainPassengers;
	}

	public void setTrainPassengers(String trainPassengers) {
		this.trainPassengers = trainPassengers;
	}

	public String getTrainRegCode() {
		return trainRegCode;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
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

	public String getSeatNum() {
		return seatNum;
	}

	public void setSeatNum(String seatNum) {
		this.seatNum = seatNum;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getDepartingStation() {
		return departingStation;
	}

	public void setDepartingStation(String departingStation) {
		this.departingStation = departingStation;
	}

	public String getArrivalStation() {
		return arrivalStation;
	}

	public void setArrivalStation(String arrivalStation) {
		this.arrivalStation = arrivalStation;
	}

	public String getTrainDate() {
		return trainDate;
	}

	public void setTrainDate(String trainDate) {
		this.trainDate = trainDate;
	}

}
