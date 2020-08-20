package dagachi.board.model.hjModel;

import java.util.ArrayList;
import java.util.List;

import dagachi.board.model.hjModel.PagingVO;

public class OwnerPagingDto {
	
	//ǥ�õ� Dto�� �����ϴ� ������
	private int count;
	private List<OwnerNoticeDto> ownerList;//���� ���������� ������ �۵�
	private int requestPage;//��û������
	private int totalPageCount;//��ü ������ ��
	private int startRow;//���۱�
	private PagingVO p;
	
	public OwnerPagingDto() {
		this(0, new ArrayList<OwnerNoticeDto>(), 0, 0, 0, new PagingVO() );
	}

	public OwnerPagingDto(int count, List<OwnerNoticeDto> ownerList, int requestPage, int totalPageCount, int startRow, PagingVO p) {
		super();
		this.count = count;
		this.ownerList = ownerList;
		this.requestPage = requestPage;
		this.totalPageCount = totalPageCount;
		this.startRow = startRow;
		this.p = p;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public List<OwnerNoticeDto> getOwnerList() {
		return ownerList;
	}

	public void setOwnerList(List<OwnerNoticeDto> ownerList) {
		this.ownerList = ownerList;
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

	public PagingVO getP() {
		return p;
	}

	public void setP(PagingVO p) {
		this.p = p;
	}
	
}
