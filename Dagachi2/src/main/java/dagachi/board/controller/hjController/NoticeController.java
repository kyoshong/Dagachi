package dagachi.board.controller.hjController;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import dagachi.board.model.hjModel.OwnerNoticeDto;
import dagachi.board.model.hjModel.OwnerPagingDto;
import dagachi.board.service.hjService.OwnerNoticeService;

@Controller
public class NoticeController {
	

	@Autowired
	OwnerNoticeService ser;

	public void setSer(OwnerNoticeService ser) {
		this.ser = ser;
	}

	@GetMapping("a_noticeList")
	public String list(@RequestParam(value = "p", defaultValue = "1") int pageNum,
			@RequestParam(value = "per", defaultValue = "10") int per, Model m) {
		OwnerPagingDto list = ser.limitList(pageNum, per);
		m.addAttribute("list", list);
		int number = list.getCount() - (pageNum - 1) * per;
		m.addAttribute("number", number);
		return "view/board/a_noticeList";
	} 

	
	@RequestMapping(value = "a_noticeListSearch")
	public String searchNotice(@RequestParam(value="searchstr") String searchstr,
		@RequestParam(value = "p", defaultValue = "1") int pageNum,
		@RequestParam(value = "per", defaultValue = "10") int per, Model m) {
		int admin_Num = Integer.parseInt(searchstr.trim());
		OwnerPagingDto searchList = ser.searchNotice(admin_Num, pageNum, per);
		m.addAttribute("searchList", searchList);
		int number = searchList.getCount() - (pageNum - 1) * per;
		m.addAttribute("number", number);
		m.addAttribute("searchstr", searchstr);
		return "view/board/a_noticeListSearch";
	}
	
	/*
	 * @GetMapping("/content") public String content(@RequestParam(value = "p") int
	 * pageNum, int num, Model m) { OwnerPagingDto dto = ser.getContent(num);
	 * m.addAttribute("article", dto); m.addAttribute("pageNum", pageNum); return
	 * "content"; }
	 */
	
	/*
	 * @RequestMapping("/list") public String getList() { return
	 * "board/a_noticeList"; }
	 */

	 @ModelAttribute("list")
	 public void noticeSel(Model model) {
		 List<OwnerNoticeDto> list = new ArrayList<OwnerNoticeDto>();
		list = ser.noticeSel();
		model.addAttribute("list", list);
	}
	 //�������� �ۼ��� ��¥��
	 @ModelAttribute("today")
	 public void today(Model model) {
		 Date today = new Date();
		 model.addAttribute("today",today);
	 }
	 //�������� �ۼ���
	 @RequestMapping("noticeWriteForm")
	 public String getadminWriteForm() {
		 return "view/board/a_noticeWrite";
	 }
	 //�������� ���
	 @RequestMapping(value = "noticeWrite", method = RequestMethod.POST)
		public String getadminWrite(OwnerNoticeDto dto, Model m) {
		 Date today = new Date();
		 dto.setOwner_Notice_Created_Day(today);
		 ser.noticeAdd(dto);
		 return "redirect:a_noticeList";
	 } 
	 //�������� Ŭ��������
	 @RequestMapping("noticeInfo")
	 public String noticeSel_1(@RequestParam(value="noticeNum") int noticeNum, Model model) {
		 OwnerNoticeDto choose = new OwnerNoticeDto();
		choose = ser.noticeSel_1(noticeNum);
		model.addAttribute("choose", choose);
		return "view/board/a_noticeUpdateDelete";
	}
	 //�˻����� �������� Ŭ��������
	 @RequestMapping("searchNoticeInfo")
	 public String searchNoticeSel_1(@RequestParam(value="noticeNum") int noticeNum, Model model) {
		 OwnerNoticeDto choose = new OwnerNoticeDto();
		choose = ser.noticeSel_1(noticeNum);
		model.addAttribute("choose", choose);
		return "view/board/a_SearchNoticeUpdateDelete";
	}
	 //�������� ����
	  @RequestMapping(value = "noticeUpdate", method = RequestMethod.POST)
	  public String noticeUp(OwnerNoticeDto dto, Model model) {
	  ser.noticeUp(dto);
	  model.addAttribute("noticeUpdate", dto);
	 return "redirect:a_noticeList";
	 }
	  //�������� ����
	  @RequestMapping("noticeDel")
	  public String noticeDel( @RequestParam("owner_Notice_Num") int owner_Notice_Num, Model model) {
	  ser.noticeDel(owner_Notice_Num);
	  return "redirect:a_noticeList";
	  }
	  
}
