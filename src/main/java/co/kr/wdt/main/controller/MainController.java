package co.kr.wdt.main.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/main")
public class MainController {
	
	@RequestMapping(value="/mainPage.do", method={RequestMethod.GET, RequestMethod.POST})
	public String mainPage(HttpServletRequest request) {
		String redirectUrl = "main/mainPage";
		HttpSession session = request.getSession(false);
		if(session != null) {
			if(session.getAttribute("userId") == null) {
				redirectUrl ="redirect:/login/loginPage.do?Status=SESSIONOUT";
			}
		}
		return redirectUrl;
	}
}
