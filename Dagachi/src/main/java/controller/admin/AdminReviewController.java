package controller.admin;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;


import dto.BoardListModel;
import dto.ReviewDto;
import service.admin.AdminReviewService;

@Controller
public class AdminReviewController {
	@Autowired
	AdminReviewService service;
	public void setService(AdminReviewService service) {
		this.service = service;
	}


	@GetMapping("/list")
	public String list(@RequestParam(value = "p", defaultValue = "1") int pageNum,
			@RequestParam(value = "per", defaultValue = "10") int per, Model m) {
		// System.out.println("per::"+per);
		BoardListModel list = service.list(pageNum, per);
		m.addAttribute("list", list);
		int number = list.getCount() - (pageNum - 1) * per;
		m.addAttribute("number", number);
		return "list";
	}

	@GetMapping("/content")
	public String content(@RequestParam(value = "p") int pageNum, int num, Model m) {
		ReviewDto dto = service.one(num);
		m.addAttribute("article", dto);
		m.addAttribute("pageNum", pageNum);
		return "content";
	}
	
	@DeleteMapping("/list")
	public String delete(int num,int p) {
	
			service.delete(num);
		
		return "redirect:/admin/review";
	}
	@PostMapping("/Search")
	public String one(int num, Model m) {
		ReviewDto a = service.customerOne(num);
		if (a==null) {
			ReviewDto b = service.ownerOne(num);
			 m.addAttribute("list", b);

		}
		m.addAttribute("list", a);

		return "redirect:/admin/search";
	}
	
}
