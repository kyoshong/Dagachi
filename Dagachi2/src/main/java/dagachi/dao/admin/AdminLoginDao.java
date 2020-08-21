package dagachi.dao.admin;

import dagachi.dto.AdminLoginDto;
import dagachi.dto.AdminSignUpDto;

public interface AdminLoginDao {
	public void register(AdminSignUpDto dto) throws Exception;
	
	public void insert(AdminSignUpDto dto) throws Exception;
	
	public AdminLoginDto login(AdminLoginDto dto) throws Exception;//수정

}