package kr.co.dong.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dong.DAO.UserDAO;
import kr.co.dong.DTO.UserDTO;

@Service
public class UserServiceImpl implements UserService{
	@Autowired
	UserDAO userDAO;

	// 로그인
	@Override
	public UserDTO login(UserDTO ud) {
		// TODO Auto-generated method stub
		return userDAO.login(ud);
	}
	
	// 가입경로 검사
	@Override
	public UserDTO searchUser(UserDTO ud) {
		// TODO Auto-generated method stub
		return userDAO.searchUser(ud);
	}

	// 이메일 중복체크
	@Override
	public UserDTO emailCheck(UserDTO ud) {
		// TODO Auto-generated method stub
		return userDAO.emailCheck(ud);
	}

	// 닉네임 중복체크
	@Override
	public UserDTO nickCheck(UserDTO ud) {
		// TODO Auto-generated method stub
		return userDAO.nickCheck(ud);
	}
	
	// 핸드폰 번호 중복체크
	@Override
	public UserDTO phoneCheck(UserDTO ud) {
		// TODO Auto-generated method stub
		return userDAO.phoneCheck(ud);
	}

	// 회원가입
	@Override
	public int signup(UserDTO ud) {
		// TODO Auto-generated method stub
		return userDAO.signup(ud);
	}






}
