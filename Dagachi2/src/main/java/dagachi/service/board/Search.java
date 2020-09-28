package dagachi.service.board;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Search extends Paging{
	
	private String searchType;
	private String keyword;

}
