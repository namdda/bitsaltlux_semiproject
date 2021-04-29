package co.kr.wdt.yc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/yc")
public class YcController {

	@RequestMapping(value="/jsHtmlTest.do", method=RequestMethod.GET)
	public ModelAndView jsHtmlTest() {
		String userId = "운영자";
		ModelAndView mv = new ModelAndView("js/jsHtmlTest");
		return mv;
	}

}
