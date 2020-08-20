package dagachi.dao.owner;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import dagachi.dto.MenuDto;

public class OwnerMenuManagementDao extends SqlSessionDaoSupport {
	
	public List<MenuDto> menuList(int owner_Num) throws Exception{
		return getSqlSession().selectList("menu.menuList",owner_Num);
	}
	
	public List<MenuDto> menuContent(int menu_Num) throws Exception{
		return getSqlSession().selectList("menu.menuContent",menu_Num);
	}
	
	public int enrollMenu(MenuDto dto) throws Exception{
		return getSqlSession().insert("menu.enrollMenu",dto);
	}
	
	public int modifyMenu(MenuDto dto) throws Exception{
		return getSqlSession().update("menu.modifyMenu",dto);
	}
	
	public int deleteMenu(int menu_Num) throws Exception{
		return getSqlSession().delete("menu.deleteMenu",menu_Num);
	}

}
