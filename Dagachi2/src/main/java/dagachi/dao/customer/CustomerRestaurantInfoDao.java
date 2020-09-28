package dagachi.dao.customer;

import java.util.List;

import dagachi.dto.MenuDto;

public interface CustomerRestaurantInfoDao {
	
	public List<MenuDto> selectList(int owner_Num) throws Exception;

}
