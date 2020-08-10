package dagachi.controller.admin;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dagachi.dto.BoardListModel;
import dagachi.dto.ReviewDto;
import dagachi.service.admin.AdminReviewService;
import dagachi.service.customer.CustomerInfoService;
import lombok.Setter;




@Controller
public class AdminReviewController {
	@Setter
	@Autowired
	AdminReviewService service;
	


	@GetMapping("/list")
	public String list(@RequestParam(value = "p", defaultValue = "1") int pageNum,
			@RequestParam(value = "per", defaultValue = "10") int per, Model m) {
		BoardListModel list = service.list(pageNum, per);
	
			System.out.println(list.getBoardList().toString());
		
		System.out.println(list);
		m.addAttribute("list", list);
		int number = list.getCount() - (pageNum - 1) * per;
		m.addAttribute("number", number);
		return "/admin/review/list";
	}

	@GetMapping("review/content")
	public String content(@RequestParam(value = "p") int pageNum, int num, Model m) {
		ReviewDto dto = service.one(num);
		m.addAttribute("article", dto);
		m.addAttribute("pageNum", pageNum);
		return "/admin/review/content";
	}
	
	@DeleteMapping("/list")
	public String delete(int num,int p) {
	
			service.delete(num);
		
		return "redirect:/admin/review/content";
	}
	@PostMapping("/search")
	public String one(int num, Model m) {
		ReviewDto a = service.customerOne(num);
		if (a==null) {
			ReviewDto b = service.ownerOne(num);
			 m.addAttribute("list", b);

		}
		m.addAttribute("list", a);

		return "redirect:/admin/review/search";
	}
	
}