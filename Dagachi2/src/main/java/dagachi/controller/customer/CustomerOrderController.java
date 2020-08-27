package dagachi.controller.customer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import dagachi.dto.CustomerOrderDto;
import dagachi.service.customer.CustomerOrderService;
import lombok.Setter;

@Controller
public class CustomerOrderController {
	@Setter
	@Autowired
	CustomerOrderService service;
	
	@GetMapping("/orderList")
	public String list(Model m) {
		
		List<CustomerOrderDto> list = null;
		list = service.list(1);

		m.addAttribute("list", list);

		return "customer/orderList";
	}
	@ResponseBody
	@PostMapping("/orderDelete")
	public String deleteorder(@RequestParam(value = "num")int reserv_num, Model m) {
		System.out.println(reserv_num);
		service.delete(reserv_num);
		
		return "redirect: customer/orderList";
	}
	
}
