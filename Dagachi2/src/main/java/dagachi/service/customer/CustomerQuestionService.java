package dagachi.service.customer;

import java.util.List;

import dagachi.dto.CustomerQuestionDto;

public interface CustomerQuestionService {

	// 게시물 목록
	public List<CustomerQuestionDto> list() throws Exception;

	// 게시물 작성
	public void write(CustomerQuestionDto vo) throws Exception;

	// 게시물 조회
	public CustomerQuestionDto view(int customer_WriteNo) throws Exception;

	// 게시물 수정
	public void modify(CustomerQuestionDto dto) throws Exception;

	// 게시물 삭제
	public void delete(int customer_WriteNo) throws Exception;

	// 게시물 총 갯수
	public int count() throws Exception;

	// 게시물 목록 + 페이징
	public List<CustomerQuestionDto> listPage(int displayPost, int postNum) throws Exception;

}