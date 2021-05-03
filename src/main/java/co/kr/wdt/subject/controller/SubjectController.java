package co.kr.wdt.subject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import co.kr.wdt.subject.service.SubjectService;
import co.kr.wdt.subject.vo.SubjectVo;


@Controller
@RequestMapping(value="/subject")
public class SubjectController {

	@Autowired
	private SubjectService subjectService;

	@RequestMapping(value="/studentSubjectView.do", method={RequestMethod.GET,RequestMethod.POST})
	String studentSubjectView(@RequestParam(value="inputId", required=false) String inputId, @RequestParam(value="idx", required=false) String idx, Model model) {
		if(idx != null) {
			subjectService.studentSubjectDel(inputId, idx);
			model.addAttribute("sccessCall", "정상 취소 되셨습니다.");
		}
		List<SubjectVo> subjectVo = subjectService.studentsubjectView(inputId);
		model.addAttribute("subjectList", subjectVo);
		return "subject/studentSubjectView";
	}
	
	
	//교수 목록 보기 
	@RequestMapping(value="/proSubjectView.do", method={RequestMethod.GET,RequestMethod.POST})
	String proSubjectView(@RequestParam(value="inputId", required=false) String inputId, @RequestParam(value="idx", required=false) String idx, Model model) {
		List<SubjectVo> subjectVo = subjectService.proSubjectView(inputId);
		model.addAttribute("subjectList", subjectVo);
		return "subject/proSubjectView";
	}

}
