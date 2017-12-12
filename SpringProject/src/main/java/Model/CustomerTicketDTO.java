package Model;

public class CustomerTicketDTO {
	
	private String startTrain;
	private String endTrain;
	private String dateTrain;
	private String[] trainType;
	private int adults;
	private int child;
	private int old;
	
	
	public String getStartTrain() {
		return startTrain;
	}
	public void setStartTrain(String startTrain) {
		this.startTrain = startTrain;
	}
	public String getEndTrain() {
		return endTrain;
	}
	public void setEndTrain(String endTrain) {
		this.endTrain = endTrain;
	}
	public String getDateTrain() {
		return dateTrain;
	}
	public void setDateTrain(String dateTrain) {
		this.dateTrain = dateTrain;
	}
	public String[] getTrainType() {
		return trainType;
	}
	public void setTrainType(String[] trainType) {
		this.trainType = trainType;
	}
	public int getAdults() {
		return adults;
	}
	public void setAdults(int adults) {
		this.adults = adults;
	}
	public int getChild() {
		return child;
	}
	public void setChild(int child) {
		this.child = child;
	}
	public int getOld() {
		return old;
	}
	public void setOld(int old) {
		this.old = old;
	}
	
	
}
