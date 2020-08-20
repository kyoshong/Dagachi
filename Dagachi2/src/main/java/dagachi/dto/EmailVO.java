package dagachi.dto;

import lombok.Getter;
import lombok.Setter;
@Setter
@Getter
public class EmailVO {
	
	private String subject;
	private String content;
	private String date;
	private String receiver;
	private int certiNum;
}
