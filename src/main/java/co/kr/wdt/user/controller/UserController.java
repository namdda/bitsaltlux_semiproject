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
	public String userUpdate(HttpServletRequest request,String inputId) {// @ModelAttribute UserVo userVo
		/*
		 * getParameter()는 웹브라우저에서 전송받은 request영역의 값을 읽어오고
		   getAttribute()의 경우 setAttribute()속성을 통한 설정이 없으면 무조건 null값을 리턴한다.
		 * */
		HttpSession session = request.getSession(false);
		
		if(session !=null) {
		System.out.println(session); // 세션은 있고(당연하지만)
		/*     로그인 중 
		 * 		session.setAttribute("userId", userVo.getInputId());
				session.setAttribute("userNm", userVo.getInputName());
				session.setAttribute("userMajor", userVo.getInputMajor());
				session.setAttribute("userSchool", userVo.getInputSchool());
				session.setAttribute("userLevel", userVo.getLevel());
				session.setAttribute("userPw", userVo.getUserPw());
				했으니까... 
		 * */
		//int str2 = Integer.parseInt(String.valueOf(session.getAttribute("no"))); // 얘는 null 이 나옴
		int str = Integer.parseInt(String.valueOf(session.getAttribute("userId"))); //성공!!!!!!!!!
		String str3 = String.valueOf(session.getAttribute("userPw")); //성공!!!!!!!!!
		
		//java.lang.ClassCastException: java.lang.Integer cannot be cast to java.lang.String
		
		
		System.out.println(str);
		//System.out.println(str2);
		System.out.println(str3);
		}
		else {
			System.out.println("null");
		}
		
		session.getAttribute(inputId); // 이게 null 이다
	
		userService.userUpdate(inputId); // 정보 select 하기 
		
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