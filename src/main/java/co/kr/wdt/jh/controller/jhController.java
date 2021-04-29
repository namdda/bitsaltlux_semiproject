package co.kr.wdt.jh.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import co.kr.wdt.jh.vo.JhVo;

@Controller
@RequestMapping(value="/jh")
public class jhController {

	@RequestMapping(value="/jhHtmlTest.do", method=RequestMethod.GET)
	public ModelAndView jsHtmlTest() {
		String userId = "운영자";
		ModelAndView mv = new ModelAndView("jh/jhHtmlTest");
		return mv;
	}

	@RequestMapping(value="/memberSbscrb.do", method=RequestMethod.POST)
	public String memberSbscrb(@ModelAttribute JhVo vo, Model model) {
		System.out.println(">>>>>>>>>>>>>>"+vo);
		model.addAttribute("userInfo",vo);
		return "jh/memberSbscrb";
	}

	@RequestMapping(value="/memberSbscrb2.do", method=RequestMethod.POST)
	@ResponseBody
	public String memberSbscrb(@ModelAttribute Map<String, Object> vo, Model model) {
		model.addAttribute("userInfo",vo);
		return "jh/memberSbscrb";
	}

//	@RequestMapping(value="/memberSbscrb.do", method=RequestMethod.GET)
//	public ModelAndView memberSbscrb(@RequestParam Map<String, Object> map) {
//		System.out.println(">>>>>>>>>>>>>>"+map);
//		ModelAndView mv = new ModelAndView("jh/memberSbscrb");
//		return mv;
//	}

//	@RequestMapping(value="/memberSbscrb.do", method=RequestMethod.POST)
//	public ModelAndView memberSbscrb(@ModelAttribute JhVo vo) {
//		System.out.println(">>>>>>>>>>>>>>"+vo);
//		ModelAndView mv = new ModelAndView("jh/memberSbscrb");
//		mv.addObject("userInfo",vo);
//		return mv;
//	}
}
