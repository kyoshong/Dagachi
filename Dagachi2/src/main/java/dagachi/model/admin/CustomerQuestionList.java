package dagachi.model.admin;

import java.util.*;

import dagachi.dto.CustomerQuestionDto;
import dagachi.service.admin.Paging;

public class CustomerQuestionList {
	private int count;
	private List<CustomerQuestionDto> questionList;
	private int requestPage;;
	private int totalPageCount;
	private int startRow;;
	private Paging p;

	public CustomerQuestionList() {
		this(new ArrayList<CustomerQuestionDto>(), 0, 0, 0, new Paging(), 0);
	}

	public CustomerQuestionList(List<CustomerQuestionDto> questionList, 
			int requestPage, int totalPageCount, int startRow, Paging p, int count)
	{
		super();
		this.questionList = questionList;
		this.requestPage = requestPage;
		this.totalPageCount = totalPageCount;
		this.startRow = startRow;
		this.p = p;
		this.count = count;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public List<CustomerQuestionDto> getList() {
		return questionList;
	}

	public void setList(List<CustomerQuestionDto> questionList) {
		this.questionList = questionList;
	}

	public int getRequestPage() {
		return requestPage;
	}

	public void setRequestPage(int requestPage) {
		this.requestPage = requestPage;
	}

	public int getTotalPageCount() {
		return totalPageCount;
	}

	public void setTotalPageCount(int totalPageCount) {
		this.totalPageCount = totalPageCount;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public Paging getP() {
		return p;
	}

	public void setP(Paging p) {
		this.p = p;
	}

}
