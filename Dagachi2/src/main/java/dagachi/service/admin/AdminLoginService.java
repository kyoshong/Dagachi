package dagachi.service.admin;

import dagachi.dto.AdminLoginDto;
import dagachi.dto.AdminSignUpDto;

public interface AdminLoginService {
	//회원가입
	public void register(AdminSignUpDto dto) throws Exception;
	
	public void insert(AdminSignUpDto dto) throws Exception;
	
	public AdminLoginDto login(AdminLoginDto dto) throws Exception;

	
}