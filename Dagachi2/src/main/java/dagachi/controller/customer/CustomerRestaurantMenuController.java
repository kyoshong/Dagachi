package dagachi.controller.customer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dagachi.dto.MenuDto;
import dagachi.service.customer.CustomerRestaurantInfoServiceImpl;

@Controller
public class CustomerRestaurantMenuController {

	@Autowired
	private CustomerRestaurantInfoServiceImpl crid;

	// 리스트
	@RequestMapping(value = "/c_restaurantMenu")
	public String selectList(int owner_Num, Model m) throws Exception {
		System.out.println(owner_Num);
		List<MenuDto> list = crid.selectList(owner_Num);
		System.out.println("List:" + list.toString());
		m.addAttribute("owner_Num", owner_Num);
		System.out.println(owner_Num);
		m.addAttribute("list", list);
		System.out.println(list);
		System.out.println("Model:" + list.toString());

		return "customer/c_restaurantMenu";
	}

}
