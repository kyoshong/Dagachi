package dagachi.dao.customer;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import dagachi.dto.CustomerRestaurantSearchDto;
import dagachi.model.board.BoardListModel;
import dagachi.service.board.Search;

public class CustomerRestaurantSearchDaoImpl extends SqlSessionDaoSupport implements CustomerRestaurantSearchDao{
	
	@Override
	public List<CustomerRestaurantSearchDto> list(CustomerRestaurantSearchDto dto) throws Exception{
		return getSqlSession().selectList("customerRestaurantSearch.customerRestaurantList");
	}
	
	public CustomerRestaurantSearchDto listDetail(int owner_Num) throws Exception{
		return getSqlSession().selectOne("customerRestaurantSearch.customerRestaurantDetailList", owner_Num);
	}
	
	public List<CustomerRestaurantSearchDto> listInfo(int owner_Num) throws Exception{
		return getSqlSession().selectList("customerRestaurantSearch.customerRestaurantDetailList", owner_Num);
	}

	public int selectMax() {
		return getSqlSession().selectOne("customerRestaurantSearch.max");
	}
	
	public CustomerRestaurantSearchDto getContent(String restaurant_Num) {
		return getSqlSession().selectOne("customerRestaurantSearch.one",restaurant_Num);
	}
	

	public int count() {
		return getSqlSession().selectOne("customerRestaurantSearch.count");
	}
	
	public List<CustomerRestaurantSearchDto> getList(int start,int per){
		Map<String, Integer> m = new HashMap<String, Integer>();
		m.put("start",start);
		m.put("per",per);
		return getSqlSession().selectList("customerRestaurantSearch.list",m);
	}

	@Override
	public List<CustomerRestaurantSearchDto> listAll(String searchType, String searchType2,String keyword,String select_chk, int range) throws Exception{
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("searchType",searchType);
		map.put("searchType2",searchType2);
		map.put("keyword",keyword);
		map.put("select_chk",select_chk);
		map.put("range",range);
		System.out.println("DAOList :"+map);
		return getSqlSession().selectList("customerRestaurantSearch.restaurantList", map);
		
	}

	@Override
	public int countArticle(String searchType, String searchType2,String keyword,String select_chk, int range) throws Exception{
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("searchType",searchType);
		map.put("searchType2",searchType2);
		map.put("keyword",keyword);
		map.put("select_chk",select_chk);
		map.put("range",range);
		System.out.println("DAOcount"+map);
		return getSqlSession().selectOne("customerRestaurantSearch.restaurantCount", map);
		
	}
	
}
