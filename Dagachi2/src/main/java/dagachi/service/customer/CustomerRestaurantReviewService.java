package dagachi.service.customer;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dagachi.dao.customer.CustomerRestaurantReviewDao;
import dagachi.dto.ReviewDtoHK;
import lombok.Setter;

@Service
public class CustomerRestaurantReviewService {
	
	@Setter   
	@Autowired
	private CustomerRestaurantReviewDao dao;
	
	public List<ReviewDtoHK> list(int owner_Num) throws Exception {
		return dao.list(owner_Num);
	}
	
	public int post(ReviewDtoHK dto) throws Exception {
		return dao.post(dto);
	}
	
	public ReviewDtoHK checkReview(int review_Num) throws Exception {
		return dao.checkReview(review_Num);
	}
	
	/*
	 * public int modify(BoardVO vo) throws Exception { return dao.modify(vo); }
	 */
	
	public int deleteReview(int review_Num) throws Exception {
	    return dao.deleteReview(review_Num);
	}
	
	
	//페이징
	
	public int countAll(int owner_Num) throws Exception {
		return dao.countAll(owner_Num);
	}
	
	public List<HashMap<String,Integer>> listPage(int owner_Num, int displayPost, int postNum) throws Exception {
		 return dao.listPage(owner_Num, displayPost, postNum);
		}

}
