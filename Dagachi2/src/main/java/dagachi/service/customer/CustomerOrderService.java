package dagachi.service.customer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dagachi.dao.customer.CustomerOrderDao;
import dagachi.dto.CustomerOrderDto;
import lombok.Setter;

@Service("CustomerOrderService")
public class CustomerOrderService {
	@Setter
	@Autowired
	CustomerOrderDao dao;
  
	public List<CustomerOrderDto> list(int num) {
		return dao.list(num);
	}
	public void delete(int num) {
		dao.delete(num);
	}
	public void add(CustomerOrderDto dto) {
		dao.add(dto);
	}
	public List<CustomerOrderDto> listByOwner(int num, String date) {
		return dao.listByOwner(num, date);
	}
}
