package dagachi.dao.customer;





import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import dagachi.dto.CustomerInfoDto;



public class CustomerInfoDao extends SqlSessionDaoSupport{
	
	public String password(int num) {
		return getSqlSession().selectOne("customerInfo.password",num);
	}
	public int add(CustomerInfoDto dto){
		return getSqlSession().insert("customerInfo.insert",dto);
	}
	
	public void update(HashMap<String, Object> map) {
		 getSqlSession().update("customerInfo.update",map);
	}	
	public void delete(int num) {
		getSqlSession().delete("customerInfo.delete",num);
	}
	public CustomerInfoDto one(int p) {
		return getSqlSession().selectOne("customerInfo.one",p);
	}
	
}
