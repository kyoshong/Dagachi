package dagachi.dao.customer;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import dagachi.dto.CustomerOrderDto;

public class CustomerOrderPageDao extends SqlSessionDaoSupport {
	
	public int makeReservation(CustomerOrderDto dto) throws Exception { 
		return getSqlSession().insert("reservation.makeReservation",dto);
	}

}
