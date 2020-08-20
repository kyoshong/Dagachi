package dagachi.service.owner;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dagachi.dao.owner.OwnerStoreManagementDao;
import dagachi.dto.RestaurantInfoDto;
import lombok.Setter;

@Service
public class OwnerStoreManagementService {
	
	@Setter
	@Autowired
	private OwnerStoreManagementDao dao;
	
	public int modifyStoreInfo(RestaurantInfoDto dto) throws Exception {
		return dao.modifyStoreInfo(dto);
	}

}
