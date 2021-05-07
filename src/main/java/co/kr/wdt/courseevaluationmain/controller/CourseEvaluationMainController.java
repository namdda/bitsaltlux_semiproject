package co.kr.wdt.courseevaluationmain.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import co.kr.wdt.courseevaluationmain.service.CourseEvaluationMainService;

@Controller
@RequestMapping("/courseEvaluationMain")
public class CourseEvaluationMainController {
	
	@Autowired
	private CourseEvaluationMainService courseEvaluationMainService;
	
	// Top9 Movie list 가져오기
	@RequestMapping(value="/hotCourse.do")
	public String index(Model model) {
		model.addAttribute("list", courseEvaluationMainService.getTop8());
		model.addAttribute("categoryList", courseEvaluationMainService.getMovieCategoryList());
		return "hotcourse/hotcourse";
	}
	
	// Side Tab 데이터 가져오기
	@RequestMapping(value = "/{cateCode}.do")
	public String getSelectCategoryMovies(Model model, @PathVariable("cateCode") String cateCode) {
		model.addAttribute("list", courseEvaluationMainService.getSelectCategoryMovies(cateCode));
		model.addAttribute("categoryList", courseEvaluationMainService.getMovieCategoryList());
		return "hotcourse/hotcourse";
	}
}
