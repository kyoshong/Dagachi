package dagachi.service.admin;

import javax.inject.Inject;
import org.springframework.stereotype.Service;

import dagachi.dao.admin.AdminLoginDao;
import dagachi.dto.AdminLoginDto;
import dagachi.dto.AdminSignUpDto;
import lombok.Setter;

@Service
public class AdminLoginServiceImpl implements AdminLoginService {

	@Inject
	private AdminLoginDao dao;

	// 회원가입
	@Override
	public void register(AdminSignUpDto dto) throws Exception {
		System.out.println(dto);
		dao.insert(dto);
	}

	public void insert(AdminSignUpDto dto) throws Exception {
		dao.insert(dto);
	}

	@Override
	public AdminLoginDto login(AdminLoginDto dto) throws Exception {
		return dao.login(dto);
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

}