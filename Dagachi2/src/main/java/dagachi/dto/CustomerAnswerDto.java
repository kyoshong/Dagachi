package dagachi.dto;

import java.sql.Timestamp;

public class CustomerAnswerDto {
	
	private int id;
	private String title;
	private String content;
	private Timestamp createdAt;
	private int Customer_Question_id;
	
	public CustomerAnswerDto() {}

	public int getId() {
		return id;
	}

	public void setId(int _id) {
		id = _id;
	}

	public String getTitle() {
		return title;
	}
	
	public void setTitle(String _title) {
		title = _title;
	}
	
	public String getContent() {
		return content;
	}
	
	public void setContent(String _content) {
		content = _content;
	}
	
	public Timestamp getCreatedAt() {
		return createdAt;
	}
	
	public void setCreatedAt(Timestamp _createdAt) {
		createdAt = _createdAt;
	}

	public int getCustomer_Question_id() {
		return Customer_Question_id;
	}

	public void setCustomer_Question_id(int _id) {
		Customer_Question_id = _id;
	}
}