package dagachi.controller.owner;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import dagachi.dto.OwnerLoginDto;
import dagachi.service.owner.OwnerReservationStatisticsService;
import lombok.Setter;

@Controller
public class OwnerReservationStatisticsController {
	
	@Setter
	@Autowired
	private OwnerReservationStatisticsService service;
	
	@GetMapping("/timeChart")
	public String getGroupChart(Model model,HttpSession session) throws Exception {
				
		List<Integer> list = new ArrayList<>(); 
		int owner_Num = ((OwnerLoginDto) session.getAttribute("member")).getOwner_num();				
		
		list.add(service.time9to12(owner_Num));
		list.add(service.time12to15(owner_Num));
		list.add(service.time15to18(owner_Num));
		list.add(service.time18to21(owner_Num));
		list.add(service.time21to24(owner_Num));
		
		model.addAttribute("list",list);
		
		return "owner/stastics/o_timeChart";
	
			
	}
	
	@GetMapping("/personNumberChart")
	public String getPersonNumberChart(Model model,HttpSession session) throws Exception {

		List<Integer> list = new ArrayList<>(); 
		
		int owner_Num = ((OwnerLoginDto) session.getAttribute("member")).getOwner_num();
		
		list.add(service.number1to2(owner_Num));
		list.add(service.number3to4(owner_Num));
		list.add(service.number5to8(owner_Num));
		list.add(service.numberMoreThan9(owner_Num));
		
		model.addAttribute("list",list);
		
		return "owner/stastics/o_personNumberChart";

	}

}
