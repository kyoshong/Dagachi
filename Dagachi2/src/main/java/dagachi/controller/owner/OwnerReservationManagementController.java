package dagachi.controller.owner;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import dagachi.dto.CustomerOrderDto;
import dagachi.service.customer.CustomerOrderService;

@Controller
public class OwnerReservationManagementController {
	@Autowired
	CustomerOrderService customerOrderService;
	
	@GetMapping("/reservationManagement")
	public String reservation(
			@RequestParam(value = "date") String date,
			Model m	) 
	{
		m.addAttribute("date", date);
		
		List<CustomerOrderDto> customerOrderList = customerOrderService.listByOwner(1, date);
		m.addAttribute("customerOrderList", customerOrderList);
		
		return "owner/reservation/management";
	}
}
