package dagachi.dao.customer;

import java.util.*;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import dagachi.dto.CustomerQuestionDto;

@Repository
public class CustomerQuestionDaoImpl implements CustomerQuestionDao {

	@Inject
	private SqlSession sql;

	private static String namespace = "Cquestion";

	//게시물 목록
	@Override
	public List<CustomerQuestionDto> list() throws Exception {
		return sql.selectList(namespace + ".Cquestion");
	}
	
	//게시물 작성
	@Override
	public void write(CustomerQuestionDto vo) throws Exception {

		sql.insert(namespace + ".Cwrite", vo);
	}

	// 게시물 조회
	public CustomerQuestionDto view(int customer_WriteNo) throws Exception {

		return sql.selectOne(namespace + ".Cview", customer_WriteNo);
	}

	// 게시물 수정
	@Override
	public void modify(CustomerQuestionDto dto) throws Exception {
		sql.update(namespace + ".Cmodify", dto);
	}

	// 게시물 삭제
	public void delete(int bno) throws Exception {
		sql.delete(namespace + ".Cdelete", bno);
	}

	// 게시물 총 갯수
	@Override
	public int count() throws Exception {
		return sql.selectOne(namespace + ".Ccount");
	}

	// 게시물 목록 + 페이징
	@Override
	public List<CustomerQuestionDto> listPage(int displayPost, int postNum) throws Exception {

		HashMap<String, Integer> data = new HashMap<String, Integer>();

		data.put("displayPost", displayPost);
		data.put("postNum", postNum);

		return sql.selectList(namespace + ".ClistPage", data);
	}

}