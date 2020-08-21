package dagachi.controller.board;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import dagachi.model.board.BoardListModel;
import dagachi.model.board.FranchiseNewlistDto;
import dagachi.service.board.FranchiseNewlistServiceImpl;

@Controller
public class FranchiseNewlistController {

	@Autowired
	FranchiseNewlistServiceImpl fnsi;

	// 페이징
	@GetMapping("/a_ownerReceiptList")
	public String list(@RequestParam(value = "p", defaultValue = "1") int pageNum,
			@RequestParam(value = "per", defaultValue = "10") int per, Model m) {
		BoardListModel list = fnsi.list(pageNum, per);
		m.addAttribute("a_ownerReceiptList", list);
		System.out.println();
		int number = list.getCount() - (pageNum - 1) * per;
		m.addAttribute("number", number);
		return "view/board/a_ownerReceiptList";
	}

	// 리스트
	@GetMapping("/a_receiptPermitForm")
	public String updateForm(int pageNum, String restaurant_Num, Model m) {
		FranchiseNewlistDto dto = fnsi.updateForm(restaurant_Num);
		m.addAttribute("article", dto);
		m.addAttribute("pageNum", pageNum);
		return "view/board/a_receiptPermitForm";
	}

	// 삽입후 삭제 하기
	@RequestMapping(value = "insert", method = RequestMethod.POST)
	public String insert(FranchiseNewlistDto dto, String restaurant_Num) {
		System.out.println(dto);
		 fnsi.insert(dto);
		 fnsi.delete(restaurant_Num);
		return "redirect:a_ownerReceiptList";
	}

	// 삭제하기
	@RequestMapping(value = "delete", method = RequestMethod.POST)
	public String delete(@RequestParam("restaurant_Num") String restaurant_Num) {
		System.out.println("restaurant_Num::" + restaurant_Num);
		fnsi.delete(restaurant_Num);
		return "redirect:a_ownerReceiptList";
	}

}
