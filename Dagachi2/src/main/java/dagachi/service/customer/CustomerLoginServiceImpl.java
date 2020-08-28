package dagachi.service.customer;

import java.util.HashMap;

import javax.inject.Inject;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import dagachi.dao.customer.CustomerLoginDao;
import dagachi.dto.CustomerLoginDto;
import dagachi.dto.CustomerSignUpDto;
import lombok.Setter;

@Service
public class CustomerLoginServiceImpl implements CustomerLoginService {

	@Inject
	private CustomerLoginDao dao;
	@Setter
	@Autowired
	protected JavaMailSender mailSender;

	// 회원가입
	@Override
	public void register(CustomerSignUpDto dto) throws Exception {
		System.out.println(dto);
		dao.insert(dto);
	}

	public void insert(CustomerSignUpDto dto) throws Exception {
		dao.insert(dto);
	}

	@Override
	public CustomerLoginDto login(CustomerLoginDto dto) throws Exception {
		return dao.login(dto);
	}
	
	public CustomerLoginDto idCheck(String customer_Email) throws Exception{
		return dao.idCheck(customer_Email);
	}

	public int ID(String customer_Email) {
		int num = dao.ID(customer_Email);
		return num;
	}

	public boolean emailCertification(HttpSession session, String customer_Email, int inputCode) {
		try {
			System.out.println("get"+"num" + customer_Email);
			int generationCode = (int) session.getAttribute("num" + customer_Email);
			System.out.println("입력한 코드  ::" + inputCode);
			System.out.println("실제 코드 ::" + generationCode);
			if (generationCode == inputCode) {
				return true;
			} else {
				return false;
			}

		} catch (Exception e) {
			throw e;
		}

	}

	public boolean mailSend(dagachi.dto.EmailDTO email) {
		try {
			MimeMessage msg = mailSender.createMimeMessage();

			msg.setSubject(email.getSubject());

			// 일반 텍스트만 전송하려는 경우
			msg.setText(email.getContent());
			msg.setRecipient(RecipientType.TO, new InternetAddress(email.getTo()));

			mailSender.send(msg);

			return true;

		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return false;
	}

	@Override
	public void update(HashMap<String, Object> map) {
		dao.update(map);

	}

}

/*
 * 
 * public boolean isLogin(String id) { boolean isLogin = false;
 * Enumeration<String> e = loginUsers.keys(); String key = ""; while
 * (e.hasMoreElements()) { key = (String) e.nextElement(); if
 * (id.equals(loginUsers.get(key))) isLogin = true; } return isLogin; }
 * 
 * public boolean isUsing(String sessionId) { boolean isUsing = false;
 * Enumeration<String> e = loginUsers.keys(); String key = ""; while
 * (e.hasMoreElements()) { key = (String) e.nextElement(); if
 * (sessionId.equals(loginUsers.get(key))) isUsing = true; } return isUsing; }
 * 
 * public void setSession(HttpSession session, CSignUpDTO dto) {
 * loginUsers.put(session.getId(), dto.getId()); session.setAttribute("id",
 * dto.getId()); }
 */
