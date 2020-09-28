package dagachi.dao.customer;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import dagachi.dto.MenuDto;

public class CustomerRestaurantInfoDaoImpl extends SqlSessionDaoSupport implements CustomerRestaurantInfoDao{
	
	@Override
	public List<MenuDto> selectList(int owner_Num) throws Exception{
		System.out.println("Dao: "+owner_Num);
		return getSqlSession().selectList("customerRestaurantInfo.customerRestaurantDetailList", owner_Num);
	}

	/*
	 * public List<MenuDto> menuList(int owner_Num) throws Exception{
	 * System.out.println("Dao : "+owner_Num); return
	 * getSqlSession().selectOne("customerRestaurantInfo.customerRestaurantMenu",
	 * owner_Num); }
	 */

}
