package dagachi.dto;

import lombok.*;

@Setter
@Getter
public class AdminLoginDto {
	private String admin_Id;
	private String admin_Name;
	private String admin_Password;
}