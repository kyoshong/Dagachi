package dagachi.service.board;

import java.util.List;

import dagachi.model.board.FranchiseMembershipDetailsDto;

public interface FranchiseMembershipDetailsService {

	public List<FranchiseMembershipDetailsDto> selectList(FranchiseMembershipDetailsDto dto) throws Exception;
	
}
