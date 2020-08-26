package dagachi.dao.admin;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import dagachi.dto.OwnerAnswerDto;

public class OwnerAnswerDao extends SqlSessionDaoSupport {

	public void insert(OwnerAnswerDto dto) {
		getSqlSession().insert("Owner_Answer.insert", dto);
	}

	public void update(OwnerAnswerDto dto) {
		getSqlSession().update("Owner_Answer.update", dto);
	}

	public OwnerAnswerDto getContent(int num) {
		return getSqlSession().selectOne("Owner_Answer.selectOne", num);
	}

	public OwnerAnswerDto getContentByQuestionId(int questionId) {
		return getSqlSession().selectOne("Owner_Answer.selectOneByQuestionId", questionId);
	}

	public void delete(int num) {
		getSqlSession().update("Owner_Answer.delete", num);
	}
}
