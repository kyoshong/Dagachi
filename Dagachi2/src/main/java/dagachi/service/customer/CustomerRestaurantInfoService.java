package dagachi.service.customer;

import java.util.List;

import dagachi.dto.MenuDto;

public interface CustomerRestaurantInfoService {
	
	public List<MenuDto> selectList(int owner_Num) throws Exception;

}
