package dagachi.service.owner;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dagachi.dao.owner.OwnerReviewManagementDao;
import dagachi.dto.ReviewDtoHK;
import lombok.Setter;

@Service
public class OwnerReviewManagementService {
	
	@Setter   
	@Autowired
	private OwnerReviewManagementDao dao;
	
	public int countAll(int owner_Num) throws Exception {
		return dao.countAll(owner_Num);
	}
	
	public List<HashMap<String,Integer>> listPage(int owner_Num, int displayPost, int postNum) throws Exception {
		 return dao.listPage(owner_Num, displayPost, postNum);
		}
	
	public int replyReview(String review_Answer_Content, int review_Num) throws Exception{
		return dao.replyReview(review_Answer_Content, review_Num);
	}

}
	
	


