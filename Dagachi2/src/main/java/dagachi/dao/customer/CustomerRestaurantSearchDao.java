package dagachi.dao.customer;

import java.util.List;

import dagachi.dto.CustomerRestaurantSearchDto;
import dagachi.service.board.Search;

public interface CustomerRestaurantSearchDao {
	
	public List<CustomerRestaurantSearchDto> list(CustomerRestaurantSearchDto dto) throws Exception;
	
	public List<CustomerRestaurantSearchDto> listAll(String searchType, String searchType2,String keyword,String select_chk, int range) throws Exception;
	
	public int countArticle(String searchType, String searchType2,String keyword,String select_chk, int range) throws Exception;


}
