package kr.co.dong.DAO;

import kr.co.dong.DTO.UserDTO;

public interface UserDAO {
	
	// 로그인
	public UserDTO login(UserDTO ud);
	
	// 가입경로 검사
	public UserDTO searchUser(UserDTO ud);
	
	// 이메일 중복체크
	public UserDTO emailCheck(UserDTO ud);
	
	// 닉네임 중복체크 
	public UserDTO nickCheck(UserDTO ud);
	
	// 핸드폰 번호 중복체크 
	public UserDTO phoneCheck(UserDTO ud);
	
	// 회원가입
	public int signup(UserDTO ud);
	

	
	
}
