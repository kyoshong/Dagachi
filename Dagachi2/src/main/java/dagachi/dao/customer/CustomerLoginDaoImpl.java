package dagachi.dao.customer;

import java.util.HashMap;

import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import dagachi.dto.CustomerLoginDto;
import dagachi.dto.CustomerSignUpDto;

@Repository
public class CustomerLoginDaoImpl implements CustomerLoginDao {

	// 데이터베이스
	@Inject
	private SqlSession sql;

	// 매퍼
	private static String namespace = "CmemberMapper";

	// 회원가입
	public void register(CustomerSignUpDto dto) throws Exception {
		sql.insert(namespace + ".Cregister", dto);
	}
	
	// 회원가입
	public void insert(CustomerSignUpDto dto) throws Exception {
		sql.insert(namespace + ".Cregister", dto);
	}

	// 로그인
	@Override
	public CustomerLoginDto login(CustomerLoginDto dto) throws Exception {
		return sql.selectOne(namespace + ".CLogin", dto);
	}
	
	//아이디 중복확인
	public CustomerLoginDto idCheck(String customer_Email) throws Exception{
		return sql.selectOne(namespace + ".idCheck" , customer_Email);
	}

	//비밀번호찾기
	public int ID(String customer_Email) {
		return sql.selectOne(namespace + ".findPass", customer_Email);
	}

	@Override
	public void update(HashMap<String, Object> map) {
		sql.update(namespace + ".update", map);
	}
}