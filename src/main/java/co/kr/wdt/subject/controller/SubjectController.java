package co.kr.wdt.subject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import co.kr.wdt.subject.service.SubjectService;


@Controller
@RequestMapping(value="/subject")
public class SubjectController {
	
	@Autowired
	private SubjectService subjectService;
	
	@RequestMapping(value="proSubjectView.do", method= {RequestMethod.GET,RequestMethod.POST})
	String proSubjectView() {
		return "subject/proSubjectView";
	}
	
	@RequestMapping(value="/studentSubjectView.do", method= {RequestMethod.GET,RequestMethod.POST})
	String studentSubjectView() {
		return "subject/studentSubjectView";
	}
	
	

}
