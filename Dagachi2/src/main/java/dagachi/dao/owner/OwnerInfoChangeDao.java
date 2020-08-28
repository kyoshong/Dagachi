package dagachi.dao.owner;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import dagachi.dto.OwnerLoginDto;

public class OwnerInfoChangeDao extends SqlSessionDaoSupport {
	
	public OwnerLoginDto getOwnerInfo(int owner_num) throws Exception {
		return getSqlSession().selectOne("ownerInfoChange.getOwnerInfo",owner_num);
	}
	
	public int postOwnerInfoChange(OwnerLoginDto dto) throws Exception {
		return getSqlSession().update("ownerInfoChange.postOwnerInfoChange",dto);
	}

}
