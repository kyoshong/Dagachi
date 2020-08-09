package service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import dao.admin.AdminReviewDao;
import dto.BoardListModel;
import dto.ReviewDto;

@Service
public class AdminReviewService {

	@Autowired
	AdminReviewDao dao;

	public void setDao(AdminReviewDao dao) {
		this.dao = dao;
	}

	public ReviewDto customerOne(int num) {
		return dao.customerOne(num);
	}
	public ReviewDto one(int num) {
		return dao.one(num);
	}

	public ReviewDto ownerOne(int num) {
		return dao.ownerOne(num);
	}

	public BoardListModel list(int pageNum, int per) {
		int count = dao.count();
		if (count == 0) {
			return new BoardListModel();
		}

		int start = (pageNum - 1) * per;
		List<ReviewDto> list = dao.getList(start, per);

		Paging p = new Paging().paging(pageNum, count, per);

		return new BoardListModel(list, pageNum, p.totalPageCount, start, p, count);
	}

	public void delete(int num) {
		dao.delete(num);
	}

}
