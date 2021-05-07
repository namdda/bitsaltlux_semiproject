package co.kr.wdt.security;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import co.kr.wdt.user.vo.UserVo;

public class AuthInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//1. Handler 종류를 확인해본다.
		if(handler instanceof HandlerMethod == false) {
			// DefaultServletHandler가 처리하는 경우(보통, assets의 정적 자원 적븐)
			return true; // DefaultServlet으로 넘김
		}
		
		// 2. casting
		HandlerMethod handlerMethod = (HandlerMethod)handler;
		
		// 3. Method에 @Auth가 달려 있는지 확인
		Auth auth = handlerMethod.getMethodAnnotation(Auth.class);
		// auth.getrole()
		
		// 4. Method에 @Auth가 안달려있으면
		if(auth == null) {
			return true;
		}
		
		//5. @Auth가 달려있는 경우에는 인증(Authetication) 여부 확인
		HttpSession session = request.getSession();
		if(session == null) {
			response.sendRedirect("/login/loginPage.do");
			return false;
		}
		
		int authUserNo = (int)session.getAttribute("userNo");
		
		if(authUserNo == 0) {
			response.sendRedirect("/login/loginPage.do");
			return false;
		}
		
		return true;
	}
}