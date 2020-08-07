package controller.customer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import lombok.Setter;
import service.customer.CustomerInfoService;

@Controller
public class CustomerInfoController {
		@Setter
	   @Autowired
	   CustomerInfoService service;

	   /*
	    * @GetMapping("/list") public ModelAndView getList() throws Exception {
	    * ModelAndView mav = new ModelAndView(); List<BoardVO> list = null; list =
	    * service.list(); mav.setViewName("boardEx/list"); mav.addObject("list", list);
	    * return mav; }
	    */

	   @GetMapping("/list")
	   public String getList(Model model) throws Exception {
	      String list = null;
	      list = service.print();

	      model.addAttribute("list", list);
	      return "boardEx/list";

	   }
	   
	   
	   @GetMapping("/write")
	   public String getWrite(Model model) throws Exception {
	      
	      return "boardEx/write";
	   }
	   
	   @PostMapping("/write")
	   public String write() throws Exception {
	      service.write();
	      
	      return "redirect:list";
	      
	   }


	}