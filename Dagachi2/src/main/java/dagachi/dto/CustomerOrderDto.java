package dagachi.dto;




import java.sql.Date;
import java.sql.Time;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
public class CustomerOrderDto {
   
   private int reserv_num;
   private int customer_num;
   private Date date_of_use;
   private String restaurant_name;
   private int number_of_people;
   private String customer_phoneNumber;
   private long reserv_fee;
   private String reserv_confirm;
   private int owner_num;
   private String restaurant_pic;
   private String owner_phonenumber;
   private Time time_of_use;
	
}
