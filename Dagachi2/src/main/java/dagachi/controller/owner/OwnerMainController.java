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

import dagachi.board.model.hjModel.OwnerPagingDto;
import dagachi.board.service.hjService.OwnerNoticeService;
import dagachi.dto.CustomerOrderDto;
import dagachi.service.customer.CustomerOrderService;

@Controller
public class OwnerMainController {
	@Autowired
	CustomerOrderService customerOrderService;
	@Autowired
	OwnerNoticeService ownerNoticeService;

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main(Model m) {
		SimpleDateFormat dateFormat = new SimpleDateFormat ( "yyyy-MM-dd");
		Date date = new Date();	
		String today = dateFormat.format(date);
		
		m.addAttribute("today", today);
		
		List<CustomerOrderDto> customerOrderList = customerOrderService.list(1);
		m.addAttribute("customerOrderList", customerOrderList);
		
		OwnerPagingDto ownerNoticeList = ownerNoticeService.limitList(1, 1);
		m.addAttribute("ownerNoticeList", ownerNoticeList);
		
		return "owner/mainPage";
	}
}
