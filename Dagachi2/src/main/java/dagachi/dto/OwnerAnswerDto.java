package dagachi.dto;

import java.sql.Timestamp;

public class OwnerAnswerDto {


	private int id;
	private String title;
	private String content;
	private Timestamp createdAt;
	private int Owner_Question_id;

	public OwnerAnswerDto() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}

	public int getOwner_Question_id() {
		return Owner_Question_id;
	}

	public void setOwner_Question_id(int owner_Question_id) {
		Owner_Question_id = owner_Question_id;
	}

}
