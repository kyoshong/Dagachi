package dagachi.service.admin;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dagachi.dao.owner.OwnerAnswerDao;
import dagachi.dto.OwnerAnswerDto;

@Service
public class OwnerAnswerService {
	@Autowired
	OwnerAnswerDao dao;

	public void insert(OwnerAnswerDto dto, HttpServletRequest request) {
		dto.setCreatedAt(new Timestamp(System.currentTimeMillis()));

		dao.insert(dto);
	}

	public void update(OwnerAnswerDto dto, HttpServletRequest request) {
		dao.update(dto);
	}

	public void delete(int num) {
		dao.delete(num);
	}

	public OwnerAnswerDto getContent(int id) {
		return dao.getContent(id);
	}

	public OwnerAnswerDto getContentByQuestionId(int questionId) {
		return dao.getContentByQuestionId(questionId);
	}

	public void setDao(OwnerAnswerDao dao) {
		this.dao = dao;
	}
}
