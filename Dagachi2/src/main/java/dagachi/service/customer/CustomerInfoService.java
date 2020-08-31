package dagachi.service.customer;

import java.util.Date; 
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sun.javafx.collections.MappingChange.Map;

import dagachi.dao.customer.CustomerInfoDao;
import dagachi.dto.CustomerInfoDto;
import lombok.Setter;

@Service
public class CustomerInfoService {
	@Setter
	@Autowired
	private CustomerInfoDao dao;

	
	  public int add() throws Exception { 
		  Date now = new  Date(System.currentTimeMillis()); 
		CustomerInfoDto d = new CustomerInfoDto();
	  d.setCustomer_birth(now); 
	  d.setCustomer_email("qkrgytjd0827@naver.com");
	  d.setCustomer_gender("1"); 
	  d.setCustomer_Join_Date(now);
	  d.setCustomer_password("phs0827"); 
	  d.setCustomer_phoneNumber("010821851631");
	  d.setCustomer_name("qkrgy"); 
	  
	  return dao.add(d);
	  
	  }
	 
	public CustomerInfoDto one(int p) throws Exception {
		return dao.one(p);
	}

	
	public void update(HashMap<String, Object> map) throws Exception {
		 dao.update(map);
	}

	public void delete(int one) throws Exception {
		dao.delete(one);
	}

	public void delete(int num, String password)  throws PasswordCheckException{
		String db_password = dao.password(num);
		if(db_password.equals(password)){
			dao.delete(num);
		}else {
			throw new PasswordCheckException("패스워드 틀림");
		}
		
		
	}
}
