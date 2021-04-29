package co.kr.wdt.yj.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import co.kr.wdt.yj.vo.YjVo;

@Controller
@RequestMapping(value="/js")
public class YjController {

	@RequestMapping(value="/jsHtmlTest.do", method=RequestMethod.GET)
	public ModelAndView jsHtmlTest() {
		ModelAndView mv = new ModelAndView("js/jsHtmlTest");
		return mv;
	}

	@RequestMapping(value="/mberSbscrb.do", method=RequestMethod.POST)
	public String mberSbscrb(@ModelAttribute YjVo vo, Model model) {
		model.addAttribute("userInfo", vo);
		return "js/mberSbscrb";
	}

	@RequestMapping(value="/mberSbscrb2.do", method=RequestMethod.POST)
	@ResponseBody
	public String mberSbscrb2(@ModelAttribute YjVo vo, Model model) {
		model.addAttribute("userInfo", vo);
		return "js/mberSbscrb";
	}

}
