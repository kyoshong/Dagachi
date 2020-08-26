package dagachi.dao.customer;


import java.util.*;
import org.mybatis.spring.support.SqlSessionDaoSupport;

import dagachi.dto.CustomerQuestionDto;

public class CustomerQuestionDao extends SqlSessionDaoSupport {

	public void insert(CustomerQuestionDto dto) {
		getSqlSession().insert("Customer_Question_board.insert", dto);
	}
	
	public void update(CustomerQuestionDto dto) {
		getSqlSession().update("Customer_Question_board.update", dto);
	}
	
	public void updateIsAnswered(boolean isAnswered, int questionId) {
		Map<String, Integer> m = new HashMap<String, Integer>();
		m.put("isAnswered", isAnswered?1:0);
		m.put("questionId", questionId);
		getSqlSession().update("Customer_Question_board.updateIsAnswered", m);
	}

	public Integer selectMax() {
		return getSqlSession().selectOne("Customer_Question_board.max");
	}

	public CustomerQuestionDto getContent(int num) {
		return getSqlSession().selectOne("Customer_Question_board.selectOne", num);
	}

	public int count() {
		return getSqlSession().selectOne("Customer_Question_board.count");
	}

	public List<CustomerQuestionDto> getList(int start, int per) {
		Map<String, Integer> m = new HashMap<String, Integer>();
		m.put("start", start);
		m.put("per", per);
		return getSqlSession().selectList("Customer_Question_board.list", m);
	}

	public void delete(int num) {
		getSqlSession().update("Customer_Question_board.delete", num);

	}
}
