package dagachi.service.customer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dagachi.dao.customer.CustomerRestaurantInfoDaoImpl;
import dagachi.dto.MenuDto;

@Service("CustomerRestaurantInfoServiceImpl")
public class CustomerRestaurantInfoServiceImpl implements CustomerRestaurantInfoService {
	
	@Autowired
	private CustomerRestaurantInfoDaoImpl crid;
	
	@Override
	public List<MenuDto> selectList(int owner_Num) throws Exception{
		List<MenuDto> list = null;
		list = crid.selectList(owner_Num);
		System.out.println("Service selectList: "+list);
		return list;
	}
	
	/*
	 * public List<MenuDto> menuList(int owner_Num) throws Exception{ return
	 * crid.menuList(owner_Num); }
	 */
}
