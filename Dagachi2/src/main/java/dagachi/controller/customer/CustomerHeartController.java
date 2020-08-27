package dagachi.controller.customer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dagachi.dto.CustomerHeartDto;
import dagachi.dto.CustomerInfoListModel;
import dagachi.service.customer.CustomerHeartService;
import lombok.Setter;

@Controller
public class CustomerHeartController {
	@Setter
	@Autowired
	CustomerHeartService service;

	@GetMapping("/heartList")
	public String list(Model m) {
		
		List<CustomerHeartDto> list = null;
		list = service.list(1);

		m.addAttribute("list", list);

		return "/customer/heartList";
	}

	@PostMapping("/deleteHeart")
	public String delete(@RequestParam(value = "owner_num")int num,Model m) {
		service.delete(num);
		return "customer/heartList";
	}
	
	@GetMapping("/test")
	public String move() {
	return "customer/test";
	}

	@PostMapping("/addHeart")
	public String add(CustomerHeartDto dto,Model m) {
		service.add(dto);
		return "customer/heartList";
	}

}
