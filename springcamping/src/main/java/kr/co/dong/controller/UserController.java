package kr.co.dong.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.dong.DTO.UserDTO;
import kr.co.dong.service.UserService;

@Controller
public class UserController {
	private static final Logger logger = org.slf4j.LoggerFactory.getLogger(UserController.class);

	@Autowired
	UserService userService;

//	로그인폼으로 이동
	@GetMapping("login/login")
	public String login() {
		logger.info("login폼으로 이동");
		return "login/login";
	}

//	로그인
	@PostMapping("login/login")
	@ResponseBody
	public Object login(UserDTO ud, HttpServletRequest request, HttpServletResponse response, HttpSession session,
			Model model) throws UnsupportedEncodingException {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> resultMap = new HashMap<String, Object>();
		UserDTO userDTO = userService.login(ud);

		if (userDTO == null) {
			resultMap.put("login", false);
		} else {
			resultMap.put("login", true);
			session.setAttribute("user", userDTO);
		}
		return resultMap;
	}

//	카카오 로그인
	@PostMapping("login/kakao")
	@ResponseBody
	public Object loginKakao(UserDTO ud, HttpSession session) {
		UserDTO searchUser = userService.searchUser(ud);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		if (searchUser == null) {
			ud.setUser_admin(false);
			userService.signup(ud);
			resultMap.put("signup", true);
			session.setAttribute("user", ud);
		} else {
			resultMap.put("signup", false);
			session.setAttribute("user", searchUser);
		}
		return resultMap;
	}

//	로그아웃
	@GetMapping("login/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

//	회원가입폼으로 이동
	@GetMapping("login/signup")
	public String signup() {
		logger.info("signup폼으로 이동");
		return "login/signup";
	}

//	이메일 중복체크
	@PostMapping("login/emailcheck")
	@ResponseBody
	public Object emailCheck(UserDTO ud) {
		UserDTO userDTO = userService.emailCheck(ud);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		if (userDTO == null) {
			resultMap.put("check", true);
		} else {
			resultMap.put("check", false);
		}
		return resultMap;
	}

//	닉네임 중복체크
	@PostMapping("login/nickcheck")
	@ResponseBody
	public Object nickCheck(UserDTO ud) {
		UserDTO userDTO = userService.nickCheck(ud);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		if (userDTO == null) {
			resultMap.put("check", true);
		} else {
			resultMap.put("check", false);
		}
		return resultMap;
	}

//	회원가입
	@PostMapping("login/signup")
	@ResponseBody
	public Object signup(UserDTO ud, HttpSession session) {
		ud.setUser_intype("email");

		UserDTO phoneUser = userService.phoneCheck(ud);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		if (phoneUser == null) {
			ud.setUser_admin(false);
			userService.signup(ud);
			resultMap.put("signup", true);
			session.setAttribute("user", ud);
		} else {
			resultMap.put("signup", false);
		}
		return resultMap;
	}

// 아이디 비밀번호찾기 폼으로 이동
	@GetMapping("login/idFind")
	public String idFind() {
		return "login/idFind";

	}

}
