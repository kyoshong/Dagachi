package dagachi.service.owner;

import java.util.Random;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.sun.mail.util.logging.MailHandler;

import dagachi.dao.owner.OwnerWaitingDao;
import dagachi.dto.EmailVO;
import dagachi.dto.OwnerWaitingDto;
import lombok.Setter;

@Service("ownerWaitingService")
public class OwnerWaitingService {

	@Setter
	@Autowired
	OwnerWaitingDao dao;
	@Setter
	@Autowired
	protected JavaMailSender mailSender;

	public void add(OwnerWaitingDto dto) throws Exception {
		dao.add(dto);
	}

	public OwnerWaitingDto one(String dto) {
		return dao.one(dto);
	}

	public boolean emailCertification(HttpSession session, String owner_email, int inputCode) {
		try {
			int generationCode = (int) session.getAttribute("num"+owner_email);
System.out.println("입력한 코드  ::"+inputCode);
System.out.println("실제 코드 ::"+generationCode);
			if (generationCode == inputCode) {
				return true;
			} else {
				return false;
			}

		} catch (Exception e) {
			throw e;
		}

	}

	public boolean mailSend(EmailVO email) {

		try {
			MimeMessage msg = mailSender.createMimeMessage();

			msg.setSubject(email.getSubject());

			// 일반 텍스트만 전송하려는 경우
			msg.setText(email.getContent());
			msg.setRecipient(RecipientType.TO, new InternetAddress(email.getReceiver()));

			mailSender.send(msg);

			return true;

		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return false;

	
	}
}
