package dagachi.controller.customer;



import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dagachi.dto.CustomerInfoDto;
import dagachi.service.customer.CustomerInfoService;
import dagachi.service.customer.PasswordCheckException;
import lombok.Setter;

@Controller
public class CustomerInfoController {

	@Setter
	@Autowired
	CustomerInfoService service;
	//회원 정보 수정 view
	@RequestMapping(value = "/myInfo", method = RequestMethod.GET)
	  public String getMyinfo(Model model) throws Exception {
	
		CustomerInfoDto info = null;
		
		info = service.one(11);
	  model.addAttribute("info", info);
	  
	  return "customer/myInfo";
	  }

	//회원 정보 수정 완료 창
	@RequestMapping(value = "/myInfo", method = RequestMethod.POST)
	public String updateMyinfo(Model m, String info) throws Exception {
		int a = service.update(info);
		m.addAttribute("num", a);
	 
	 return "redirect:myInfo";
	}

	/*
	 * @PostMapping("/write") public String newPassword(CustomerInfoDto vo) throws
	 * Exception { service.update(vo); return "redirect:myInfo";
	 * 
	 * }
	 */
	//회원 탈퇴
	@GetMapping("/deleteForm")
	public String deleteForm(int num, Model m) {
		m.addAttribute("num", num);
		return "customer/deleteForm";
	}	
	
	@PostMapping("/delete")
	public String delete(int num, String passwd) {
		try {
			service.delete(num,passwd);
		} catch (PasswordCheckException e) {
			return "customer/error";
		}
		return "customer/myInfo";
	}
	
	@GetMapping("/error")
	public String error() {
		return "error/exception";
	}

}