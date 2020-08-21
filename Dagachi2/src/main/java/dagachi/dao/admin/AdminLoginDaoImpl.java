package dagachi.dao.admin;

import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import dagachi.dto.AdminLoginDto;
import dagachi.dto.AdminSignUpDto;

@Repository
public class AdminLoginDaoImpl implements AdminLoginDao {

	// 데이터베이스
	@Inject
	private SqlSession sql;

	// 매퍼
	private static String namespace = "AmemberMapper";

	// 회원가입
	public void register(AdminSignUpDto dto) throws Exception {
		sql.insert(namespace + ".Aregister", dto);
	}
	
	public void insert(AdminSignUpDto dto) throws Exception {
		sql.insert(namespace + ".Aregister", dto);
	}
	
	public AdminLoginDto login(AdminLoginDto dto) throws Exception {
		return sql.selectOne(namespace + ".Alogin", dto);
	}
}