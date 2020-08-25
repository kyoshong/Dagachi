package dagachi.controller.owner;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import dagachi.dto.OwnerQuestionDto;
import dagachi.model.admin.OwnerQuestionList;
import dagachi.service.owner.OwnerQuestionService;

@Controller
public class OwnerQuestionController {

	@Autowired
	OwnerQuestionService service;

	@GetMapping("/o_boardlist")
	public String list(@RequestParam(value = "p", defaultValue = "1") int pageNum,
			@RequestParam(value = "per", defaultValue = "10") int per, Model m) {

		OwnerQuestionList questionList = service.list(pageNum, per);

		m.addAttribute("list", questionList);
		int number = questionList.getCount() - (pageNum - 1) * per;
		m.addAttribute("number", number);
		return "owner/board/list";
	}

	@GetMapping("/o_boardcontent")
	public String content(@RequestParam(value = "p") int pageNum, int num, Model m) {
		OwnerQuestionDto dto = service.getContent(num);
		m.addAttribute("article", dto);
		m.addAttribute("pageNum", pageNum);
		return "owner/board/content";
	}

	@GetMapping("/o_boardwrite")
	public String writeForm(@ModelAttribute("dto") OwnerQuestionDto dto) {
		return "owner/board/writeForm";
	}

	@PostMapping("/o_boardwrite")
	public String write(OwnerQuestionDto dto, HttpServletRequest request) {
		System.out.println(dto.getOwner_writeTitle());
		service.insert(dto, request);
		return "redirect:/owner/board/list";
	}

	@GetMapping("/o_boardupdate")
	public String updateForm(int num, int p, Model m) {
		OwnerQuestionDto dto = service.updateForm(num);
		m.addAttribute("article", dto);
		m.addAttribute("pageNum", p);
		return "owner/board/updateForm";
	}

	@PutMapping("/o_boardupdate")
	public String update(OwnerQuestionDto dto) {
		try {
			System.out.println(dto.getOwner_num() + dto.getOwner_content());
			service.update(dto);
			System.out.println("end");
		} catch (Exception e) {
			System.out.println(e);
			return "redirect:/error";
		}
		return "redirect:/owner/board/list";
	}

	@GetMapping("/o_boarddelete")
	public String deleteForm(int num, int p, Model m) {
		m.addAttribute("num", num);
		m.addAttribute("pageNum", p);

		return "owner/board/deleteForm";
	}

	@DeleteMapping("/o_boarddelete")
	public String delete(int num, int p) {
		service.delete(num);

		return "redirect:/owner/board/list";
	}

	public void setService(OwnerQuestionService service) {
		this.service = service;
	}

}