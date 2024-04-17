package kr.co.dong.DAO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dong.DTO.UserDTO;

@Repository
public class UserDAOImpl implements UserDAO{

	@Autowired
	SqlSession sqlSession;
	private static final String nameSpace = "kr.co.dong.userMapper";
	
	// 로그인
	@Override
	public UserDTO login(UserDTO ud) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(nameSpace + ".login", ud);
	}
	
	// 가입경로 검사
	@Override
	public UserDTO searchUser(UserDTO ud) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(nameSpace + ".searchUser", ud);
	}

	// 이메일중복체크
	@Override
	public UserDTO emailCheck(UserDTO ud) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(nameSpace + ".emailCheck", ud);
	}

	// 닉네임중복체크
	@Override
	public UserDTO nickCheck(UserDTO ud) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(nameSpace + ".nickCheck", ud);
	}
	
	// 핸드폰 번호 중복체크
	@Override
	public UserDTO phoneCheck(UserDTO ud) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(nameSpace + ".phoneCheck", ud);
	}
	
	// 회원가입
	@Override
	public int signup(UserDTO ud) {
		// TODO Auto-generated method stub
		return sqlSession.insert(nameSpace + ".signup", ud);
	}








}
