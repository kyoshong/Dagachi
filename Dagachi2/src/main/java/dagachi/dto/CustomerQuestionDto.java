package dagachi.dto;

import java.sql.Timestamp;

public class CustomerQuestionDto {

	private int Customer_writeNo;
	private String Customer_writeTitle;
	private String Customer_content;
	private String Customer_name;
	private Timestamp Date_Created;
	private int Customer_num;
	private boolean isAnswered;
	
	public CustomerQuestionDto() {}
	
	public int getCustomer_writeNo() {
		return Customer_writeNo;
	}
	public void setCustomer_writeNo(int customer_writeNo) {
		Customer_writeNo = customer_writeNo;
	}
	public String getCustomer_writeTitle() {
		return Customer_writeTitle;
	}
	public void setCustomer_writeTitle(String customer_writeTitle) {
		Customer_writeTitle = customer_writeTitle;
	}
	public String getCustomer_content() {
		return Customer_content;
	}
	public void setCustomer_content(String customer_content) {
		Customer_content = customer_content;
	}
	public String getCustomer_name() {
		return Customer_name;
	}
	public void setCustomer_name(String customer_name) {
		Customer_name = customer_name;
	}
	public Timestamp getDate_Created() {
		return Date_Created;
	}
	public void setDate_Created(Timestamp date_Created) {
		Date_Created = date_Created;
	}
	public int getCustomer_num() {
		return Customer_num;
	}
	public void setCustomer_num(int customer_num) {
		Customer_num = customer_num;
	}
	public boolean getIsAnswered() {
		return isAnswered;
	}
	public void setIsAnswered(boolean isAnswered) {
		this.isAnswered = isAnswered;
	}

	
}