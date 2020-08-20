package dagachi.dao.owner;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import dagachi.dto.RestaurantInfoDto;

public class OwnerStoreManagementDao extends SqlSessionDaoSupport {
	
	public int modifyStoreInfo(RestaurantInfoDto dto) throws Exception {
		return getSqlSession().update("storeInfo.modifyStoreInfo",dto);
	}

}
