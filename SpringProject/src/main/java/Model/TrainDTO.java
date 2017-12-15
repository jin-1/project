package Model;

public class TrainDTO {

	private int trainCode;
	private String serviceDate;
	private String trainName;
	private int trainPrice;
	private String time;
	private String stime;
	private String dtime;
	
	
	public String getStime() {
		return stime;
	}
	public void setStime(String stime) {
		this.stime = stime;
	}
	public String getDtime() {
		return dtime;
	}
	public void setDtime(String dtime) {
		this.dtime = dtime;
	}
	private String stationName;
	public int getTrainCode() {
		return trainCode;
	}
	public void setTrainCode(int trainCode) {
		this.trainCode = trainCode;
	}
	public String getServiceDate() {
		return serviceDate;
	}
	public void setServiceDate(String serviceDate) {
		this.serviceDate = serviceDate;
	}
	public String getTrainName() {
		return trainName;
	}
	public void setTrainName(String trainName) {
		this.trainName = trainName;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getStationName() {
		return stationName;
	}
	public void setStationName(String stationName) {
		this.stationName = stationName;
	}
	public int getTrainPrice() {
		return trainPrice;
	}
	public void setTrainPrice(int trainPrice) {
		this.trainPrice = trainPrice;
	}
	
	
	

	

}
