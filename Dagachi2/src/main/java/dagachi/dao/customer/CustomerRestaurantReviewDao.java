package dagachi.dao.customer;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import dagachi.dto.ReviewDtoHK;

public class CustomerRestaurantReviewDao extends SqlSessionDaoSupport {
	
	public List<ReviewDtoHK> list(int owner_Num) throws Exception { //고객페이지에서 리뷰 버튼 눌렀을 때 리뷰창 or 사장페이지에서 리뷰관리 눌렀을 때
		return getSqlSession().selectList("reviewHK.reviewAll",owner_Num); 
	}
	
	public int post(ReviewDtoHK dto) throws Exception { //고객이 리뷰 등록하는 sql문
		return getSqlSession().insert("reviewHK.postReview",dto);
	}
	
	public ReviewDtoHK checkReview(int review_Num) throws Exception { //고객 또는 사장 쪽에서 리뷰리스트에서 선택할 때
		return getSqlSession().selectOne("reviewHK.checkReview",review_Num);
	}
	
	/*
	 * public int modify(BoardVO vo) throws Exception { return
	 * getSqlSession().update("boardex.modify", vo); }
	 */
	
	public int deleteReview(int review_Num) throws Exception { //고객이 자신이 쓴 리뷰 지우는 sql문
		return getSqlSession().delete("reviewHK.deleteReview",review_Num);
	}
	
	
	
	public int replyReview(int review_Num) throws Exception { //사장이 리뷰에 대해 답글을 달 때
		return getSqlSession().insert("reviewHK.replyReview",review_Num);
	}
	
	//페이징
	
	public int countAll(int owner_Num) throws Exception {
	 return getSqlSession().selectOne("reviewHK.countAll",owner_Num); 
	}
	
	public List<HashMap<String,Integer>> listPage(int owner_Num, int displayPost, int postNum) throws Exception {

		 HashMap<String, Integer> data = new HashMap<>();
		 
		 data.put("owner_Num",owner_Num);
		 data.put("displayPost", displayPost);
		 data.put("postNum", postNum);
		  
		 return getSqlSession().selectList("reviewHK.listPage", data);
		}
}
