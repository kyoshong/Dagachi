package dagachi.controller.customer;

import java.util.HashMap;

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

import com.sun.javafx.collections.MappingChange.Map;

import dagachi.dto.CustomerInfoDto;
import dagachi.service.customer.CustomerInfoService;
import dagachi.service.customer.PasswordCheckException;
import lombok.Setter;

@Controller
public class CustomerInfoController {

	@Setter
	@Autowired
	CustomerInfoService service;

	// 회원 정보 수정 view
	@RequestMapping(value = "/myInfo", method = RequestMethod.GET)
	public String getMyinfo(Model model) throws Exception {

		CustomerInfoDto info = null;

		info = service.one(1);

		model.addAttribute("info", info);

		return "customer/myInfo";
	}

	// 회원 정보 수정 완료 창
	@PostMapping("/update")
	public String updateMyinfo(Model model, String newPassword, int num) throws Exception {

		HashMap<String, Object> map = new HashMap<>();

		map.put("customer_password", newPassword);
		map.put("customer_num", num);
		service.update(map);
		return "redirect:/customer/myInfo";
	}

	/*
	 * @PostMapping("/write") public String newPassword(CustomerInfoDto vo) throws
	 * Exception { service.update(vo); return "redirect:myInfo";
	 * 
	 * }
	 */
	// 회원 탈퇴
	@GetMapping("/deleteForm")
	public String deleteForm(int num, Model m) {
		m.addAttribute("num", num);
		return "customer/deleteForm";
	}

	@PostMapping("/delete")
	public String delete(int num, String password) {
		try {
			service.delete(num, password);
		} catch (PasswordCheckException e) {
			return error();
		}
		return "redirect:/index.jsp";
	}

	@GetMapping("/error")
	public String error() {
		return "customer/error/exception";
	}

}