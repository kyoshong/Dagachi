package dagachi.board.controller.hjController;

import java.util.ArrayList;  
import java.util.List;

import org.apache.poi.util.SystemOutLogger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import dagachi.board.model.hjModel.AdminMembershipDetailsDto;
import dagachi.board.model.hjModel.AdminPagingDto;
import dagachi.board.model.hjModel.OwnerPagingDto;
import dagachi.board.model.hjModel.PagingVO;
import dagachi.board.service.hjService.AdminMembershipDetailsService;

@Controller
public class AdminMembershipDetailsController {
	
	@Autowired
	AdminMembershipDetailsService adser;
	

	public void setAdser(AdminMembershipDetailsService adser) {
		this.adser = adser;
	}
	
	@GetMapping("a_adminAccountList")
	public String list(@RequestParam(value = "p", defaultValue = "1") int pageNum,
			@RequestParam(value = "per", defaultValue = "10") int per, Model m) {
		// System.out.println("per::"+per);
		AdminPagingDto adminlist = adser.limitList(pageNum, per);
		m.addAttribute("adminlist", adminlist);
		int number = adminlist.getCount() - (pageNum - 1) * per;
		m.addAttribute("number", number);
		return "board/a_adminAccountList";
	}
	//관리자 신규등록창이동
	@RequestMapping("adminWriteForm")
	public String getadminInsert() {
		 return "board/a_adminInsert";
	}
	
	//관리자 신규등록
	@RequestMapping(value ="/adminWrite" ,method=RequestMethod.POST)
	public String adminInsert(AdminMembershipDetailsDto dto, Model m) {
		adser.adminAdd(dto);
		 return "redirect:a_adminAccountList";
	}
	
	//관리자 정보조회
	@RequestMapping("adminInfo")
	public String adminUpdate(@RequestParam("admin_Num") int admin_Num, Model model) {
		AdminMembershipDetailsDto dto = new AdminMembershipDetailsDto();
		dto = adser.adminSel_1(admin_Num);
		model.addAttribute("adminUpdate", dto);
		return "board/a_adminUpdateDelete";
	}
	
	//관리자 정보 삭제
	@RequestMapping("adminDel")
	public String adminDel(@RequestParam("admin_Num") int admin_Num, Model m) { 
		adser.adminDel(admin_Num);
		return "redirect:a_adminAccountList";
	}
	//관리자 정보 수정
	@RequestMapping(value ="adminUpdate" ,method=RequestMethod.POST)
	public String adminUp(AdminMembershipDetailsDto dto, Model m) { 
		adser.adminUp(dto);
		return "redirect:a_adminAccountList";
	}
	
}
