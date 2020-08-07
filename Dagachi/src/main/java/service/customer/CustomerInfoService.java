package service.customer;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.customer.CustomerInfoDao;
import dto.CustomerInfoDto;
import lombok.Setter;

@Service
public class CustomerInfoService {
	   @Autowired
	   private CustomerInfoDao dao;
	   
	   public int add() throws Exception {
			Date now = new Date(System.currentTimeMillis());
			CustomerInfoDto d = new CustomerInfoDto();
			 d.setCustomer_birth(now);
			 d.setCustomer_email("qkrgytjd0827@naver.com");
			 d.setCustomer_gender("wom");
			 d.setCustomer_Join_Date(now);
			 d.setCustomer_password("phs0827");
			 d.setCustomer_phoneNumber("010821851631");
			 d.setCustomer_name("qkrgy");
			 
			 return dao.add(d);
	   }
	   
	   public String print() throws Exception{
		   
	   }
}
