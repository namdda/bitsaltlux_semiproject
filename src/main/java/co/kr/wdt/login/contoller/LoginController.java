package co.kr.wdt.login.contoller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import co.kr.wdt.login.service.LoginService;
import co.kr.wdt.login.vo.LoginVo;
import co.kr.wdt.user.vo.UserVo;

@Controller
@RequestMapping(value="/login")
public class LoginController {
	
	@Autowired
	private LoginService loginService;

	@RequestMapping(value="/loginPage.do", method=RequestMethod.GET)
	public String loginPage(@RequestParam(value="Status", required=false) String param, Model model) {
		model.addAttribute("param", param);
		return "login/loginPage";
	}
	
	@RequestMapping(value="/logOut.do", method=RequestMethod.GET)
	public String logOut(HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		session.invalidate();
		return "login/loginPage";
	}
	
	@RequestMapping(value="/loginProc.do", method=RequestMethod.POST)
	public String loginProc(@ModelAttribute LoginVo loginVo, HttpServletRequest request) {
		String redirectUrl = "redirect:/login/loginPage.do?Status=PWNE";
		UserVo userVo = new UserVo();
		userVo = loginService.loginProc(loginVo.getInputId());
		if(userVo != null) {
			if(userVo.getUserPw().equals(loginVo.getUserPw())) {
				HttpSession session = request.getSession();
				session.setAttribute("userId", userVo.getInputId());
				session.setAttribute("userNm", userVo.getInputName());
				session.setAttribute("userMajor", userVo.getInputMajor());
				session.setAttribute("userSchool", userVo.getInputSchool());
				session.setAttribute("userLevel", userVo.getLevel());
				redirectUrl = "redirect:/main/mainPage.do";
			}
		} else {
			
		}
		return redirectUrl;
	}
}
