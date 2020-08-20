package dagachi.dto;


import java.util.ArrayList;
import java.util.List;

import dagachi.utils.Paging;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Getter
@Setter
@ToString
public class ReviewListModel {
	
	private int count;
	private List<ReviewDto> boardList;//현재 페이지에서 보여질 글들
	private int requestPage;//요청페이지
	private int totalPageCount;//전체 페이지 수
	private int startRow;//시작글
	private Paging p;

	
	
	public ReviewListModel() {
		this(new ArrayList<ReviewDto>(), 0, 0, 0, new Paging(),0);	
	}
	
	public ReviewListModel(List<ReviewDto> boardList, int requestPage, int totalPageCount, int startRow, Paging p,int count) {
		super();
		this.boardList = boardList;
		this.requestPage = requestPage;
		this.totalPageCount = totalPageCount;
		this.startRow = startRow;
		this.p = p;

		this.count = count;
	
	}
}