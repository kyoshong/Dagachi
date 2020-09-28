package dagachi.service.board;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Paging {

	int beginPageNumber;
	int endPageNumber;
	public int totalPageCount;
	private String searchType;
	private String searchType2;
	private String keyword;
	String select_chk;
	int range;
	
	public Paging() {}
	
	public Paging(int beginPageNumber, int endPageNumber, int totalPageCount) {
		super();
		this.beginPageNumber = beginPageNumber;
		this.endPageNumber = endPageNumber;
		this.totalPageCount = totalPageCount;
	}

	public Paging paging(int requestPage, int count, int per) {
		if (count == 0) {
			return new Paging(0,0,0);
		}
		int pageCount = count / per;
		if (count % per > 0) {
			pageCount++;
		}
		int beginNumber = (requestPage - 1) / 10 * 10 + 1;
		int endNumber = beginNumber + 9;
		if(endNumber > pageCount) {
			endNumber = pageCount;
		}
		return new Paging(beginNumber, endNumber, pageCount);
		
	}
		
}
