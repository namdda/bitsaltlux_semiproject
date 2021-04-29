package co.kr.wdt.dh.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DhController {

	@RequestMapping(value="/jsHtmlTest.do", method=RequestMethod.GET)
	public ModelAndView jsHtmlTest() {
		ModelAndView mv = new ModelAndView("js/jsHtmlTest");
		return mv;
	}

}
