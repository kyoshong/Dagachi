package dagachi.controller.customer;

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

import dagachi.dto.ReviewDto;
import dagachi.dto.ReviewDtoHK;
import dagachi.service.customer.CustomerRestaurantReviewService;
import dagachi.utils.PageHK;
import dagachi.utils.UploadFileUtils;
import lombok.Setter;

@Controller
public class CustomerRestaurantReviewController {
	@Setter
	@Autowired
	CustomerRestaurantReviewService service;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	
	@GetMapping("/postReview")
	public String getPostPage(Model model, @RequestParam("num") int num,@RequestParam("owner_Num") int owner_Num) throws Exception {
		 
			PageHK page = new PageHK();
			page.setNum(num);
			page.setCount(service.countAll(owner_Num));  

			List<HashMap<String,Integer>> list = null; 
			list = service.listPage(owner_Num, page.getDisplayPost(), page.getPostNum());
			
			model.addAttribute("list", list);   
			model.addAttribute("page", page);
			model.addAttribute("select", num);
			
		return "customer/review/c_restaurantReview";
	}
	
	@PostMapping("/postReview") //리뷰 작성하기+사진까지
	public String post(ReviewDtoHK dto,MultipartFile file) throws Exception {
		
		String imgUploadPath = uploadPath + File.separator + "reviewImage"; //폴더명
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;

		if(file != null) {
		 fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
		} else {
		 fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}

		dto.setReview_Pic(File.separator + "reviewImage" + ymdPath + File.separator + fileName);
		dto.setReview_Thumb_Pic(File.separator + "reviewImage" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		
		
		service.post(dto);
		return "redirect:postReview?owner_Num="+dto.getOwner_Num()+"&num=1";
		
	}
	
	@GetMapping("/delete")
	public String getDelete(ReviewDtoHK dto,MultipartFile file) throws Exception {
				
		service.deleteReview(dto.getReview_Num());
		return "redirect:reviewCustomerList?owner_Num=12&num=1";
	}
	
	//목록 + 페이징 추가
	@GetMapping("/reviewCustomerList")
	public String getListPage(Model model, @RequestParam("num") int num,@RequestParam("owner_Num") int owner_Num) throws Exception {
	 
		PageHK page = new PageHK();
		page.setNum(num);
		page.setCount(service.countAll(owner_Num));  

		List<HashMap<String,Integer>> list = null; 
		list = service.listPage(owner_Num, page.getDisplayPost(), page.getPostNum());
		
		model.addAttribute("list", list);   
		model.addAttribute("page", page);
		model.addAttribute("select", num);
				
	 
	 return "customer/review/c_accountReview";
	}
	
	
	
}
