package dagachi.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dagachi.dao.admin.AdminCustomerInfoDao;
import dagachi.dao.admin.AdminReviewDao;
import dagachi.dto.ReviewListModel;
import dagachi.dto.CustomerInfoDto;
import dagachi.dto.CustomerInfoListModel;
import dagachi.dto.ReviewDto;
import dagachi.utils.Paging;
import lombok.Setter;

@Service("adminReviewService")
public class AdminReviewService {
	@Setter

	@Autowired
	AdminReviewDao dao;

	

	public ReviewDto customerOne(int num) {
		return dao.customerOne(num);
	}

	public ReviewDto one(int num) {
		return dao.one(num);
	}

	public ReviewDto ownerOne(int num) {
		return dao.ownerOne(num);
	}

	public ReviewListModel list(int pageNum, int per) {
		int count = dao.count();
		if (count == 0) {
			return new ReviewListModel();
		}

		int start = (pageNum - 1) * per;
		List<ReviewDto> list = dao.getList(start, per);

		Paging p = new Paging().paging(pageNum, count, per);

		return new ReviewListModel(list, pageNum, p.getTotalPageCount(), start, p, count);
	}

	public ReviewListModel listSearch
	(int pageNum, int per, String searchType, String keyword) throws Exception {
		int count = dao.searchCount(searchType, keyword);
		if (count == 0) {return new ReviewListModel();
		}

		int start = (pageNum - 1) * per;
		List<ReviewDto> list = dao.search(start, per, searchType, keyword);

		Paging p = new Paging().paging(pageNum, count, per);
		
		
		  p.setSearchTypeKeyword(searchType, keyword);
			
		return new ReviewListModel(list, pageNum, p.getTotalPageCount(), start, p, count);
	}
	public int searchCount(String searchType, String keyword) throws Exception {
		 return dao.searchCount(searchType, keyword);
	}


	public void delete(int num) {
		dao.delete(num);
	}

}