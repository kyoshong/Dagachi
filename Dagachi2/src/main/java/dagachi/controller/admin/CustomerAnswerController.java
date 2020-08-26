package dagachi.controller.admin;

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
import dagachi.dto.CustomerAnswerDto;
import dagachi.model.admin.CustomerQuestionList;
import dagachi.service.customer.CustomerQuestionService;
import dagachi.service.admin.CustomerAnswerService;


@Controller
public class CustomerAnswerController {
	@Autowired
	CustomerQuestionService questionService;
	@Autowired
	CustomerAnswerService answerService;
	
	@GetMapping("/c_questionList")
	public String list(@RequestParam(value = "p", defaultValue = "1") int pageNum,
			@RequestParam(value = "per", defaultValue = "10") int per, Model m)
	{
		// System.out.println("per::"+per);
		CustomerQuestionList questionList = questionService.list(pageNum, per);
		
		m.addAttribute("list", questionList);
		int number = questionList.getCount() - (pageNum - 1) * per;
		m.addAttribute("number", number);
		return "admin/customer/questionList";
	}
	
	@GetMapping("/c_questionContent")
	public String content(@RequestParam(value = "p") int pageNum, 
			@RequestParam(value="num") int num, Model m) {
		CustomerQuestionDto questionDto = questionService.getContent(num);
		m.addAttribute("article", questionDto);
		m.addAttribute("pageNum", pageNum);
		
		CustomerAnswerDto answerDto = answerService.getContentByQuestionId(num);
		m.addAttribute("answer", answerDto);
		
		return "admin/customer/questionContent";
	}
	
	@GetMapping("/c_questionDelete")
	public String deleteForm(int num, int p, Model m) {
		m.addAttribute("num", num);
		m.addAttribute("pageNum", p);
		
		return "admin/customer/questionDeleteForm";
	}
	
	@DeleteMapping("/c_questionDelete")
	public String delete(int num, int p) {
		questionService.delete(num);

		return "redirect:/admin/customer/questionList";
	}

	@GetMapping("/c_answerWrite")
	public String writeForm(@RequestParam(value = "questionId") int questionId, 
			@ModelAttribute("dto") CustomerAnswerDto dto, Model m) {
		CustomerQuestionDto questionDto = questionService.getContent(questionId);
		
		m.addAttribute("questionId", questionId);
		m.addAttribute("questionTitle", questionDto.getCustomer_writeTitle());
		m.addAttribute("questionContent", questionDto.getCustomer_content());
		
		return "admin/customer/answerWriteForm";
	}
	
	@PostMapping("/c_answerWrite")
	public String write(CustomerAnswerDto dto, HttpServletRequest request) {
		
		answerService.insert(dto, request);
		questionService.updateIsAnswered(true, dto.getCustomer_Question_id());
		return "redirect:/admin/customer/questionList";
	}
	
	@GetMapping("/c_answerUpdate")
	public String updateForm(@RequestParam(value="questionId") int questionId, Model m) {
		CustomerAnswerDto dto = answerService.getContentByQuestionId(questionId);
		m.addAttribute("answer", dto);
		m.addAttribute("questionId", questionId);
		return "admin/customer/answerUpdateForm";
	}
	
	@PutMapping("/c_answerUpdate")
	public String update(CustomerAnswerDto dto, HttpServletRequest request) {
		try {
			answerService.update(dto, request);
		} catch (Exception e) {
			return "redirect:/error";
		}
		
		return "redirect:/admin/customer/questionList";
	}
	
	
	
	
	
	public void setService(CustomerAnswerService service) {
		this.answerService = service;
	}
}
