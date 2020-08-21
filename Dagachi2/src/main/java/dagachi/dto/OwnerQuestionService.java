package dagachi.dto;

import java.util.List;

public interface OwnerQuestionService {

	// 게시물 목록
	public List<OwnerQuestionDto> list() throws Exception;

	// 게시물 작성
	public void write(OwnerQuestionDto vo) throws Exception;

	// 게시물 조회
	public OwnerQuestionDto view(int owner_WriteNo) throws Exception;

	// 게시물 수정
	public void modify(OwnerQuestionDto dto) throws Exception;

	// 게시물 삭제
	public void delete(int owner_WriteNo) throws Exception;

	// 게시물 총 갯수
	public int count() throws Exception;

	// 게시물 목록 + 페이징
	public List<OwnerQuestionDto> listPage(int displayPost, int postNum) throws Exception;

}