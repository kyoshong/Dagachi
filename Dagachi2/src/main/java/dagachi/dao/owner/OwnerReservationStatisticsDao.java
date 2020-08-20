package dagachi.dao.owner;

import org.mybatis.spring.support.SqlSessionDaoSupport;

public class OwnerReservationStatisticsDao extends SqlSessionDaoSupport {
	
	//시간별
	public int time9to12(int owner_Num) throws Exception {
		return getSqlSession().selectOne("analyzeChart.time9to12",owner_Num);
	}
	
	public int time12to15(int owner_Num) throws Exception {
		return getSqlSession().selectOne("analyzeChart.time12to15",owner_Num);
	}
	
	public int time15to18(int owner_Num) throws Exception {
		return getSqlSession().selectOne("analyzeChart.time15to18",owner_Num);
	}
	
	public int time18to21(int owner_Num) throws Exception {
		return getSqlSession().selectOne("analyzeChart.time18to21",owner_Num);
	}
	
	public int time21to24(int owner_Num) throws Exception {
		return getSqlSession().selectOne("analyzeChart.time21to24",owner_Num);
	}
	
	
	//인원별
	public int number1to2(int owner_Num) throws Exception {
		return getSqlSession().selectOne("analyzeChart.number1to2",owner_Num);
	}
	
	public int number3to4(int owner_Num) throws Exception {
		return getSqlSession().selectOne("analyzeChart.number3to4",owner_Num);
	}
	
	public int number5to8(int owner_Num) throws Exception {
		return getSqlSession().selectOne("analyzeChart.number5to8",owner_Num);
	}
	
	public int numberMoreThan9(int owner_Num) throws Exception {
		return getSqlSession().selectOne("analyzeChart.numberMoreThan9",owner_Num);
	}

}
