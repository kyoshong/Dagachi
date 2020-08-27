package dagachi.controller.owner;

import java.io.IOException;
import java.util.HashMap;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dagachi.dto.EmailVO;
import dagachi.dto.OwnerLoginDto;
import dagachi.service.owner.OwnerLoginService;
import lombok.Setter;

@Controller
public class OwnerLoginController {
	@Setter
	@Autowired
	OwnerLoginService service;
	JavaMailSender mailSender;
	
	@RequestMapping(value = "/loginOwner", method = RequestMethod.GET)
	public String loginform() throws Exception {

		return "owner/login";
	}
	@RequestMapping(value = "/findPassword", method = RequestMethod.GET)
	public String findPassword(Model m) throws Exception {
		return "owner/findPassword";
	}
	// 로그인
	@PostMapping(value = "/loginOwner")
	public String login(OwnerLoginDto vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception {

		HttpSession session = req.getSession();

		OwnerLoginDto login = service.login(vo);
		if (login == null) {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
		} else {
			session.setAttribute("member", login);
		}
		return "redirect:/owner/loginOwner";
	}

	// 로그아웃
	@GetMapping(value = "/logoutOwner")
	public String logout(HttpSession session) throws Exception {
		session.invalidate();

		return "owner/login";
	}

	// mailSending 코드
	@ResponseBody
	@RequestMapping(value = "/findPassword", method = { RequestMethod.GET, RequestMethod.POST })
	public boolean mailSending(HttpServletRequest request, String owner_email) throws IOException {
		int num = 0;
		try {
			num = service.one(owner_email);

		} catch (Exception e) {
			e.printStackTrace();
		}
		if (num != 0) {

			EmailVO email = new EmailVO();

			Random r = new Random();
			int certiNum = r.nextInt(4589362) + 49311; // 이메일로 받는 인증코드 부분 (난수)
			System.out.println(certiNum);
			String receiver = owner_email; // 받는 사람 이메일
			String subject = "비밀번호 찾기 이메일 입니다."; // 제목
			String content =

					System.getProperty("line.separator") + // 한줄씩 줄간격을 두기위해 작성

							System.getProperty("line.separator") +

							"안녕하세요 사장님 비밀번호 찾기"

							+ System.getProperty("line.separator") +

							System.getProperty("line.separator") +

							" 인증번호는 " + certiNum + " 입니다. "

							+ System.getProperty("line.separator") +

							System.getProperty("line.separator") +

							"받으신 인증번호를 홈페이지에 입력해 주시면 새로운 비밀번호 설정이 가능합니다."; // 내용
			email.setReceiver(receiver);

			email.setSubject(subject);

			email.setContent(content);
			System.out.println("받는 이메일 ::" + receiver);
			boolean result = service.mailSend(email);
			System.out.println("결과 ::" + result);

			HttpSession session = request.getSession();
			session.setAttribute("num" + owner_email, certiNum);
			return result;
		} else {
			
			return false;
		}
	}

	// 이메일로 받은 인증번호를 입력하고 전송 버튼을 누르면 맵핑되는 메소드.
	// 내가 입력한 인증번호와 메일로 입력한 인증번호가 맞는지 확인해서 맞으면 회원가입 페이지로 넘어가고,
	// 틀리면 다시 원래 페이지로 돌아오는 메소드
	@ResponseBody
	@RequestMapping(value = "/insertCodeOwner", method = { RequestMethod.GET, RequestMethod.POST })
	public boolean join_certification(HttpServletRequest request, String inputCode, String owner_email)
			throws IOException {

		System.out.println("입력한 인증번호 : " + inputCode);

		HttpSession session = request.getSession();
		boolean result = service.emailCertification(session, owner_email, Integer.parseInt(inputCode));
		System.out.println(result);
		return result;

	}
	
	@RequestMapping(value = "/newPassword", method = {RequestMethod.GET,RequestMethod.POST})
	public String joinInfo(@RequestParam(value = "owner_email")String owner_email, 
			Model m) throws Exception {
		m.addAttribute("owner_email", owner_email);
	
		return "owner/changePassword";
	}

	// 비밀번호 찾기 / 변경
	@PostMapping("/newPassword")
	public String updateMyinfo(Model model, String owner_password, String owner_email) throws Exception {

		HashMap<String, Object> map = new HashMap<>();

		map.put("owner_password", owner_password);
		map.put("owner_email", owner_email);
		service.update(map);
		return "owner/login";
	}
}
