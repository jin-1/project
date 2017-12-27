package Model;

public class BudgetDTO {
	private String budget_code;
	private String member_id;
	private String travel_name;
	private String travel_start_date;
	private String travel_end_date;
	private String travel_are;
	private String expense;
	private String gross_profit;
	public String getBudget_code() {
		return budget_code;
	}
	public void setBudget_code(String budget_code) {
		this.budget_code = budget_code;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getTravel_name() {
		return travel_name;
	}
	public void setTravel_name(String travel_name) {
		this.travel_name = travel_name;
	}
	public String getTravel_start_date() {
		return travel_start_date;
	}
	public void setTravel_start_date(String travel_start_date) {
		this.travel_start_date = travel_start_date;
	}
	public String getTravel_end_date() {
		return travel_end_date;
	}
	public void setTravel_end_date(String travel_end_date) {
		this.travel_end_date = travel_end_date;
	}
	public String getTravel_are() {
		return travel_are;
	}
	public void setTravel_are(String travel_are) {
		this.travel_are = travel_are;
	}
	public String getExpense() {
		return expense;
	}
	public void setExpense(String expense) {
		this.expense = expense;
	}
	public String getGross_profit() {
		return gross_profit;
	}
	public void setGross_profit(String gross_profit) {
		this.gross_profit = gross_profit;
	}
	

}
