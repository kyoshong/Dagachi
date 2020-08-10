package dagachi.dao.customer;





import org.mybatis.spring.support.SqlSessionDaoSupport;

import dagachi.dto.CustomerInfoDto;



public class CustomerInfoDao extends SqlSessionDaoSupport{
	

	
	public int add(CustomerInfoDto dto){
		return getSqlSession().insert("customerInfo.insert",dto);
	}
	
	public int update(CustomerInfoDto dto) {
		return getSqlSession().update("customerInfo.update",dto);
	}	
	public int del(CustomerInfoDto dto) {
		return getSqlSession().delete("customerInfo.del",dto);
	}
	public CustomerInfoDto one(int p) {
		return getSqlSession().selectOne("customerInfo.one",p);
	}
	
}
