package dagachi.dao.customer;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import dagachi.dto.CustomerHeartDto;

public class CustomerHeartDao extends SqlSessionDaoSupport{

	
	public void add(CustomerHeartDto dto){
		getSqlSession().insert("customerHeart.insert",dto);
	}
	
	public List<CustomerHeartDto> list(int num) {
		return getSqlSession().selectList("customerHeart.list",num);
	}	
	public void delete(int num) {
		getSqlSession().delete("customerHeart.delete",num);
	}
	
}
