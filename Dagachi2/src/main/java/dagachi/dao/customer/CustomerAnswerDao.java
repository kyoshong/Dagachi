package dagachi.dao.customer;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import dagachi.dto.CustomerAnswerDto;

public class CustomerAnswerDao extends SqlSessionDaoSupport {
	
	public void insert(CustomerAnswerDto dto) {
		getSqlSession().insert("Customer_Answer.insert", dto);
	}
	
	public void update(CustomerAnswerDto dto) {
		getSqlSession().update("Customer_Answer.update", dto);
	}

	public CustomerAnswerDto getContent(int num) {
		return getSqlSession().selectOne("Customer_Answer.selectOne", num);
	}
	
	public CustomerAnswerDto getContentByQuestionId(int questionId) {
		return getSqlSession().selectOne("Customer_Answer.selectOneByQuestionId", questionId);
	}

	public void delete(int num) {
		getSqlSession().update("Customer_Answer.delete", num);
	}
}
