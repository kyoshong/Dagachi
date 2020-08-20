package dagachi.dao.board;

import java.util.List;

import dagachi.model.board.FranchiseMembershipDetailsDto;

public interface FranchiseMembershipDetailsDao {
	public List<FranchiseMembershipDetailsDto> list(FranchiseMembershipDetailsDto dto) throws Exception;

}
