package dagachi.service.customer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dagachi.dao.customer.CustomerOrderPageDao;
import dagachi.dto.CustomerOrderDto;
import lombok.Setter;

@Service
public class CustomerOrderPageService {

	@Setter
	@Autowired
	private CustomerOrderPageDao dao;
	
	public int makeReservation(CustomerOrderDto dto) throws Exception {
		
		return dao.makeReservation(dto);
	}
	
	
}
