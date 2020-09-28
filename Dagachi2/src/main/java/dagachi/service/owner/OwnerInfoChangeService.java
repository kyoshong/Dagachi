package dagachi.service.owner;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dagachi.dao.owner.OwnerInfoChangeDao;
import dagachi.dto.OwnerLoginDto;
import lombok.Setter;

@Service
public class OwnerInfoChangeService {
	
	
	@Setter
	@Autowired
	private OwnerInfoChangeDao dao;
	
	public OwnerLoginDto getOwnerInfo(int owner_num) throws Exception {
		return dao.getOwnerInfo(owner_num);
	}
	
	public int postOwnerInfo(OwnerLoginDto dto) throws Exception {
		return dao.postOwnerInfoChange(dto);
	}
	

}
