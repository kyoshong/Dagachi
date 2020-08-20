package dagachi.dao.board;

import java.util.List;

import dagachi.model.board.FranchiseNewlistDto;

public interface FranchiseNewlistDao {
	
	public List<FranchiseNewlistDto> list(FranchiseNewlistDto dto) throws Exception;

}
