package co.kr.wdt.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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

	@RequestMapping(value="/userUpdate.do", method=RequestMethod.GET)
	public String userUpdate(@ModelAttribute("uservo") String inputId) {
		userService.userUpdate(inputId);
		return "user/userUpdate";
	}
	
	/**
	 *  @RequestMapping("/detail/{boardSerialNo}")
    public String detail(@PathVariable("boardSerialNo") String boardSerialNo, Model model) throws Exception {
        BoardVO boardVO = boardService.detail(boardSerialNo);
        model.addAttribute("vo",boardVO);	
        return "board/boardDetail";
    }
    
	 * 
	 */
	@RequestMapping(value="/updateProc.do", method=RequestMethod.POST)
	public String updateProc(int no, @ModelAttribute UserVo userVo) {
		userService.updateProc(userVo);
		return "redirect:/user/userUpdate.do";
	}

}