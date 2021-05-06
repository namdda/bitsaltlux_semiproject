package co.kr.wdt.security;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import co.kr.wdt.login.service.LoginService;
import co.kr.wdt.login.vo.LoginVo;
import co.kr.wdt.user.vo.UserVo;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	
	// Interceptor도 Web Application Cotainer 안에 생기므로, @Autowired로 주입받을 수 있다.
	@Autowired
	private LoginService loginService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String password = (request.getParameter("userPw") != null) ? request.getParameter("userPw") : "";
		// 해당 메소드에서 사용하는 곳이 없어서 주석 처리했습니다. 
		// String redirectUrl = "redirect:/login/loginPage.do?Status=PWNE";
		UserVo userVo = new UserVo();
		LoginVo loginVo = new LoginVo();

		
		if(request.getParameter("inputId") != null  && !("".equals(request.getParameter("inputId")))) {
			loginVo.setInputId(request.getParameter("inputId"));
		}
		
		
		if(request.getParameter("userPw") != null  && !("".equals(request.getParameter("userPw")))) {
			loginVo.setUserPw(request.getParameter("userPw"));
		}
		
		
		userVo = loginService.loginProc(loginVo.getInputId());
		
		if(userVo != null) {
			if(BCrypt.checkpw(password, userVo.getUserPw())) {
				HttpSession session = request.getSession(true);
				session.setAttribute("userNo", userVo.getNo());
				session.setAttribute("userId", userVo.getInputId());
				session.setAttribute("userNm", userVo.getInputName());
				session.setAttribute("userMajor", userVo.getInputMajor());
				session.setAttribute("userSchool", userVo.getInputSchool());
				session.setAttribute("userLevel", userVo.getLevel());
				session.setAttribute("userPw", userVo.getUserPw());
				response.sendRedirect("/main/mainPage.do");
				return false;
			} else {
				response.sendRedirect("/login/loginPage.do?Status=PWNE");
				return false;
			}
		} 
		
		return false;
	}

}