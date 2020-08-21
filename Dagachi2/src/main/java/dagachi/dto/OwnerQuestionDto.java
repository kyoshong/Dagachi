package dagachi.dto;

import lombok.*;

@Setter
@Getter
public class OwnerQuestionDto {
	private int owner_WriteNo;
	private String owner_WriteTitle;
	private String owner_Name;
	private String date_Created;
	private String owner_Content;
	private int owner_Num;
}