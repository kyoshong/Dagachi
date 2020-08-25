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

import dagachi.dto.OwnerAnswerDto;
import dagachi.dto.OwnerQuestionDto;
import dagachi.model.admin.OwnerQuestionList;
import dagachi.service.admin.OwnerAnswerService;
import dagachi.service.owner.OwnerQuestionService;

@Controller
public class OwnerAnswerController {
	@Autowired
	OwnerQuestionService questionService;
	@Autowired
	OwnerAnswerService answerService;
	
	@GetMapping("/o_questionList")
	public String list(@RequestParam(value = "p", defaultValue = "1") int pageNum,
			@RequestParam(value = "per", defaultValue = "10") int per, Model m)
	{
		// System.out.println("per::"+per);
		OwnerQuestionList questionList = questionService.list(pageNum, per);
		
		m.addAttribute("list", questionList);
		int number = questionList.getCount() - (pageNum - 1) * per;
		m.addAttribute("number", number);
		return "admin/owner/questionList";
	}
	
	@GetMapping("/o_questionContent")
	public String content(@RequestParam(value = "p") int pageNum, 
			@RequestParam(value="num") int num, Model m) {
		OwnerQuestionDto questionDto = questionService.getContent(num);
		m.addAttribute("article", questionDto);
		m.addAttribute("pageNum", pageNum);
		return "admin/owner/questionContent";
	}
	
	@GetMapping("/o_delete")
	public String deleteForm(int num, int p, Model m) {
		m.addAttribute("num", num);
		m.addAttribute("pageNum", p);
		
		return "admin/owner/deleteForm";
	}

	@GetMapping("/o_answerWrite")
	public String writeForm(@RequestParam(value = "questionId") int questionId, 
			@ModelAttribute("dto") OwnerAnswerDto dto, Model m) {
		OwnerQuestionDto questionDto = questionService.getContent(questionId);
		
		m.addAttribute("questionId", questionId);
		m.addAttribute("questionTitle", questionDto.getOwner_writeTitle());
		m.addAttribute("questionContent", questionDto.getOwner_content());
		
		return "admin/owner/answerWriteForm";
	}
	
	@PostMapping("/o_answerWrite")
	public String write(OwnerAnswerDto dto, HttpServletRequest request) {
		
		answerService.insert(dto, request);
		questionService.updateIsAnswered(true, dto.getOwner_Question_id());
		return "redirect:/admin/owner/questionList";
	}
	
	@GetMapping("/o_answerUpdate")
	public String updateForm(@RequestParam(value="questionId") int questionId, Model m) {
		OwnerAnswerDto dto = answerService.getContentByQuestionId(questionId);
		m.addAttribute("answer", dto);
		m.addAttribute("questionId", questionId);
		return "admin/owner/answerUpdateForm";
	}
	
	@PutMapping("/o_answerUpdate")
	public String update(OwnerAnswerDto dto, HttpServletRequest request) {
		try {
			answerService.update(dto, request);
		} catch (Exception e) {
			return "redirect:/error";
		}
		
		return "redirect:/admin/owner/questionList";
	}
	
	
	@DeleteMapping("/o_answerDelete")
	public String delete(int num, int p) {
		answerService.delete(num);

		return "redirect:/admin/owner/list";
	}
	
	
	public void setService(OwnerAnswerService service) {
		this.answerService = service;
	}
}