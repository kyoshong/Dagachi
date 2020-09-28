package dagachi.controller.customer;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dagachi.dto.CustomerRestaurantSearchDto;
import dagachi.model.board.FranchiseNewlistDto;
import dagachi.model.customer.RestaurantInfoModel;
import dagachi.service.customer.CustomerRestaurantSearchServiceImpl;

@Controller
public class CustomerRestaurantInfoController {

	@Autowired
	private CustomerRestaurantSearchServiceImpl crsdi;

	@RequestMapping("/c_searchRestaurant")
	public String list(

			@RequestParam(value = "p", defaultValue = "1") int pageNum,
			@RequestParam(value = "per", defaultValue = "10") int per, Model m,
			@RequestParam(value = "searchType", defaultValue = "") String searchType,
			@RequestParam(value = "searchType2", defaultValue = "") String searchType2,
			@RequestParam(value = "keyword", required = false) String keyword,
			@RequestParam(value = "select_chk", required = false) String select_chk,
			@RequestParam(value = "range", defaultValue = "1") int range) {

		RestaurantInfoModel list = crsdi.list(pageNum, per, searchType, searchType2, keyword, select_chk, range);
		int number = list.getCount() - (pageNum - 1) * per;

		m.addAttribute("list", list);
		System.out.println("list :" + list);
		m.addAttribute("number", number);
		m.addAttribute("searchType", searchType);
		m.addAttribute("searchType2", searchType2);
		m.addAttribute("keyword", keyword);
		m.addAttribute("select_chk", select_chk);
		m.addAttribute("range", range);

		return "customer/c_searchRestaurant";
	}

	@RequestMapping(value = "/c_searchDetailRestaurant")
	public ModelAndView listAll(@RequestParam(value = "p", defaultValue = "1") int pageNum,
			@RequestParam(value = "per", defaultValue = "10") int per, Model m,
			@RequestParam(value = "searchType", defaultValue = "") String searchType,
			@RequestParam(value = "searchType2", defaultValue = "") String searchType2,
			@RequestParam(value = "keyword", required = false) String keyword,
			@RequestParam(value = "select_chk", required = false) String select_chk,
			@RequestParam(value = "range", defaultValue = "1") int range) throws Exception {

		List<CustomerRestaurantSearchDto> listAll = crsdi.listAll(searchType, searchType2, keyword, select_chk, range);
		int count = crsdi.countArticle(searchType, searchType2, keyword, select_chk, range);

		ModelAndView mav = new ModelAndView();

		Map<String, Object> map = new HashMap<String, Object>();

		RestaurantInfoModel infoList = crsdi.list(pageNum, per, searchType, searchType2, keyword, select_chk, range);
		int number = infoList.getCount() - (pageNum - 1) * per;

		System.out.println("infoList : " + infoList.getRestaurantInfoList().get(0).getRestaurant_Pic());

		map.put("listAll", listAll);
		System.out.println("listAll : " + listAll);
		map.put("count", count);
		map.put("infoList", infoList);
		System.out.println("infoList :" + infoList);
		map.put("number", number);
		map.put("searchType", searchType);
		map.put("searchType2", searchType2);
		map.put("keyword", keyword);
		map.put("select_chk", select_chk);
		map.put("range", range);
		mav.addObject("map", map);
		mav.setViewName("customer/c_searchDetailRestaurant");

		return mav;
	}

	// 매장상세리스트
	//selectList
	/*
	 * @RequestMapping(value="/c_restaurantDetail")
	 * 
	 * public String listInfo(int owner_Num, Model m) throws Exception {
	 * System.out.println(owner_Num); List<CustomerRestaurantSearchDto> list =
	 * crsdi.listInfo(owner_Num); System.out.println(list.toString());
	 * m.addAttribute("list", list); System.out.println(list.toString()); return
	 * "customer/c_restaurantDetail"; }
	 */
		
	//selectOne
	@GetMapping("/c_restaurantDetail")
	public String listDetail(int owner_Num, Model m) throws Exception {
		System.out.println(owner_Num);
		CustomerRestaurantSearchDto list = crsdi.listDetail(owner_Num);
		System.out.println(list.toString());
		m.addAttribute("list", list);
		System.out.println(list.toString());
		return "customer/c_restaurantDetail";
	}
	
}
