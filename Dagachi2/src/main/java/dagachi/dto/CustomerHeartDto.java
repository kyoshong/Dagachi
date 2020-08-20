package dagachi.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
@ToString
@Getter
@Setter
public class CustomerHeartDto {
	private int customer_num;
	private int owner_num;
	private String restaurant_Name;
	private String restaurant_Pic;

}
