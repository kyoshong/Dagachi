package dagachi.board.model.hjModel;

public class PagingVO {

	//ǥ�õ� ������ ��ȣ�� �����ϴ� ������
	//�⺻ ����������, �⺻ ������������, ��ü ��������
	int beginPageNumber;
	int endPageNumber;
	int totalPageCount;
	
	public PagingVO() {}
	
	public PagingVO(int beginPageNumber, int endPageNumber, int totalPageCount) {
		super();
		this.beginPageNumber = beginPageNumber;
		this.endPageNumber = endPageNumber;
		this.totalPageCount = totalPageCount;
	}

	//count : �Խñ� �� , per : �������� ��� �Խñۼ�
	public PagingVO paging(int requestPage, int count, int per) {
		if (count == 0) {
			return new PagingVO(0,0,0);
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
		return new PagingVO(beginNumber, endNumber, pageCount);
		
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
