package dagachi.dao.owner;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import dagachi.dto.OwnerWaitingDto;

public class OwnerWaitingDao extends SqlSessionDaoSupport {
	
	public void add(OwnerWaitingDto dto) {
		 getSqlSession().insert("ownerWaiting.insert", dto);
	}
	public OwnerWaitingDto one(String num) {
		return getSqlSession().selectOne("ownerWaiting.one", num);
		  
	}

}
