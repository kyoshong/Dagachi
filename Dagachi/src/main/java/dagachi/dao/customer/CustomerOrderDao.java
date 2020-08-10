package dagachi.dao.customer;
import org.mybatis.spring.support.SqlSessionDaoSupport;

import dagachi.dto.CustomerInfoDto;



public class CustomerOrderDao extends SqlSessionDaoSupport {
	
	/*
	 * public List<CustomerOrderDto> bookSales(String bookname){ return
	 * getSqlSession().selectList("bookStore.orderBooks", bookname);
	 * 
	 * } public HashMap<String, Object> customHistory(String name){ return
	 * getSqlSession().selectOne("bookStore.orderHistory", name); }
	 */
	
	public int add(CustomerInfoDto dto){
		return getSqlSession().insert("customerInfo.insert",dto);
	}
	
	public int update(CustomerInfoDto dto) {
		return getSqlSession().update("customerInfo.update",dto);
	}	
	public int del(CustomerInfoDto dto) {
		return getSqlSession().delete("customerInfo.del",dto);
	}
	
	
}
