package dagachi.service.customer;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import dagachi.dto.CustomerLoginDto;
import dagachi.dto.CustomerSignUpDto;
import dagachi.dto.EmailDTO;

public interface CustomerLoginService {
	// 회원가입
	public void register(CustomerSignUpDto dto) throws Exception;

	public void insert(CustomerSignUpDto dto) throws Exception;

	public CustomerLoginDto login(CustomerLoginDto dto) throws Exception;
	
	public CustomerLoginDto idCheck(String customer_Email)throws Exception;

	public int ID(String customer_Email);

	public boolean mailSend(EmailDTO email);

	public void update(HashMap<String, Object> map);

	public boolean emailCertification(HttpSession session, String customer_Email, int parseInt);








}