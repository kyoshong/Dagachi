package dagachi.dao.customer;





import org.mybatis.spring.support.SqlSessionDaoSupport;

import dagachi.dto.CustomerInfoDto;



public class CustomerInfoDao extends SqlSessionDaoSupport{
	
	public String password(int num) {
		return getSqlSession().selectOne("customerInfo.password",num);
	}

	
	public int add(CustomerInfoDto dto){
		return getSqlSession().insert("customerInfo.insert",dto);
	}
	
	public int update(CustomerInfoDto dto) {
		return getSqlSession().update("customerInfo.update",dto);
	}	
	public int del(int num) {
		return getSqlSession().delete("customerInfo.del",num);
	}
	public CustomerInfoDto one(int p) {
		return getSqlSession().selectOne("customerInfo.one",p);
	}
	
}
