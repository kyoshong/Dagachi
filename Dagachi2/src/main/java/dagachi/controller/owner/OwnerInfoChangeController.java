package dagachi.controller.owner;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import dagachi.dto.OwnerLoginDto;
import dagachi.service.owner.OwnerInfoChangeService;
import lombok.Setter;

@Controller
public class OwnerInfoChangeController {
	
	@Autowired
	@Setter
	private OwnerInfoChangeService service;
	
	@GetMapping("/ownerInfoChange")
	public String getOwnerInfoChangeForm(HttpSession session, Model model) throws Exception {
		int owner_num = ((OwnerLoginDto)session.getAttribute("member")).getOwner_num();
		OwnerLoginDto dto = service.getOwnerInfo(owner_num);
		model.addAttribute("ownerInfo",dto);
		
		
		return "owner/ownerInfo/o_ownerInfoChange";
	}
	
	@PostMapping("/ownerInfoChange")
	public String ownerInfoChange(OwnerLoginDto dto, HttpSession session) throws Exception{
		
		int owner_num = ((OwnerLoginDto)session.getAttribute("member")).getOwner_num();
		dto.setOwner_num(owner_num);
		
		
		
		service.postOwnerInfo(dto);
		return "owner/ownerInfo/o_ownerInfoChange";
	}

}
