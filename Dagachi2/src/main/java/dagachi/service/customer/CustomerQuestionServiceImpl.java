package dagachi.service.customer;

import java.util.List;
import javax.inject.Inject;

import org.springframework.stereotype.Component;

import dagachi.dao.customer.CustomerQuestionDao;
import dagachi.dto.CustomerQuestionDto;

@Component
public class CustomerQuestionServiceImpl implements CustomerQuestionService {

	@Inject
	private CustomerQuestionDao dao;

	// 게시물 목록
	public List<CustomerQuestionDto> list() throws Exception {
		return dao.list();
	}

	// 게시물 작성
	@Override
	public void write(CustomerQuestionDto vo) throws Exception {

		dao.write(vo);
	}

	// 게시물 조회
	@Override
	public CustomerQuestionDto view(int customer_WriteNo) throws Exception {

		return dao.view(customer_WriteNo);
	}

	// 게시물 수정
	@Override
	public void modify(CustomerQuestionDto dto) throws Exception {

		dao.modify(dto);
	}

	// 게시물 삭제
	public void delete(int customer_WriteNo) throws Exception {
		dao.delete(customer_WriteNo);
	}

	// 게시물 총 갯수
	@Override
	public int count() throws Exception {
		return dao.count();
	}

	// 게시물 목록 + 페이징
	@Override
	public List<CustomerQuestionDto> listPage(int displayPost, int postNum) throws Exception {
		return dao.listPage(displayPost, postNum);
	}

}