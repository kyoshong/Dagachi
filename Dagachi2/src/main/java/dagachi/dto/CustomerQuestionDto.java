package dagachi.dto;

import lombok.*;

@Setter 
@Getter
public class CustomerQuestionDto {

	private int customer_WriteNo;
	private String customer_WriteTitle;
	private String customer_Name;
	private String date_Created;
	private String customer_Content;
	private int customer_Num;
}