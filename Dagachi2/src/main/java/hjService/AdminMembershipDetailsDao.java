package dagachi.board.service.hjService;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import dagachi.board.model.hjModel.AdminMembershipDetailsDto;
import dagachi.board.model.hjModel.OwnerNoticeDto;

public class AdminMembershipDetailsDao extends SqlSessionDaoSupport{
	
	public List<AdminMembershipDetailsDto> adminSel() {
		List<AdminMembershipDetailsDto> list = new ArrayList<AdminMembershipDetailsDto>();
		list = getSqlSession().selectList("AdminQuery.adminSel");
		return list;
	}
	
	public AdminMembershipDetailsDto adminSel_1(int admin_Num) {
		AdminMembershipDetailsDto dto = new AdminMembershipDetailsDto();
		dto = getSqlSession().selectOne("AdminQuery.adminSel_1", admin_Num);
		return dto;
	}
	
	public void adminInsert(AdminMembershipDetailsDto dto) {
		getSqlSession().selectList("AdminQuery.adminAdd", dto);
	}
	
	public void adminUp(AdminMembershipDetailsDto dto) {
		getSqlSession().selectList("AdminQuery.adminUp", dto);
	}
	
	public void adminDel(int admin_Num) {
		getSqlSession().selectList("AdminQuery.adminDel", admin_Num);
	}
	
	public int count() {
		return getSqlSession().selectOne("AdminQuery.count");
		
	}
	
	public List<AdminMembershipDetailsDto> getList(int start,int per){
		Map<String, Integer> m = new HashMap<String, Integer>();
		List<AdminMembershipDetailsDto> list = new ArrayList<AdminMembershipDetailsDto>();
		m.put("start",start);
		m.put("per",per);
		list = getSqlSession().selectList("AdminQuery.limitList",m);
		return list;
	}
	
	
	
	
}
