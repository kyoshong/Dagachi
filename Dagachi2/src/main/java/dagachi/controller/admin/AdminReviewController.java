package dagachi.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import dagachi.dto.ReviewListModel;
import dagachi.dto.ReviewDto;
import dagachi.service.admin.AdminReviewService;
import lombok.Setter;

@Controller
public class AdminReviewController {
	@Setter
	@Autowired
	AdminReviewService service;
	// 고객리뷰리스트 출력

	@GetMapping("/list")
	public String list(@RequestParam(value = "p", defaultValue = "1") int pageNum,
			@RequestParam(value = "per", defaultValue = "10") int per, Model m) {
		ReviewListModel list = service.list(pageNum, per);

		System.out.println(list.getBoardList().toString());

		System.out.println(list);
		m.addAttribute("list", list);
		int number = list.getCount() - (pageNum - 1) * per;
		m.addAttribute("number", number);
		return "/admin/review/list";
	}

	// 게시물 목록 + 페이징 추가 + 검색
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String getListPageSearch(@RequestParam(value = "p", defaultValue = "1") int pageNum,
			@RequestParam(value = "per", defaultValue = "10") int per, Model m,
			@RequestParam(value = "searchType") String searchType, @RequestParam(value = "keyword") String keyword)
			throws Exception {
		ReviewListModel list = service.listSearch(pageNum, per, searchType, keyword);
		int number = list.getCount() - (pageNum - 1) * per;

		m.addAttribute("list", list);
		m.addAttribute("searchType", searchType);
		m.addAttribute("keyword", keyword);
		m.addAttribute("number", number);

		return "/admin/review/search";
	}

	@RequestMapping(value = "/content", method = RequestMethod.GET)
	public String content(@RequestParam(value = "p") int p, int num, Model m) {
		ReviewDto dto = service.one(num);
		m.addAttribute("article", dto);
		m.addAttribute("pageNum", p);
		System.out.println(dto.getReview_Pic());
		return "/admin/review/content";
	}

	@PostMapping("/reviewDelete")
	public String delete(int num, int p) {

		service.delete(num);
		return "redirect:/admin/list";

	}

	/*
	 * @PostMapping("/search") public String one(int num, Model m) { ReviewDto a =
	 * service.customerOne(num); if (a==null) { ReviewDto b = service.ownerOne(num);
	 * m.addAttribute("list", b);
	 * 
	 * } m.addAttribute("list", a);
	 * 
	 * return "redirect:/admin/review/search"; }
	 */

}