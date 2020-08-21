package dagachi.dto;

import lombok.*;

@Getter
@Setter 
public class AdminSignUpDto {
	private int admin_Num;
	private String admin_Name;
	private String admin_Id;
	private String admin_Password;
	private String admin_Email;
	private String admin_PhoneNumber;
	private String dept;
	private String admin_Author;
}