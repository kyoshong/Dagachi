package dagachi.dao.admin;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import dagachi.dto.CustomerInfoDto;
import dagachi.dto.ReviewDto;


public class AdminReviewDao extends SqlSessionDaoSupport{
	
	public List<ReviewDto> getList(int start,int per){
		Map<String, Integer> m = new HashMap<String, Integer>();
		m.put("start",start);
		m.put("per",per);
		return getSqlSession().selectList("review.list",m);
	}
	public List<ReviewDto> search(int start, int per, String searchType, String keyword) throws Exception {
		  HashMap<String, Object> data = new HashMap<String, Object>();
		  
		  data.put("start", start);
		  data.put("per", per);
		  
		  data.put("searchType", searchType);
		  data.put("keyword", keyword);
		

		  return getSqlSession().selectList("review.search", data);}
	public int searchCount(String searchType, String keyword) throws Exception
	{
		 HashMap<String, Object> data = new HashMap<String, Object>();
		 
		 data.put("searchType", searchType);
		 data.put("keyword", keyword);
	
		 
		 return getSqlSession().selectOne("review.searchCount", data);
	}
	public void delete(int num) {
		 getSqlSession().delete("review.delete",num);
	}
	public ReviewDto customerOne(int num) {
		return getSqlSession().selectOne("review.customerOne",num);
	}
	public ReviewDto ownerOne(int num) {
		return getSqlSession().selectOne("review.ownerOne",num);
	}
	public ReviewDto one(int num) {
		return getSqlSession().selectOne("review.one",num);
	}

	public int count() {
		return getSqlSession().selectOne("review.count");	
	}
	
}

