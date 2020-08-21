package dagachi.dao.customer;

import java.util.HashMap;

import dagachi.dto.CustomerLoginDto;
import dagachi.dto.CustomerSignUpDto;

public interface CustomerLoginDao {
	public void register(CustomerSignUpDto dto) throws Exception;

	public void insert(CustomerSignUpDto dto) throws Exception;

	public CustomerLoginDto login(CustomerLoginDto dto) throws Exception;

	public int ID(String customer_Email);

	public void update(HashMap<String, Object> map);


}