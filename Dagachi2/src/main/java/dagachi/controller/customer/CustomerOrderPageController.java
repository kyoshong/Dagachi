package dagachi.controller.customer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import dagachi.dto.CustomerOrderDto;
import dagachi.service.customer.CustomerOrderPageService;
import lombok.Setter;

@Controller
public class CustomerOrderPageController {
	
	@Setter
	@Autowired
	private CustomerOrderPageService service;
	
	@GetMapping("/reservationForm")
	public String getMakeReservation() {
		
		return "customer/reserve/c_restaurantReserve";
	
	}
	
	@PostMapping("/reservationForm")
	public String makeReservation(CustomerOrderDto dto) {
		
		return null;
	}
	
	

}
