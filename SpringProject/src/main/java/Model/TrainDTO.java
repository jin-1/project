package Model;

import java.util.List;

public class TrainDTO {

	private int trainCode;
	private String departingStation;
	private String arrivalStation;
	private int carriageNum;
	private String serviceDate;
	private String trainName;
	private String startTime;
	private String endTime;
	private int trainPrice;
	private String time;
	private String stime;
	private String dtime;
	private String[] temp;

	public String[] getTemp() {
		return temp;
	}

	public void setTemp(String[] temp) {
		this.temp = temp;
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

	public int getCarriageNum() {
		return carriageNum;
	}

	public void setCarriageNum(int carriageNum) {
		this.carriageNum = carriageNum;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

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
