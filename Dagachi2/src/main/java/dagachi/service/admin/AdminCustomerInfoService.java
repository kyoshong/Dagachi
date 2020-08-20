package dagachi.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dagachi.dao.admin.AdminCustomerInfoDao;
import dagachi.dao.admin.AdminReviewDao;
import dagachi.dao.customer.CustomerInfoDao;

import dagachi.dto.CustomerInfoDto;
import dagachi.dto.CustomerInfoListModel;

import dagachi.utils.Paging;
import lombok.Setter;

@Service("adminCustomerInfoService")
public class AdminCustomerInfoService {
	@Setter
	@Autowired
	private AdminCustomerInfoDao dao;

	public CustomerInfoDto one(int num) {
		return dao.one(num);
	}

	public CustomerInfoListModel list(int pageNum, int per) {
		int count = dao.count();
		if (count == 0) {
			return new CustomerInfoListModel();
		}

		int start = (pageNum - 1) * per;
		List<CustomerInfoDto> list = dao.getList(start, per);

		Paging p = new Paging().paging(pageNum, count, per);

		return new CustomerInfoListModel(list, pageNum, p.getTotalPageCount(), start, p, count);
	}

	public CustomerInfoListModel listSearch(int pageNum, int per, String searchType, String keyword) throws Exception {
		int count = dao.searchCount(searchType, keyword);
		System.out.println("count::"+count);
		  if (count == 0) { return new CustomerInfoListModel(); }
		 


		int start = (pageNum - 1) * per;
		List<CustomerInfoDto> list = dao.search(start, per, searchType, keyword);

		Paging p = new Paging().paging(pageNum, count, per);
		
		
		  p.setSearchTypeKeyword(searchType, keyword);
			
		return new CustomerInfoListModel(list, pageNum, p.getTotalPageCount(), start, p, count);
	}
	public int searchCount(String searchType, String keyword) throws Exception {
		 return dao.searchCount(searchType, keyword);
	}

	public void delete(int num) {
		dao.delete(num);
	}

	public int count() {
		return dao.count();
	}
}
