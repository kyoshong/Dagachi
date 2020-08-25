package dagachi.service.owner;

import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dagachi.dao.owner.OwnerQuestionDao;
import dagachi.dto.OwnerQuestionDto;
import dagachi.model.admin.OwnerQuestionList;
import dagachi.service.admin.Paging;

@Service
public class OwnerQuestionService {

	@Autowired
	OwnerQuestionDao dao;

	public void insert(OwnerQuestionDto dto, HttpServletRequest request) {
		dto.setDate_Created(new Timestamp(System.currentTimeMillis()));
		dto.setOwner_name("test");
		
		dao.insert(dto);
	}
	
	public void update(OwnerQuestionDto dto) {
		dao.update(dto);
	}
	
	public void updateIsAnswered(boolean isAnswered, int questionId) {
		dao.updateIsAnswered(isAnswered, questionId);
	}
	
	public void delete(int num) {
		dao.delete(num);
	}

	public OwnerQuestionDto updateForm(int num) {
		return dao.getContent(num);
	}
	
	public OwnerQuestionList list(int pageNum, int per) {
		int count = dao.count();
		if (count == 0) {
			return new OwnerQuestionList();
		}

		int start = (pageNum - 1) * per;
		List<OwnerQuestionDto> QuestionList = dao.getList(start, per);

		Paging p = new Paging().paging(pageNum, count, per);

		int totalPageCount = p.getTotalPageCount();
		
		return new OwnerQuestionList(QuestionList, pageNum, totalPageCount, start, p, count);
	}

	
	public OwnerQuestionDto getContent(int num){
		return dao.getContent(num);
	}

	public void setDao(OwnerQuestionDao dao) {
		this.dao = dao;
	}
}