package dagachi.controller.customer;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dagachi.dto.CustomerInfoDto;
import dagachi.service.customer.CustomerInfoService;
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
		
		info = service.one(1);
	  model.addAttribute("info", info);
	  
	  return "customer/myInfo";
	  }

	//회원 정보 수정 완료 창
	@RequestMapping(value = "/myInfo", method = RequestMethod.POST)
	public String updateMyinfo(Model model, CustomerInfoDto info) throws Exception {
		int a = service.update(info);
	  model.addAttribute("update", a);
	 
	 return "myInfo";
	}

	@PostMapping("/write")
	public String write(CustomerInfoDto vo) throws Exception {
		service.update(vo);

		return "redirect:info";

	}
	


}