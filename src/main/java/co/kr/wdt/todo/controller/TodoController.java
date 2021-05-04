package co.kr.wdt.todo.controller;

import java.util.List;

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

import co.kr.wdt.achievement.service.impl.AchievementServiceImpl;
import co.kr.wdt.achievement.vo.AchievementVo;
import co.kr.wdt.todo.service.impl.TodoServiceImpl;
import co.kr.wdt.todo.vo.TodoVo;



@RequestMapping("/todo")
@Controller
public class TodoController {
	@Autowired
	TodoServiceImpl todoService;
	@Autowired
	AchievementServiceImpl achievementService;
	
	@RequestMapping(value="/todoView.do",method=RequestMethod.GET)
	public String index(HttpServletRequest request, Model model) {
		//TODO: userno를 어디ㅔ서 넣어야 하는가? 
		String redirectUrl = "todo/todoView";
		HttpSession session = request.getSession(false);
		if(session == null) {
			redirectUrl ="redirect:/login/loginPage.do?Status=SESSIONOUT";
		} else {
			if(session.getAttribute("userId") == null) {
				redirectUrl ="redirect:/login/loginPage.do?Status=SESSIONOUT";
			}else {
				List<TodoVo> list = todoService.getAllByUserno((int)session.getAttribute("userId"));
				model.addAttribute("list", list);
			}
			// if("PRO".equals(session.getAttribute("level"))) redirectUrl = "main/proMainPage";
		}
		return redirectUrl;
	}
	
	@RequestMapping("/add.do")
	public String add(@ModelAttribute TodoVo vo) {
		System.out.println(vo);
		todoService.addTodo(vo);
		return "redirect:/todo/todoView.do";
	}
	@RequestMapping("/delete.do")
	public String delete(@RequestParam(value="no", required=true)int no) {
		System.out.println(no);
		
		todoService.eraseTodo(no);
		return "redirect:/todo/todoView.do";
	}
	@RequestMapping("/modify.do")
	public String modify(@ModelAttribute TodoVo vo) {
		System.out.println(vo);
		
		todoService.modifyTodo(vo);
		return "redirect:/todo/todoView.do";
	}
	
	// 해당 todo를 그날 달성했는지 확인
	@RequestMapping(value="/setachievement.do",method=RequestMethod.POST)
	@ResponseBody
	public int switchAchievement(@ModelAttribute AchievementVo vo) {
		// 조건부로 없으면 추가한다.
		achievementService.addAchievement(vo.getTodono());
		// client쪽에서 이미 바뀐 값이 들어간다
		achievementService.modifyAchievement(vo);
		return vo.getIssuccess();
	}
	
}
