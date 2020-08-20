package dagachi.dao.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import dagachi.model.board.FranchiseMembershipDetailsDto;


public class FranchiseMembershipDetailsDaoImpl extends SqlSessionDaoSupport implements FranchiseMembershipDetailsDao{
	
	@Override
	public List<FranchiseMembershipDetailsDto> list(FranchiseMembershipDetailsDto dto) throws Exception {
		return getSqlSession().selectList("franchiseList.FranchiseList");
	}

	public int selectMax() {
		return getSqlSession().selectOne("franchiseList.maxInfo");
	}
	
	public FranchiseMembershipDetailsDto getContent(String restaurant_Num) {
		return getSqlSession().selectOne("franchiseList.oneInfo",restaurant_Num);
	}
	

	public int count() {
		return getSqlSession().selectOne("franchiseList.countInfo");
	}
	
	public List<FranchiseMembershipDetailsDto> getList(int start,int per){
		Map<String, Integer> m = new HashMap<String, Integer>();
		m.put("start",start);
		m.put("per",per);
		return getSqlSession().selectList("franchiseList.franchiseInfo",m);
	}
	
	public void deleteInfo(String restaurant_Num) {
		getSqlSession().update("franchiseList.deleteInfo",restaurant_Num);
	}

	public void update(FranchiseMembershipDetailsDto dto) {
		getSqlSession().update("franchiseList.updateInfo",dto);
	}
	
}
