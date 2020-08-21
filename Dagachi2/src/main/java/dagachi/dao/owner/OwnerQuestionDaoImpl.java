package dagachi.dao.owner;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dagachi.dto.OwnerQuestionDto;

@Repository
public class OwnerQuestionDaoImpl implements OwnerQuestionDao {

	@Autowired
	private SqlSession sql;

	private static String namespace = "Oquestion";

	//게시물 목록
	@Override
	public List<OwnerQuestionDto> list() throws Exception {
		return sql.selectList(namespace + ".Oquestion");
	}
	
	//게시물 작성
	@Override
	public void write(OwnerQuestionDto vo) throws Exception {

		sql.insert(namespace + ".Owrite", vo);
	}

	// 게시물 조회
	public OwnerQuestionDto view(int owner_WriteNo) throws Exception {

		return sql.selectOne(namespace + ".Oview", owner_WriteNo);
	}

	// 게시물 수정
	@Override
	public void modify(OwnerQuestionDto dto) throws Exception {
		sql.update(namespace + ".Omodify", dto);
	}

	// 게시물 삭제
	public void delete(int owner_WriteNo) throws Exception {
		sql.delete(namespace + ".Odelete", owner_WriteNo);
	}

	// 게시물 총 갯수
	@Override
	public int count() throws Exception {
		return sql.selectOne(namespace + ".Ocount");
	}

	// 게시물 목록 + 페이징
	@Override
	public List<OwnerQuestionDto> listPage(int displayPost, int postNum) throws Exception {

		HashMap<String, Integer> data = new HashMap<String, Integer>();

		data.put("displayPost", displayPost);
		data.put("postNum", postNum);

		return sql.selectList(namespace + ".OlistPage", data);
	}

}