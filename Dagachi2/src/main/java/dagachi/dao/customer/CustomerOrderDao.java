package dagachi.dao.customer;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import dagachi.dto.CustomerInfoDto;
import dagachi.dto.CustomerOrderDto;



public class CustomerOrderDao extends SqlSessionDaoSupport {
	
	
	
	public int add(CustomerOrderDto dto){
		return getSqlSession().insert("customerOrder.insert",dto);
	}
	
	public int update(CustomerOrderDto dto) {
		return getSqlSession().update("customerOrder.update",dto);
	}	
	public List<CustomerOrderDto> list(int num) {
		return getSqlSession().selectList("customerOrder.list",num);
	}
	public int delete(int num) {
		return getSqlSession().delete("customerOrder.delete",num);
	}
	
}
