package dagachi.service.board;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dagachi.dao.board.FranchiseNewlistDaoImpl;
import dagachi.model.board.BoardListModel;
import dagachi.model.board.FranchiseNewlistDto;

@Service("FranchiseNewlistServiceImpl")
public class FranchiseNewlistServiceImpl implements FranchiseNewlistService {
	
	@Autowired
	private FranchiseNewlistDaoImpl fndi;
	
	@Override
	public List<FranchiseNewlistDto> selectList(FranchiseNewlistDto dto) throws Exception {
		List<FranchiseNewlistDto> list = null;
		list = fndi.list(dto);
		return list;
	}

	public void insert(FranchiseNewlistDto dto) {
		Date date = new Date(System.currentTimeMillis());
		dto.setOwner_Join_Date(date);
		fndi.insert(dto);	
	}
	
	/*
	 * public FranchiseNewlistDto getContent(String restaurant_Num){
	 * fndi.readCount(restaurant_Num); return fndi.getContent(restaurant_Num); }
	 */
	
	public BoardListModel list(int pageNum, int per){
		int count = fndi.count();
		if(count == 0) {
			return new BoardListModel();
		}
		
		int start = (pageNum - 1) * per;	
		List<FranchiseNewlistDto> list = fndi.getList(start, per);
		
		Paging p = new Paging().paging(pageNum, count, per);
		
		return new BoardListModel(list,pageNum,p.totalPageCount,start,p,count);
	}
	
	public void setDao(FranchiseNewlistDaoImpl fndi) {
		this.fndi = fndi;
	}
	
	public FranchiseNewlistDto updateForm(String restaurant_Num){
		return fndi.getContent(restaurant_Num);
	}
	
	public void delete(String restaurant_Num){
		fndi.delete(restaurant_Num);
		}
}
