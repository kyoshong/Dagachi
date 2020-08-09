package dao.admin;

import dto.ReviewDto;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;


public class AdminReviewDao extends SqlSessionDaoSupport{
	
	public List<ReviewDto> getList(int start,int per){
		Map<String, Integer> m = new HashMap<String, Integer>();
		m.put("start",start);
		m.put("per",per);
		return getSqlSession().selectList("review.all");
	}
	
	public void delete(int num) {
		 getSqlSession().delete("review.delete",num);
	}
	public ReviewDto customerOne(int num) {
		return getSqlSession().selectOne("review.one",num);
	}
	public ReviewDto ownerOne(int num) {
		return getSqlSession().selectOne("review.ownerOne",num);
	}
	public ReviewDto one(int num) {
		return getSqlSession().selectOne("review.ownerOne",num);
	}

	public int count() {
		return getSqlSession().selectOne("review.count");	
	}
	
}
