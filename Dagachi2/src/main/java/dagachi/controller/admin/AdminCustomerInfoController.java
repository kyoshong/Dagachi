package dagachi.controller.admin;

import java.util.List;

import org.apache.commons.io.filefilter.FalseFileFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import dagachi.dao.admin.AdminCustomerInfoDao;
import dagachi.dto.CustomerInfoDto;
import dagachi.dto.CustomerInfoListModel;
import dagachi.dto.ReviewListModel;
import dagachi.service.admin.AdminCustomerInfoService;
import dagachi.utils.Paging;
import lombok.Setter;

@Controller
public class AdminCustomerInfoController {
	@Setter
	@Autowired
	AdminCustomerInfoService service;

// 고객정보리스트 출력
	
	  @GetMapping("/infoList") public String list(@RequestParam(value = "p",
	  defaultValue = "1") int pageNum,
	  
	  @RequestParam(value = "per", defaultValue = "10") int per, Model m) {
	  CustomerInfoListModel list = service.list(pageNum, per);
	  
	  
	  m.addAttribute("list", list); 
	  int number = list.getCount() - (pageNum - 1) *
	  per; m.addAttribute("number", number); 
	  return "/admin/customerInfo/list"; }
	  
	  
	 
	// 게시물 목록 + 페이징 추가 + 검색
		@RequestMapping(value = "/searchList", method = RequestMethod.GET)
		public String getListPageSearch(@RequestParam(value = "p", defaultValue = "1") int pageNum,
		@RequestParam(value = "per", defaultValue = "10") int per,Model m, 
		@RequestParam(value = "searchType") String searchType, 
		@RequestParam(value ="keyword") String keyword
		  ) throws Exception {
			CustomerInfoListModel list = service.listSearch(pageNum, per,searchType,keyword);
			System.out.println("list.getBoardList().size():::"+list.getBoardList().size());
			int number = list.getCount() - (pageNum - 1) * per;
		

			m.addAttribute("list", list);
			m.addAttribute("searchType", searchType);
			m.addAttribute("keyword", keyword);
			m.addAttribute("number", number);
		
		 
		 return "/admin/customerInfo/searchList";
		}
		
	//고객상세정보
	@RequestMapping(value = "/infoContent", method = RequestMethod.GET)
	  public String getInfo(int num, Model model) throws Exception {
	
		CustomerInfoDto info = null;
		
		info = service.one(num);
	  model.addAttribute("info", info);
	  
	  return "/admin/customerInfo/infoContent";
	  }
	
	

}
