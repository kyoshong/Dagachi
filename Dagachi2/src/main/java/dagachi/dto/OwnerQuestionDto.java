package dagachi.dto;

import java.sql.Timestamp;

public class OwnerQuestionDto {

	private int Owner_writeNo;
	private String Owner_writeTitle;
	private String Owner_content;
	private String Owner_name;
	private Timestamp Date_Created;
	private int Owner_num;
	private boolean isAnswered;

	public OwnerQuestionDto() {
	}

	public int getOwner_writeNo() {
		return Owner_writeNo;
	}

	public void setOwner_writeNo(int owner_writeNo) {
		Owner_writeNo = owner_writeNo;
	}

	public String getOwner_writeTitle() {
		return Owner_writeTitle;
	}

	public void setOwner_writeTitle(String owner_writeTitle) {
		Owner_writeTitle = owner_writeTitle;
	}

	public String getOwner_content() {
		return Owner_content;
	}

	public void setOwner_content(String owner_content) {
		Owner_content = owner_content;
	}

	public String getOwner_name() {
		return Owner_name;
	}

	public void setOwner_name(String owner_name) {
		Owner_name = owner_name;
	}

	public Timestamp getDate_Created() {
		return Date_Created;
	}

	public void setDate_Created(Timestamp date_Created) {
		Date_Created = date_Created;
	}

	public int getOwner_num() {
		return Owner_num;
	}

	public void setOwner_num(int owner_num) {
		Owner_num = owner_num;
	}

	public boolean getIsAnswered() {
		return isAnswered;
	}

	public void setIsAnswered(boolean isAnswered) {
		this.isAnswered = isAnswered;
	}

}