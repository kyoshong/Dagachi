package dagachi.controller.owner;

import java.io.IOException;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dagachi.dto.EmailVO;
import dagachi.dto.OwnerWaitingDto;
import dagachi.service.owner.OwnerWaitingService;
import lombok.Setter;

@Controller

public class OwnerWaitingController {
	@Setter
	@Autowired
	OwnerWaitingService service;
	JavaMailSender mailSender;

	@RequestMapping(value = "/joinForm", method = RequestMethod.GET)
	public String join(Model m) throws Exception {
		return "owner/joinForm";
	}

	// mailSending 코드
	@ResponseBody
	@RequestMapping(value = "/emailSendOwner", method = {RequestMethod.GET,RequestMethod.POST})
	public void mailSending(HttpServletRequest request, String owner_email)
			throws IOException {	
				EmailVO email = new EmailVO();
				
			Random r = new Random();
			int certiNum = r.nextInt(4589362) + 49311; // 이메일로 받는 인증코드 부분 (난수)
System.out.println(certiNum);
			String receiver = owner_email; // 받는 사람 이메일
			String subject = "회원가입 인증 이메일 입니다."; // 제목
			String content =

					System.getProperty("line.separator") + // 한줄씩 줄간격을 두기위해 작성

							System.getProperty("line.separator") +

							"안녕하세요 사장님 저희 홈페이지를 찾아주셔서 감사합니다"

							+ System.getProperty("line.separator") +

							System.getProperty("line.separator") +

							" 인증번호는 " + certiNum + " 입니다. "

							+ System.getProperty("line.separator") +

							System.getProperty("line.separator") +

							"받으신 인증번호를 홈페이지에 입력해 주시면 다음으로 넘어갑니다."; // 내용
			email.setReceiver(receiver);

			email.setSubject(subject);

			email.setContent(content);
			System.out.println("받는 이메일 ::"+ receiver);
			boolean result = service.mailSend(email);
			System.out.println("결과 ::"+ result);
			
			
			
			HttpSession session = request.getSession();
		session.setAttribute("num"+owner_email, certiNum);

	}

	// 이메일로 받은 인증번호를 입력하고 전송 버튼을 누르면 맵핑되는 메소드.
	// 내가 입력한 인증번호와 메일로 입력한 인증번호가 맞는지 확인해서 맞으면 회원가입 페이지로 넘어가고,
	// 틀리면 다시 원래 페이지로 돌아오는 메소드
	@ResponseBody
	@RequestMapping(value = "/certificationOwner", method = {RequestMethod.GET,RequestMethod.POST})
	public boolean join_certification(HttpServletRequest request, String inputCode, String owner_email)
			throws IOException {

		System.out.println("입력한 인증번호 : " + inputCode);

		HttpSession session = request.getSession();
		boolean result = service.emailCertification(session, owner_email, Integer.parseInt(inputCode));
		System.out.println(result);
		return result;

	}
	
	@RequestMapping(value = "/joinInfoFormOwner", method = {RequestMethod.GET,RequestMethod.POST})
	public String joinInfo(@RequestParam(value = "owner_name")String owner_name, 
			@RequestParam(value = "owner_email")String owner_email, 
			@RequestParam(value = "owner_password")String owner_password, Model m) throws Exception {
		m.addAttribute("owner_name", owner_name);
		m.addAttribute("owner_email", owner_email);
		m.addAttribute("owner_password", owner_password);


		return "owner/joinInfo";
	}

	@PostMapping(value = "/joinPostOwner")
	public ModelAndView joinPost(OwnerWaitingDto dto,HttpSession session) 	throws Exception {

	ModelAndView mav = new ModelAndView(); 
	
	mav.setViewName("owner/joinPost");
	service.add(dto);

		return mav;
	}

}
