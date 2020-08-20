package dagachi.dao.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import dagachi.dto.CustomerInfoDto;


public class AdminCustomerInfoDao  extends SqlSessionDaoSupport {

	public List<CustomerInfoDto> getList(int start,int per){
		Map<String, Integer> m = new HashMap<String, Integer>();
		m.put("start",start);
		m.put("per",per);
		return getSqlSession().selectList("customerInfo.list",m);
	}
	public List<CustomerInfoDto> search(int start, int per, String searchType, String keyword) throws Exception {
		  HashMap<String, Object> data = new HashMap<String, Object>();
		  
		  data.put("start", start);
		  data.put("per", per);
		  
		  data.put("searchType", searchType);
		  data.put("keyword", keyword);


		  return getSqlSession().selectList("customerInfo.search", data);}
	
	public int update(String dto) {
		return getSqlSession().update("customerInfo.update",dto);
	}	
	
	public int searchCount(String searchType, String keyword) throws Exception
	{
		 HashMap<String, Object> data = new HashMap<String, Object>();
		 
		 data.put("searchType", searchType);
		 data.put("keyword", keyword);
	
		 
		 return getSqlSession().selectOne("customerInfo.searchCount", data);
	}
	public void delete(int num) {
		getSqlSession().delete("customerInfo.delete",num);
	}
	public CustomerInfoDto one(int num) {
		return getSqlSession().selectOne("customerInfo.one",num);
	}
	public int count() {
		return getSqlSession().selectOne("customerInfo.count");	
	}
	
}
