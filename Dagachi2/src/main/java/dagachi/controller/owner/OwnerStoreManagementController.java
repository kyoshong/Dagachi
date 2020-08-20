package dagachi.controller.owner;

import java.io.File;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import dagachi.dto.RestaurantInfoDto;
import dagachi.service.owner.OwnerStoreManagementService;
import dagachi.utils.UploadFileUtils;
import lombok.Setter;


@Controller
public class OwnerStoreManagementController {
	
	@Setter
	@Autowired
	private OwnerStoreManagementService service;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@GetMapping("/storeInfoChangeForm")
	public String getStoreInfoChangeForm() throws Exception {
		 
			
		return "owner/store/o_storeInfoChange";
	}
	
	@PostMapping("/storeInfoChangeForm")
	public String storeInfoChange(RestaurantInfoDto dto,MultipartFile file) throws Exception {
		
		String imgUploadPath = uploadPath + File.separator + "restaurantInfoImage"; //폴더명
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;

		if(file != null) {
		 fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
		} else {
		 fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}

		dto.setRestaurant_Pic(File.separator + "restaurantInfoImage" + ymdPath + File.separator + fileName);
		
		//
		if(dto.getDating()==null) {
			dto.setDating("N");
		}
		if(dto.getGroupReserv()==null) {
			dto.setGroupReserv("N");
		}
		if(dto.getFriend()==null) {
			dto.setFriend("N");
		}
		if(dto.getFamily()==null) {
			dto.setFamily("N");
		}
		
		service.modifyStoreInfo(dto);
		return "redirect:storeInfoChangeForm";
	}

}
