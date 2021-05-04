package co.kr.wdt.user.controller;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
	public String joinProc(@ModelAttribute UserVo userVo, MultipartHttpServletRequest request) {
		String hashPassword = BCrypt.hashpw(userVo.getUserPw(), BCrypt.gensalt());
		userVo.setUserPw(hashPassword);		// 암호화 저장
		userService.joinProc(userVo, request);
		return "redirect:/user/joinsuccess.do";
	}

	@RequestMapping(value="/joinsuccess.do", method=RequestMethod.GET)
	public String joinsuccess() {
		return "user/joinsuccess";
	}

	@RequestMapping(value="/userUpdate.do", method=RequestMethod.GET)
	public String userUpdate(@RequestParam String inputId, Model model) {
		model.addAttribute("result", userService.userUpdate(inputId));
		return "user/userUpdate";
	}

	@RequestMapping(value="/updateProc.do", method=RequestMethod.POST)
	public String updateProc(@ModelAttribute("result") UserVo userVo) {
		userService.updateProc(userVo);
		return "user/userUpdate";
	}

	@RequestMapping(value="/deleteProc.do", method=RequestMethod.POST)
	public String delteProc(@ModelAttribute UserVo userVo) {
		userService.deleteProc(userVo);
		return "redirect:/login/loginPage.do";
	}
}