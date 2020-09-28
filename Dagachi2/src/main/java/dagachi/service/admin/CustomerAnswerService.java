package dagachi.service.admin;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dagachi.dao.customer.CustomerAnswerDao;
import dagachi.dto.CustomerAnswerDto;

@Service
public class CustomerAnswerService {
	@Autowired
	CustomerAnswerDao dao;

	public void insert(CustomerAnswerDto dto, HttpServletRequest request) {
		dto.setCreatedAt(new Timestamp(System.currentTimeMillis()));
		
		dao.insert(dto);
	}
	
	public void update(CustomerAnswerDto dto, HttpServletRequest request) {
		dao.update(dto);
	}
	
	public void delete(int num) {
		dao.delete(num);
	}

	public CustomerAnswerDto getContent(int id) {
		return dao.getContent(id);
	}
	
	public CustomerAnswerDto getContentByQuestionId(int questionId){
		return dao.getContentByQuestionId(questionId);
	}
	
	public void setDao(CustomerAnswerDao dao) {
		this.dao = dao;
	}
}