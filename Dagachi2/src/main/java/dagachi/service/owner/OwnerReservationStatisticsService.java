package dagachi.service.owner;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dagachi.dao.owner.OwnerReservationStatisticsDao;
import lombok.Setter;

@Service
public class OwnerReservationStatisticsService {
	
	@Setter
	@Autowired
	private OwnerReservationStatisticsDao dao;
	
	public int time9to12(int owner_Num) throws Exception {
		return dao.time9to12(owner_Num);
	}
	
	public int time12to15(int owner_Num) throws Exception {
		return dao.time12to15(owner_Num);
	}
	
	public int time15to18(int owner_Num) throws Exception {
		return dao.time15to18(owner_Num);
	}
	
	public int time18to21(int owner_Num) throws Exception {
		return dao.time18to21(owner_Num);
	}
	
	public int time21to24(int owner_Num) throws Exception {
		return dao.time21to24(owner_Num);
	}
	//인원별
	
	public int number1to2(int owner_Num) throws Exception {
		return dao.number1to2(owner_Num);
	}
	
	public int number3to4(int owner_Num) throws Exception {
		return dao.number3to4(owner_Num);
	}
	
	public int number5to8(int owner_Num) throws Exception {
		return dao.number5to8(owner_Num);
	}
	
	public int numberMoreThan9(int owner_Num) throws Exception {
		return dao.numberMoreThan9(owner_Num);
	}
}
