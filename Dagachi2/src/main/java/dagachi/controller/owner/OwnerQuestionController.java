package dagachi.controller.owner;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import dagachi.dto.OwnerQuestionDto;
import dagachi.dto.OwnerQuestionService;

@Controller
@RequestMapping
public class OwnerQuestionController {

	@Autowired
	private OwnerQuestionService service;

	// 게시물 목록
	@RequestMapping(value = "owner/o_list", method = RequestMethod.GET)
	public void getList(Model model) throws Exception {

		List<OwnerQuestionDto> list = null;
		list = service.list();
		model.addAttribute("list", list);
	}

	// 게시물 목록 + 페이징 추가
	@RequestMapping(value = "owner/o_listPage", method = RequestMethod.GET)
	public void getListPage(Model model, @RequestParam("num") int num) throws Exception {

		// 게시물 총 갯수
		int count = service.count();

		// 한 페이지에 출력할 게시물 갯수
		int postNum = 10;

		// 하단 페이징 번호 ([ 게시물 총 갯수 ÷ 한 페이지에 출력할 갯수 ]의 올림)
		int pageNum = (int) Math.ceil((double) count / postNum);

		// 출력할 게시물
		int displayPost = (num - 1) * postNum;

		// 한번에 표시할 페이징 번호의 갯수
		int pageNum_cnt = 10;

		// 표시되는 페이지 번호 중 마지막 번호
		int endPageNum = (int) (Math.ceil((double) num / (double) pageNum_cnt) * pageNum_cnt);

		// 표시되는 페이지 번호 중 첫번째 번호
		int startPageNum = endPageNum - (pageNum_cnt - 1);

		// 마지막 번호 재계산
		int endPageNum_tmp = (int) (Math.ceil((double) count / (double) pageNum_cnt));

		if (endPageNum > endPageNum_tmp) {
			endPageNum = endPageNum_tmp;
		}

		boolean prev = startPageNum == 1 ? false : true;
		boolean next = endPageNum * pageNum_cnt >= count ? false : true;

		List<OwnerQuestionDto> list = null;
		list = service.listPage(displayPost, postNum);
		model.addAttribute("list", list);
		model.addAttribute("pageNum", pageNum);

		// 시작 및 끝 번호
		model.addAttribute("startPageNum", startPageNum);
		model.addAttribute("endPageNum", endPageNum);

		// 이전 및 다음
		model.addAttribute("prev", prev);
		model.addAttribute("next", next);

		// 현재 페이지
		model.addAttribute("select", num);

	}

	@RequestMapping(value = "owner/o_write", method = RequestMethod.GET)
	public void getWrite() throws Exception {

	}

	// 게시물 작성
	@RequestMapping(value = "owner/o_write", method = RequestMethod.POST)
	public String postWrite(OwnerQuestionDto dto) throws Exception {
		service.write(dto);

		return "redirect:o_listPage?num=1";
	}

	// 게시물 조회
	@RequestMapping(value = "owner/o_view", method = RequestMethod.GET)
	public void getView(@RequestParam("owner_WriteNo") int owner_WriteNo, Model model) throws Exception {

		OwnerQuestionDto dto = service.view(owner_WriteNo);
		model.addAttribute("o_view", dto);
	}

	@GetMapping(value = "owner/o_modify")
	public void getModify(@RequestParam("owner_WriteNo") int owner_WriteNo, Model model) throws Exception {

		OwnerQuestionDto dto = service.view(owner_WriteNo);

		model.addAttribute("o_view", dto);
	}

	// 게시물 수정
	@PostMapping(value = "owner/o_modify")
	public String postModify(OwnerQuestionDto dto) throws Exception {
		service.modify(dto);
		return "redirect:o_listPage?num=1";
	}

	// 게시물 삭제
	@RequestMapping(value = "owner/o_delete", method = RequestMethod.GET)
	public String getDelete(@RequestParam("owner_WriteNo") int owner_WriteNo) throws Exception {

		service.delete(owner_WriteNo);

		return "redirect:o_listPage?num=1";
	}

}