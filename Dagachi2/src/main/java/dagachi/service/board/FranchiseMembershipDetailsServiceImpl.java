package dagachi.service.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dagachi.dao.board.FranchiseMembershipDetailsDaoImpl;
import dagachi.model.board.BoardInfoListModel;
import dagachi.model.board.FranchiseMembershipDetailsDto;

@Service("FranchiseMembershipDetailsServiceImpl")
public class FranchiseMembershipDetailsServiceImpl implements FranchiseMembershipDetailsService{

	@Autowired
	private FranchiseMembershipDetailsDaoImpl fmdi;
	
	@Override
	public List<FranchiseMembershipDetailsDto> selectList(FranchiseMembershipDetailsDto dto) throws Exception {
		List<FranchiseMembershipDetailsDto> list = null;
		list = fmdi.list(dto);
		return list;
	}

	public BoardInfoListModel list(int pageNum, int per){
		int count = fmdi.count();
		if(count == 0) {
			return new BoardInfoListModel();
		}
		
		int start = (pageNum - 1) * per;	
		List<FranchiseMembershipDetailsDto> list = fmdi.getList(start, per);
		
		Paging p = new Paging().paging(pageNum, count, per);
		
		return new BoardInfoListModel(list,pageNum,p.totalPageCount,start,p,count);
	}
	
	public void setDao(FranchiseMembershipDetailsDaoImpl fmdi) {
		this.fmdi = fmdi;
	}
	
	public FranchiseMembershipDetailsDto updateForm(String restaurant_Num){
		return fmdi.getContent(restaurant_Num);
	}
	
	public void delete(String restaurant_Num){
		fmdi.deleteInfo(restaurant_Num);
		}
	public void update(FranchiseMembershipDetailsDto dto){
		fmdi.update(dto);
		}
		
}
