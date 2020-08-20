package dagachi.dao.owner;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;



public class OwnerReviewManagementDao extends SqlSessionDaoSupport {
	
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
	
	public int replyReview(String review_Answer_Content,int review_Num) {
		
		HashMap<String, Object> data = new HashMap<>();
		 
		 data.put("review_Num",review_Num);
		 data.put("review_Answer_Content",review_Answer_Content);
		
		return getSqlSession().update("reviewHK.replyReview",data);
	}
}


