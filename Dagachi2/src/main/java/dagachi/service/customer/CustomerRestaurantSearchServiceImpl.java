package dagachi.service.customer;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dagachi.dao.board.FranchiseMembershipDetailsDaoImpl;
import dagachi.dao.customer.CustomerRestaurantSearchDaoImpl;
import dagachi.dto.CustomerRestaurantSearchDto;
import dagachi.model.board.FranchiseNewlistDto;
import dagachi.model.customer.RestaurantInfoModel;
import dagachi.service.board.Paging;
import dagachi.service.board.Search;
import lombok.Setter;

@Service("CustomerRestaurantSearchServiceImpl")
public class CustomerRestaurantSearchServiceImpl implements  CustomerRestaurantSearchService{
	
	@Autowired
	private CustomerRestaurantSearchDaoImpl crsdi;
	
	@Override
	public List<CustomerRestaurantSearchDto> selectList(CustomerRestaurantSearchDto dto) throws Exception{
		List<CustomerRestaurantSearchDto> list = null;
		list = crsdi.list(dto);
		return list;
	}
	
	public CustomerRestaurantSearchDto listDetail(int owner_Num) throws Exception{
		return crsdi.listDetail(owner_Num);
	}
	
	public List<CustomerRestaurantSearchDto> listInfo(int owner_Num) throws Exception{
		return crsdi.listInfo(owner_Num);
	}
	
	public RestaurantInfoModel list(int pageNum, int per) {
		int count = crsdi.count();
		if(count == 0) {
			return new RestaurantInfoModel();
		}
		
		int start = (pageNum - 1) * per;	
		List<CustomerRestaurantSearchDto> list = crsdi.getList(start, per);
		
		Paging p = new Paging().paging(pageNum, count, per);
		
		return new RestaurantInfoModel(list,pageNum,p.totalPageCount,start,p,count);
	}

	public RestaurantInfoModel list(int pageNum, int per, String searchType, String searchType2, String keyword,String select_chk, int range){
		int count = crsdi.count();
		if(count == 0) {
			return new RestaurantInfoModel();
		}
		
		int start = (pageNum - 1) * per;	
		List<CustomerRestaurantSearchDto> list = crsdi.getList(start, per);
		
		Paging p = new Paging().paging(pageNum, count, per);
		
		return new RestaurantInfoModel(list,pageNum,p.totalPageCount,start,p,count);
	}
	
	/*
	 * public RestaurantInfoModel listAll(int pageNum, int per, String searchType,
	 * String searchType2, String keyword,String select_chk, int range){ int count =
	 * crsdi.count(); if(count == 0) { return new RestaurantInfoModel(); }
	 * 
	 * int start = (pageNum - 1) * per; List<CustomerRestaurantSearchDto> list =
	 * crsdi.getList(start, per);
	 * 
	 * Paging p = new Paging().paging(pageNum, count, per);
	 * 
	 * return new RestaurantInfoModel(list,pageNum,p.totalPageCount,start,p,count);
	 * }
	 */
	
	public void setDao(CustomerRestaurantSearchDaoImpl crsdi) {
		this.crsdi = crsdi;
	}

	@Override
	public List<CustomerRestaurantSearchDto> listAll(String searchType, String searchType2,String keyword,String select_chk, int range) throws Exception {
		System.out.println("SearviceList:"+searchType+searchType2+keyword+select_chk+range);
		return crsdi.listAll(searchType,searchType2,keyword,select_chk,range);
	}

	@Override
	public int countArticle(String searchType, String searchType2, String keyword,String select_chk, int range) throws Exception {
		System.out.println("SearviceCount:"+searchType+searchType2+keyword+select_chk+range);
		return crsdi.countArticle(searchType,searchType2,keyword,select_chk,range);
	}
	
	
}
