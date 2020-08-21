package dagachi.service.owner;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dagachi.dao.owner.OwnerQuestionDao;
import dagachi.dto.OwnerQuestionDto;

@Component
public class OwnerQuestionServiceImpl implements OwnerQuestionService {

	@Autowired
	private OwnerQuestionDao dao;

	// 게시물 목록
	public List<OwnerQuestionDto> list() throws Exception {
		return dao.list();
	}

	// 게시물 작성
	@Override
	public void write(OwnerQuestionDto vo) throws Exception {

		dao.write(vo);
	}

	// 게시물 조회
	@Override
	public OwnerQuestionDto view(int owner_WriteNo) throws Exception {

		return dao.view(owner_WriteNo);
	}

	// 게시물 수정
	@Override
	public void modify(OwnerQuestionDto dto) throws Exception {

		dao.modify(dto);
	}

	// 게시물 삭제
	public void delete(int owner_WriteNo) throws Exception {
		dao.delete(owner_WriteNo);
	}

	// 게시물 총 갯수
	@Override
	public int count() throws Exception {
		return dao.count();
	}

	// 게시물 목록 + 페이징
	@Override
	public List<OwnerQuestionDto> listPage(int displayPost, int postNum) throws Exception {
		return dao.listPage(displayPost, postNum);
	}

}