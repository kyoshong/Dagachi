package dagachi.model.board;

import java.util.ArrayList;
import java.util.List;

import dagachi.service.board.Paging;

public class BoardListModel {
	private int count;
	private List<FranchiseNewlistDto> boardList;
	private int requestPage;
	private int totalPageCount;
	private int startRow;
	private Paging p;
	

	public BoardListModel() {
		this(new ArrayList<FranchiseNewlistDto>(), 0, 0, 0, new Paging(), 0);
	}

	public BoardListModel(List<FranchiseNewlistDto> boardList, int requestPage, 
			int totalPageCount, int startRow, Paging p, int count) {
		super();
		this.boardList = boardList;
		this.requestPage = requestPage;
		this.totalPageCount = totalPageCount;
		this.startRow = startRow;
		this.p = p;
		this.count = count;

	}
	

	public List<FranchiseNewlistDto> getBoardList() {
		return boardList;
	}

	public void setBoardList(List<FranchiseNewlistDto> boardList) {
		this.boardList = boardList;
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

	public void setCount(int count) {
		this.count = count;
	}

	public int getCount() {
		return count;
	}

}
