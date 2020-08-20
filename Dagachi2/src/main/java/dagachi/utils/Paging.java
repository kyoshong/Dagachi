package dagachi.utils;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Paging {

	int beginPageNumber;
	int endPageNumber;
	int totalPageCount;
	private String searchTypeKeyword;

	public Paging() {
	}

	public Paging(int beginPageNumber, int endPageNumber, int totalPageCount) {
		super();
		this.beginPageNumber = beginPageNumber;
		this.endPageNumber = endPageNumber;
		this.totalPageCount = totalPageCount;
	}

	public Paging paging(int requestPage, int count, int per) {
		if (count == 0) {
			return new Paging(0, 0, 0);
		}
		int pageCount = count / per;
		if (count % per > 0) {
			pageCount++;
		}
		int beginNumber = (requestPage - 1) / 10 * 10 + 1;
		int endNumber = beginNumber + 9;
		if (endNumber > pageCount) {
			endNumber = pageCount;
		}
		return new Paging(beginNumber, endNumber, pageCount);

	}

	public void setSearchTypeKeyword(String searchType, String keyword) {

		if (searchType.equals("") || keyword.equals("")) {
			searchTypeKeyword = "";
		} else {
			searchTypeKeyword = "&searchType=" + searchType + "&keyword=" + keyword;
		}
	}

	public String getSearchTypeKeyword() {
		return searchTypeKeyword;
	}

	public int getBeginPageNumber() {
		return beginPageNumber;
	}

	public int getEndPageNumber() {
		return endPageNumber;
	}

	public int getTotalPageCount() {
		return totalPageCount;
	}

}
