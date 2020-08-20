package dagachi.service.owner;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dagachi.dao.owner.OwnerMenuManagementDao;
import dagachi.dto.MenuDto;
import lombok.Setter;

@Service
public class OwnerMenuManagementService {

	@Setter
	@Autowired
	private OwnerMenuManagementDao dao;
	
	public List<MenuDto> menuList(int owner_Num) throws Exception{
		return dao.menuList(owner_Num);
	}
	
	public List<MenuDto> menuContent(int menu_Num) throws Exception {
		return dao.menuContent(menu_Num);
	}
	
	public int enrollMenu(MenuDto dto) throws Exception {
		return dao.enrollMenu(dto);
	}
	
	public int modifyMenu(MenuDto dto) throws Exception {
		return dao.modifyMenu(dto);
	}
	
	public int deleteMenu(int menu_Num) throws Exception {
		return dao.deleteMenu(menu_Num);
	}
	
}
