package dagachi.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter


public class CustomerInfoDto {
	private int  customer_num; 
	private String customer_email;
	private String  customer_name;    
	private String  customer_password;
	private String  customer_gender;
	private String  customer_phoneNumber;
	private Date  customer_birth;
	private Date  customer_Join_Date;
	
}
