package dagachi.service.board;

import java.util.List;

import dagachi.model.board.FranchiseNewlistDto;

public interface FranchiseNewlistService {
	
	public List<FranchiseNewlistDto> selectList(FranchiseNewlistDto dto) throws Exception;

}
