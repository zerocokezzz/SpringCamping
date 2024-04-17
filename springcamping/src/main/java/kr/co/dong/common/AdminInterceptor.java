package kr.co.dong.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.lang.Nullable;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import kr.co.dong.DTO.UserDTO;

public class AdminInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		UserDTO user = (UserDTO)session.getAttribute("user");
		
		if(user == null) {
			response.sendRedirect(request.getContextPath()+"/login/login");
			return false;
		} else if(!(user.getUser_id().equals("admin@naver.com"))) {
			response.sendRedirect(request.getContextPath() + "/login/login");
			return false;
		}

		return true;
	}


	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, @Nullable ModelAndView modelAndView) throws Exception {
		
	}


	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

	}

}
