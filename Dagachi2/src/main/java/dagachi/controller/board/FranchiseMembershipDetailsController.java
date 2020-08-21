package dagachi.controller.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import dagachi.model.board.BoardInfoListModel;
import dagachi.model.board.FranchiseMembershipDetailsDto;
import dagachi.service.board.FranchiseMembershipDetailsServiceImpl;

@Controller
public class FranchiseMembershipDetailsController {
	
	@Autowired
	FranchiseMembershipDetailsServiceImpl fmsi;

	// 페이징
	@GetMapping("/a_ownerDetailInfoList")
	public String list(@RequestParam(value = "p", defaultValue = "1") int pageNum,
			@RequestParam(value = "per", defaultValue = "10") int per, Model m) {
		BoardInfoListModel infoList = fmsi.list(pageNum, per);
		m.addAttribute("a_ownerDetailInfoList", infoList);
		int number = infoList.getCount() - (pageNum - 1) * per;
		m.addAttribute("number", number);
		return "view/board/a_ownerDetailInfoList";
	}

	// 리스트
	@GetMapping("/a_ownerDetailUpdateForm")
	public String updateForm(int pageNum, String restaurant_Num, Model m) {
		FranchiseMembershipDetailsDto dto = fmsi.updateForm(restaurant_Num);
		m.addAttribute("articleInfo", dto);
		m.addAttribute("pageNum", pageNum);
		return "view/board/a_ownerDetailUpdateForm";
	}

	// 수정 하기
	@RequestMapping(value = "updateInfo", method = RequestMethod.POST)
	public String update(FranchiseMembershipDetailsDto dto) {
		System.out.println(dto);
		 fmsi.update(dto);
		return "redirect:a_ownerDetailInfoList";
	}

	// 삭제하기
	@RequestMapping(value = "deleteInfo", method = RequestMethod.POST)
	public String delete(@RequestParam("restaurant_Num") String restaurant_Num) {
		System.out.println("restaurant_Num::" + restaurant_Num);
		fmsi.delete(restaurant_Num);
		System.out.println("삭제하기");
		return "redirect:a_ownerDetailInfoList";
	}
}
