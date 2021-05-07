package co.kr.wdt.courseevaluationmanagement.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import co.kr.wdt.courseevaluationmain.service.CourseEvaluationMainService;
import co.kr.wdt.courseevaluationmanagement.dto.CategoryResult;
import co.kr.wdt.courseevaluationmanagement.service.CourseEvaluationManagementService;
import co.kr.wdt.courseevaluationmanagement.vo.CourseCategoryVo;
import co.kr.wdt.courseevaluationmanagement.vo.CourseVo;

@Controller
@RequestMapping("/courseEvaluationManagement")
public class CourseEvaluationManagementController {

	@Autowired
	private CourseEvaluationManagementService courseEvaluationManagementService;
	@Autowired
	private CourseEvaluationMainService courseEvaluationMainService;
	
	//영화등록
	@RequestMapping(value="/addCourse.do", method=RequestMethod.GET)
	public String getIndex(Model model) {
		model.addAttribute("categoryList", courseEvaluationMainService.getMovieCategoryList());
		return "courseevaluationmanagement/addcourse";
	}
	
	//영화등록
	@RequestMapping(value="/addCourse.do", method=RequestMethod.POST)
	public String addMovie(CourseVo courseVo, HttpServletRequest request) throws Exception {
		courseEvaluationManagementService.addMovie(courseVo, request);
		return "redirect:/courseEvaluationManagement/getCourseList.do";			
	}

	// 등록영화 조회
	@RequestMapping(value = "/getCourseList.do", method = RequestMethod.GET)
	public String getMovielist(Model model) throws Exception {
		
		model.addAttribute("categoryList", courseEvaluationMainService.getMovieCategoryList());
		model.addAttribute("list", courseEvaluationManagementService.getMovie());
		
		return "courseevaluationmanagement/courselist";
	}
	
	// 등록영화 상세 조회
	@RequestMapping(value = "/courseViewDetail/{COURSE_IDX}.do")
	public String view(Model model, @PathVariable("COURSE_IDX") int course_Idx) throws Exception {
		model.addAttribute("categoryList", courseEvaluationMainService.getMovieCategoryList());
		model.addAttribute("courseVo", courseEvaluationManagementService.getMovieDetail(course_Idx));
		
		return "courseevaluationmanagement/getcourse";
	}

	@ResponseBody
	@RequestMapping(value="/courseCategory.do")
	public CategoryResult getCategory() {
		List<CourseCategoryVo> category = courseEvaluationManagementService.getCategory();
		return CategoryResult.success(category);
	}
}
