package dagachi.service.owner;

import java.util.HashMap;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dagachi.dao.owner.OwnerLoginDao;
import dagachi.dto.CustomerInfoDto;
import dagachi.dto.EmailVO;
import dagachi.dto.OwnerLoginDto;
import lombok.Setter;
@Service("OwnerLoginService")
public class OwnerLoginService {
	@Autowired
	@Setter
	OwnerLoginDao dao;
	@Setter
	@Autowired
	protected JavaMailSender mailSender;
	public OwnerLoginDto login(OwnerLoginDto dto) throws Exception {
		 return dao.login(dto);
		 
	}


	 
		public int one(String owner_email) throws Exception {
			int num = dao.one(owner_email);
			 return num;
		}

		
		public void update(HashMap<String, Object> map) throws Exception {
			 dao.update(map);
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
