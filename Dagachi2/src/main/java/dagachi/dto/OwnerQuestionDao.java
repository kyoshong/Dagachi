package dagachi.dao.owner;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import dagachi.dto.OwnerQuestionDto;;

public class OwnerQuestionDao extends SqlSessionDaoSupport {

	public void insert(OwnerQuestionDto dto) {
		getSqlSession().insert("Owner_Question_board.insert", dto);
	}

	public void update(OwnerQuestionDto dto) {
		getSqlSession().update("Owner_Question_board.update", dto);
	}

	public void updateIsAnswered(boolean isAnswered, int questionId) {
		Map<String, Integer> m = new HashMap<String, Integer>();
		m.put("isAnswered", isAnswered ? 1 : 0);
		m.put("questionId", questionId);
		getSqlSession().update("Owner_Question_board.updateIsAnswered", m);
	}

	public Integer selectMax() {
		return getSqlSession().selectOne("Owner_Question_board.max");
	}

	public OwnerQuestionDto getContent(int num) {
		return getSqlSession().selectOne("Owner_Question_board.selectOne", num);
	}

	public int count() {
		return getSqlSession().selectOne("Owner_Question_board.count");
	}

	public List<OwnerQuestionDto> getList(int start, int per) {
		Map<String, Integer> m = new HashMap<String, Integer>();
		m.put("start", start);
		m.put("per", per);
		return getSqlSession().selectList("Owner_Question_board.list", m);
	}

	public void delete(int num) {
		getSqlSession().update("Owner_Question_board.delete", num);

	}
}