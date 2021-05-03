package co.kr.wdt.main.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import co.kr.wdt.common.vo.AllTypeVo;
import co.kr.wdt.common.vo.MajorVo;
import co.kr.wdt.common.vo.ProfessorVo;
import co.kr.wdt.main.service.MainSevice;

@Controller
@RequestMapping(value="/main")
public class MainController {

	@Autowired
	private MainSevice mainService;

	@RequestMapping(value="/mainPage.do", method={RequestMethod.GET, RequestMethod.POST})
	public String mainPage(HttpServletRequest request, Model model) {
		List<MajorVo> majorVo = mainService.selectMajorList();
		String redirectUrl = "main/mainPage";
		HttpSession session = request.getSession(false);
		if(session == null) {
			redirectUrl ="redirect:/login/loginPage.do?Status=SESSIONOUT";
		} else {
			if(session.getAttribute("userId") == null) redirectUrl ="redirect:/login/loginPage.do?Status=SESSIONOUT";
			// if("PRO".equals(session.getAttribute("level"))) redirectUrl = "main/proMainPage";
		}
		model.addAttribute("majorList", majorVo);
		return redirectUrl;
	}

	@RequestMapping(value="/allTypeList.do", method=RequestMethod.POST)
	@ResponseBody
	public List<AllTypeVo> allTypeList(String value) {
		List<AllTypeVo> allTypeVo = mainService.allTypeList(value);
		return allTypeVo;
	}

	@RequestMapping(value="/professorList.do", method=RequestMethod.POST)
	@ResponseBody
	public List<ProfessorVo> professorList(String value) {
		List<ProfessorVo> professorVo = mainService.professorList(value);
		return professorVo;
	}
}
