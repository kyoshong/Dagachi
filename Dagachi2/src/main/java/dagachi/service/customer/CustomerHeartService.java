package dagachi.service.customer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dagachi.dao.customer.CustomerHeartDao;
import dagachi.dto.CustomerHeartDto;
import lombok.Setter;
@Service("customerHeartService")

public class CustomerHeartService {
	@Setter
	@Autowired
	CustomerHeartDao dao;
  
	public List<CustomerHeartDto> list(int num) {
		return dao.list(num);
	}
	public void delete(int num) {
		dao.delete(num);
	}
	public void add(CustomerHeartDto dto) {
		dao.add(dto);
	}
	  
}
