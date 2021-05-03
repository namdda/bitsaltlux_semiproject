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
	
	
	//문제점 1. 아니, 강의 취소하면.... 강의 듣던 학생들은 어칼꺼임 (끔찍) -> 취소하지 못한다 강사님은 영원히 강의 해야 한다  
	//문제점 2. 시간 입력은 어떻게? 10, 29 이렇게? 위에 안내도 쓰지 뭐 -> html 안내표 쓰기  
	// 문제점 3. 다 좋은데 교수님 시간이 겹치면 어카지(교수님이 분신술 써야 하는 케이스) -> 이건 좀 큰일남 
	//아 생각할게 많다.... 
	@RequestMapping(value="/proSubjectView.do", method={RequestMethod.GET,RequestMethod.POST})
	String proSubjectView(@RequestParam(value="inputId", required=false) String inputId, @RequestParam(value="idx", required=false) String idx, Model model) {
		List<SubjectVo> subjectVo = subjectService.proSubjectView(inputId);
		model.addAttribute("subjectList", subjectVo);
		return "subject/proSubjectView";
	}

}
