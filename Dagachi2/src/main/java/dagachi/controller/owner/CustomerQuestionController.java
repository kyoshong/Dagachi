package dagachi.controller.customer;

import javax.servlet.http.HttpServletRequest;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import org.springframework.web.bind.annotation.RequestParam;

import dagachi.dto.CustomerQuestionDto;
import dagachi.model.admin.CustomerQuestionList;
import dagachi.service.customer.CustomerQuestionService;
import dagachi.dto.CustomerAnswerDto;
import dagachi.service.admin.CustomerAnswerService;

@Controller
public class CustomerQuestionController {

	@Autowired
	CustomerQuestionService service;
	@Autowired
	CustomerAnswerService answerService;
	
	@GetMapping("/c_boardlist")
	public String list(@RequestParam(value = "p", defaultValue = "1") int pageNum,
			@RequestParam(value = "per", defaultValue = "10") int per, Model m)
	{
		// System.out.println("per::"+per);
		CustomerQuestionList questionList = service.list(pageNum, per);
		
		m.addAttribute("list", questionList);
		int number = questionList.getCount() - (pageNum - 1) * per;
		m.addAttribute("number", number);
		return "customer/board/list";
	}
	
	@GetMapping("/c_boardcontent")
	public String content(@RequestParam(value = "p") int pageNum, int num, Model m) {
		CustomerQuestionDto dto = service.getContent(num);
		m.addAttribute("article", dto);
		m.addAttribute("pageNum", pageNum);
		
		CustomerAnswerDto answerDto = answerService.getContentByQuestionId(num);
		m.addAttribute("answer", answerDto);
		
		return "customer/board/content";
	}
	
	@GetMapping("/c_boardwrite")
	public String writeForm(@ModelAttribute("dto") CustomerQuestionDto dto) {
		return "customer/board/writeForm";
	}
	
	@PostMapping("/c_boardwrite")
	public String write(CustomerQuestionDto dto, HttpServletRequest request) {
		System.out.println(dto.getCustomer_writeTitle());
		service.insert(dto, request);
		return "redirect:/customer/list";
	}
	
	@GetMapping("/c_boardupdate")
	public String updateForm(int num, int p, Model m) {
		CustomerQuestionDto dto = service.updateForm(num);
		m.addAttribute("article", dto);
		m.addAttribute("pageNum", p);
		return "customer/board/updateForm";
	}
	
	@PutMapping("/c_boardupdate")
	public String update(CustomerQuestionDto dto) {
		try {
			System.out.println(dto.getCustomer_num() + dto.getCustomer_content());
			service.update(dto);
			System.out.println("end");
		} catch (Exception e) {
			System.out.println(e);
			return "redirect:/error";
		}
		return "redirect:/customer/board/list";
	}
	
	@GetMapping("/c_boarddelete")
	public String deleteForm(int num, int p, Model m) {
		m.addAttribute("num", num);
		m.addAttribute("pageNum", p);
		
		return "customer/board/deleteForm";
	}

	@DeleteMapping("/c_boarddelete")
	public String delete(int num, int p) {
		service.delete(num);

		return "redirect:/customer/board/list";
	}
	
	public void setService(CustomerQuestionService service) {
		this.service = service;
	}

}
