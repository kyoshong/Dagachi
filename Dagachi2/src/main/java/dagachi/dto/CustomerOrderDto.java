package dagachi.dto;

import java.sql.Time;
import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CustomerOrderDto {
	
	private int reserv_num;
	private int customer_num;
	private Date date_of_use;
	private String restaurant_Name;
	private int number_of_people;
	private String customer_phoneNumber;
	private long reserv_Fee;
	private String reserv_Confirm;
	private int owner_num;
	private String restaurant_Pic;
	private String owner_phonenumber;
	private Time time_of_use;
}
