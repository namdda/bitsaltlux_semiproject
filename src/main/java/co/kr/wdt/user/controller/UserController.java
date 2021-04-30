package co.kr.wdt.user.controller;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.mysql.cj.protocol.ServerSession;

import co.kr.wdt.user.service.UserService;
import co.kr.wdt.user.vo.UserVo;

@Controller
//@SessionAttributes("test")
@RequestMapping(value="/user")
public class UserController {

	@Autowired
	private UserService userService;

	@RequestMapping(value="/userJoin.do", method=RequestMethod.GET)
	public String userJoin() {
		return "user/userJoin";
	}

	@RequestMapping(value="/existid.do", method=RequestMethod.POST)
	@ResponseBody
	public String existid(String inputId) {
		String result = "fal";
		int cnt = userService.checkExistid(inputId);
		if(!(cnt > 0)) result = "success";
		return result;
	}

	@RequestMapping(value="/joinProc.do", method=RequestMethod.POST)
	public String joinProc(@ModelAttribute UserVo userVo) {
		userService.joinProc(userVo);
		return "redirect:/user/joinsuccess.do";
	}
	
	
	@RequestMapping(value="/joinsuccess.do", method=RequestMethod.GET)
	public String joinsuccess() {
		return "user/joinsuccess";
	}

	//페이지를 진입하는 동시에 select 해서 뿌려준다
	//session은 true false 상관 없다 
	//자바에서 끌어온다 (뿌려야한다) 
	
	//로그인 하면 세션을 만들었다(있다)
	//세션이 담겼다 (여기서 userId) 가져온다 (jsp에서 꺼내오는게 아니라 자바에서 꺼내오는건다) 
	
	/*
	 * 로그인 하면 세션이 만들어지니..
	 * 세션을 당긴다<< 
	 * 당긴 뒤 id를 꺼낸다(userid)
	 * jsp가 아닌 자바에서 꺼내온다 
	 * HttpSession session = request.getSession(true); 했다 
	 * select 하다 
	 * */
	
	@RequestMapping(value="/userUpdate.do", method=RequestMethod.GET)
	public String userUpdate(@RequestParam String inputId, Model model) {
		model.addAttribute("resutl", userService.userUpdate(inputId));
		return "user/userUpdate";
	}
	
	@RequestMapping(value="/updateProc.do", method=RequestMethod.POST)
	public String updateProc(@ModelAttribute("resutl") UserVo userVo) {
		userService.updateProc(userVo);
		return "user/userUpdate";
	}
	
	@RequestMapping(value="/deleteProc.do", method=RequestMethod.POST)
	public String delteProc(@ModelAttribute UserVo userVo) {
		userService.deleteProc(userVo);
		return "redirect:/login/loginPage.do";
	}

}