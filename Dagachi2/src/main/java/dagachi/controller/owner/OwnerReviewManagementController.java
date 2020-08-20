package dagachi.controller.owner;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import dagachi.dto.ReviewDto;
import dagachi.service.owner.OwnerReviewManagementService;
import dagachi.utils.PageHK;
import lombok.Setter;

@Controller
public class OwnerReviewManagementController {
	
	@Setter
	@Autowired
	OwnerReviewManagementService service;
	
	@GetMapping("/reviewOwnerList")
	public String getReviewOwnerList(Model model, @RequestParam("num") int num,@RequestParam("owner_Num") int owner_Num) throws Exception {
		 
			PageHK page = new PageHK();
			page.setNum(num);
			page.setCount(service.countAll(owner_Num));  

			List<HashMap<String,Integer>> list = null; 
			list = service.listPage(owner_Num, page.getDisplayPost(), page.getPostNum());
			
			model.addAttribute("list", list);   
			model.addAttribute("page", page);
			model.addAttribute("select", num);
			
		return "owner/review/o_reviewManagement";
	}
	
	
	@PostMapping("/replyReview")
	@ResponseBody
	public String replyReview(@RequestParam("review_Answer_Content") String review_Answer_Content, @RequestParam int review_Num) throws Exception {
		service.replyReview(review_Answer_Content, review_Num);
		return null;
	}

}
