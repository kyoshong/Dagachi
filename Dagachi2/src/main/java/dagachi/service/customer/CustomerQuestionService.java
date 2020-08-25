package dagachi.service.customer;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dagachi.dao.customer.CustomerQuestionDao;
import dagachi.dto.CustomerQuestionDto;
import dagachi.model.admin.CustomerQuestionList;
import dagachi.service.admin.Paging;


@Service
public class CustomerQuestionService {
	@Autowired
	CustomerQuestionDao dao;

	public void insert(CustomerQuestionDto dto, HttpServletRequest request) {
		dto.setDate_Created(new Timestamp(System.currentTimeMillis()));
		dto.setCustomer_name("test");
		
		dao.insert(dto);
	}
	
	public void update(CustomerQuestionDto dto) {
		dao.update(dto);
	}
	
	public void updateIsAnswered(boolean isAnswered, int questionId) {
		dao.updateIsAnswered(isAnswered, questionId);
	}
	
	public void delete(int num) {
		dao.delete(num);
	}

	public CustomerQuestionDto updateForm(int num) {
		return dao.getContent(num);
	}
	
	public CustomerQuestionList list(int pageNum, int per) {
		int count = dao.count();
		if (count == 0) {
			return new CustomerQuestionList();
		}

		int start = (pageNum - 1) * per;
		List<CustomerQuestionDto> QuestionList = dao.getList(start, per);

		Paging p = new Paging().paging(pageNum, count, per);

		int totalPageCount = p.getTotalPageCount();
		
		return new CustomerQuestionList(QuestionList, pageNum, totalPageCount, start, p, count);
	}

	
	public CustomerQuestionDto getContent(int num){
		return dao.getContent(num);
	}

	public void setDao(CustomerQuestionDao dao) {
		this.dao = dao;
	}
}
