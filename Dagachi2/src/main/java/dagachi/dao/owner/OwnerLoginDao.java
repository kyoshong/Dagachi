package dagachi.dao.owner;

import java.util.HashMap;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import dagachi.dto.OwnerLoginDto;

public class OwnerLoginDao extends SqlSessionDaoSupport {
	
	public OwnerLoginDto login(OwnerLoginDto dto) {
		return getSqlSession().selectOne("ownerLogin.login", dto);
		  
	}
	public int one(String owner_email) {
		return getSqlSession().selectOne("ownerLogin.findPassword", owner_email);
		  
	}
	
	public void update(HashMap<String, Object> map) {
		 getSqlSession().update("ownerLogin.update",map);
	}	
}
