package dagachi.board.service.hjService;

import java.util.ArrayList; 
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.tiles.request.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dagachi.board.model.hjModel.OwnerNoticeDto;
import dagachi.board.model.hjModel.OwnerPagingDto;
import dagachi.board.model.hjModel.PagingVO;

@Service
public class OwnerNoticeService{
	
	
	@Autowired
	OwnerNoticeDao dao;
	
	public void setDao(OwnerNoticeDao dao) {
		this.dao = dao;
	}
	
	
	public List<OwnerNoticeDto> noticeSel() {
		List<OwnerNoticeDto> list = new ArrayList<OwnerNoticeDto>();
		list = dao.noticeSel();
		return list;
	}
	

	public void noticeAdd(OwnerNoticeDto dto) {
		dao.noticeAdd(dto);
	}

	
	public void noticeUp(OwnerNoticeDto dto) {
		dao.noticeUp(dto);
	}

	public void noticeDel(int owner_Notice_Num) {
		dao.noticeDel(owner_Notice_Num);
	}

	public OwnerNoticeDto noticeSel_1(int owner_Notice_Num) {
		OwnerNoticeDto dto =  dao.noticeSel_1(owner_Notice_Num);
		return dto;
	}
	
	public OwnerPagingDto limitList(int pageNum, int per){
		int count = dao.count();
		if(count == 0) {
			return new OwnerPagingDto();
		}
		
		int start = (pageNum - 1) * per;	
		List<OwnerNoticeDto> dto = dao.getList(start, per);
		
		PagingVO p = new PagingVO().paging(pageNum, count, per);
		
		return new OwnerPagingDto(count,dto,pageNum,p.getTotalPageCount(),start,p);
	}
	
	public OwnerPagingDto searchNotice(int admin_Num, int pageNum, int per){
		int count = dao.searchCount(admin_Num);
		if(count == 0) {
			return new OwnerPagingDto();
		}
		
		int start = (pageNum - 1) * per;	
		List<OwnerNoticeDto> dto = dao.searchNotice(admin_Num, start, per);
		
		PagingVO p = new PagingVO().paging(pageNum, count, per);
		
		return new OwnerPagingDto(count,dto,pageNum,p.getTotalPageCount(),start,p);
	}
	
}
