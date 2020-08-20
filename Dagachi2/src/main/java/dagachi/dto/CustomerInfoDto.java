package dagachi.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString

public class CustomerInfoDto {
	private int  customer_num; 
	private String customer_email;
	private String  customer_name;    
	private String  customer_password;
	private String  customer_gender;
	private String  customer_phoneNumber;
	private Date  customer_birth;
	private Date  customer_Join_Date;
	private int ref;
	private int re_step;
	private int re_level;
	private String review_Pic;
	private String review_Thumb_Pic;
}
