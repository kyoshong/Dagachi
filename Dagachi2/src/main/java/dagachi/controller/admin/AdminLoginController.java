package dagachi.controller.admin;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dagachi.dto.AdminLoginDto;
import dagachi.dto.AdminSignUpDto;
import dagachi.service.admin.AdminLoginService;

@Controller
public class AdminLoginController {

	@Inject
	private AdminLoginService service;

	// 회원가입폼 작성 get
	@GetMapping(value = "admin/a_adminInsert")
	public String getRegister(AdminSignUpDto dto) throws Exception {
		return "admin/a_adminInsert";
	}

	// 회원가입폼 작성 post
	@PostMapping(value = "admin/a_adminInsert")
	public String postRegister(AdminSignUpDto dto) throws Exception {
		service.register(dto);
		return "admin/a_login"; // 회원가입 완료시 afterSignUp로 리턴함
	}

	// 로그인get
	@RequestMapping(value = "admin/a_login", method = RequestMethod.GET)
	public String getLogin(AdminSignUpDto dto) throws Exception {
		return "admin/a_login";
	}

	// 로그인post
	@RequestMapping(value = "admin/a_login", method = RequestMethod.POST)
	public String postLogin(AdminLoginDto dto, HttpServletRequest req, 
			RedirectAttributes rttr) throws Exception {

		HttpSession session = req.getSession();

		AdminLoginDto login = service.login(dto);

		if (login == null) {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
		} else {
			session.setAttribute("member", login);
		}
		return "redirect:a_login";
	}

	// 로그아웃
	@GetMapping(value = "/admin/admin_logout")
	public String logout(HttpSession session) throws Exception {
		session.invalidate();

		return "redirect:admin/a_login";
	}

}