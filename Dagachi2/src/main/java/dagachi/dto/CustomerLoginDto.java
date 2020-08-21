package dagachi.dto;

import lombok.*;

@Setter
@Getter 
public class CustomerLoginDto {
	private String customer_Email;
	private String customer_Name;
	private String customer_Password;
}