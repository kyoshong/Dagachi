package dagachi.dto;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class RestaurantMapDto {
	private int  owner_num;
	private Float lat;
	private Float lng;       
	private String restaurant_Name;
}
