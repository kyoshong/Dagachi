package dagachi.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString

public class OwnerLoginDto {
	 private int owner_num;
	 private String restaurant_Num;     
	  private String owner_name;     
	  private String owner_email;   
	  private String owner_password;
	  private String owner_phonenumber;
	  private String restaurant_Address;
	  private String owner_SecurityNum;
	  private String restaurant_Name;
	  private String owner_Join_Date;
}
