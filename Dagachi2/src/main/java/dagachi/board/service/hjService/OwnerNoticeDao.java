package dagachi.board.service.hjService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import dagachi.board.model.hjModel.OwnerNoticeDto;

public class OwnerNoticeDao extends SqlSessionDaoSupport{
	
	public List<OwnerNoticeDto> noticeSel() {
		List<OwnerNoticeDto> list = new ArrayList<OwnerNoticeDto>();
		list = getSqlSession().selectList("OwnerNotice.noticeSel");
		return list;
	}
	
	public void noticeAdd(OwnerNoticeDto dto) {
		getSqlSession().selectList("OwnerNotice.noticeAdd", dto);
	}
	
	public void noticeUp(OwnerNoticeDto dto) {
		getSqlSession().selectOne("OwnerNotice.noticeUp", dto);
	}
	
	public void noticeDel(int owner_Notice_Num) {
		getSqlSession().selectList("OwnerNotice.noticeDel", owner_Notice_Num);
	}
	
	public OwnerNoticeDto noticeSel_1(int owner_Notice_Num) {
		return getSqlSession().selectOne("OwnerNotice.noticeSel_1", owner_Notice_Num);
		
	}
	
	public int count() {
		return getSqlSession().selectOne("OwnerNotice.count");
		
	}
	
	public int searchCount(int admin_Num) {
		return getSqlSession().selectOne("OwnerNotice.searchCount", admin_Num);
	}
	
	public List<OwnerNoticeDto> getList(int start,int per){
		Map<String, Integer> m = new HashMap<String, Integer>();
		List<OwnerNoticeDto> list = new ArrayList<OwnerNoticeDto>();
		m.put("start",start);
		m.put("per",per);
		list = getSqlSession().selectList("OwnerNotice.limitList",m);
		return list;
	}
	
	public List<OwnerNoticeDto> searchNotice(int admin_Num,int start,int per){
		Map<String, Integer> m = new HashMap<String, Integer>();
		List<OwnerNoticeDto> list = new ArrayList<OwnerNoticeDto>();
		m.put("start",start);
		m.put("per",per);
		m.put("admin_Num", admin_Num);
		list = getSqlSession().selectList("OwnerNotice.searchNotice",m);
		return list;
	}
	
}
