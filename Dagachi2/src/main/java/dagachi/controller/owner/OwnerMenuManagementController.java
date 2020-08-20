package dagachi.controller.owner;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import dagachi.dto.MenuDto;
import dagachi.service.owner.OwnerMenuManagementService;
import dagachi.utils.UploadFileUtils;
import lombok.Setter;

@Controller
public class OwnerMenuManagementController {
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@Setter
	@Autowired
	private OwnerMenuManagementService service;
	
	@GetMapping("/menuList")
	public String getMenuList(Model model, @RequestParam("owner_Num") int owner_Num) throws Exception {
		
		List<MenuDto> list = null;
		list=service.menuList(owner_Num);
		model.addAttribute("menuList",list);
		
		return "owner/menu/o_menuManagement";
	}
	
	@GetMapping("/menuContent")
	public String getMenuContent(Model model, @RequestParam("menu_Num") int menu_Num) throws Exception {
		List<MenuDto> list =null;
		list=service.menuContent(menu_Num);
		model.addAttribute("menuContent",list);
		
		return "owner/menu/o_menuContent";
		
	}
	
	
	@GetMapping("/enrollMenu")
	public String getEnrollMenu() throws Exception {
			
		return "owner/menu/o_menuEnroll";
	}
	
	@PostMapping("/enrollMenu")
	public String EnrollMenu(MenuDto dto, MultipartFile file) throws Exception{
		
		String imgUploadPath = uploadPath + File.separator + "menuImage"; //폴더명
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;

		if(file != null) {
		 fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
		} else {
		 fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}

		dto.setMenu_Pic(File.separator + "menuImage" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		
				
		service.enrollMenu(dto);
		
		return "redirect:menuList?owner_Num=12";
	}
	
	@GetMapping("/modifyMenu")
	public String getModifyMenu(Model model, @RequestParam("menu_Num") int menu_Num) throws Exception {
		
		List<MenuDto> list =null;
		list=service.menuContent(menu_Num);
		model.addAttribute("menuContent",list);
		
		
		return "owner/menu/o_menuModify";
	}
	
	
	 @PostMapping("/modifyMenu") public String ModifyMenu(MenuDto dto,MultipartFile file,@RequestParam int menu_Num) throws Exception {
		 
		 String imgUploadPath = uploadPath + File.separator + "menuImage"; //폴더명
			String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
			String fileName = null;

			if(file != null) {
			 fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
			} else {
			 fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
			}

			dto.setMenu_Pic(File.separator + "menuImage" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		 
		 dto.setMenu_Num(menu_Num);
		 service.modifyMenu(dto);
		 return "redirect:menuContent?menu_Num="+menu_Num;
	 }
	 
	
	
	@GetMapping("/deleteMenu")
	public String getDeleteMenu(@RequestParam("menu_Num") int menu_Num) throws Exception {
		
		
		service.deleteMenu(menu_Num);
		
		return "redirect:menuList?owner_Num=12";
	}

}
