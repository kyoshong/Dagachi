package dagachi.dao.board;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import dagachi.model.board.FranchiseNewlistDto;

public class FranchiseNewlistDaoImpl extends SqlSessionDaoSupport implements FranchiseNewlistDao {
	
	@Override
	public List<FranchiseNewlistDto> list(FranchiseNewlistDto dto) throws Exception {
		return getSqlSession().selectList("franchiseList.FranchiseNewlist");
	}

	public int selectMax() {
		return getSqlSession().selectOne("franchiseList.max");
	}
	
	public void insert(FranchiseNewlistDto dto) {
		getSqlSession().insert("franchiseList.insert", dto);
	}
	
	public void insertRestaurantInfo(FranchiseNewlistDto dto) {
		getSqlSession().insert("franchiseList.insertRestaurantInfo",dto);
	}

	public FranchiseNewlistDto getContent(String restaurant_Num) {
		return getSqlSession().selectOne("franchiseList.one",restaurant_Num);
	}
	
	/*
	 * public void readCount(String restaurant_Num) {
	 * getSqlSession().update("franchiseList.readcount", restaurant_Num); }
	 */

	public int count() {
		return getSqlSession().selectOne("franchiseList.count");
	}
	
	public List<FranchiseNewlistDto> getList(int start,int per){
		Map<String, Integer> m = new HashMap<String, Integer>();
		m.put("start",start);
		m.put("per",per);
		return getSqlSession().selectList("franchiseList.list",m);
	}
	
	public void delete(String restaurant_Num) {
		getSqlSession().update("franchiseList.delete",restaurant_Num);
	}
}
