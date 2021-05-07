package co.kr.wdt.courseevaluationboard.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import co.kr.wdt.courseevaluationboard.service.CourseEvaluationBoardService;
import co.kr.wdt.courseevaluationboard.vo.CourseEvaluationBoardVo;
import co.kr.wdt.courseevaluationmain.service.CourseEvaluationMainService;
import co.kr.wdt.security.Auth;
import co.kr.wdt.security.AuthUser;
import co.kr.wdt.user.vo.UserVo;

@Controller
@RequestMapping("/courseEvaluationBoard")
public class CourseEvaluationBoardController {
	
	@Autowired
	private CourseEvaluationBoardService courseEvaluationBoardService;
	@Autowired
	private CourseEvaluationMainService courseEvaluationMainService;
	
	
	// 게시판 글 목록 가져오기
	@RequestMapping(value="/list.do")
	public String getList(Model model, CourseEvaluationBoardVo courseEvaluationBoardVo, 
			@RequestParam(defaultValue = "1") int nowPage, 
			@RequestParam(defaultValue = "") String search,
			@RequestParam(defaultValue = "0") int courseIdx) {
		
		Map<String, Object> result = new HashMap<String, Object>(); 
		if (!(courseIdx == 0)) {
			courseEvaluationBoardVo.setCourseIdx(courseIdx);
			courseEvaluationBoardService.updateMovieHit_Cnt(courseIdx);
		}
		
		if (search.equals("")) {
			result = courseEvaluationBoardService.getBoardList(courseEvaluationBoardVo, nowPage);	
		} else {
			result = courseEvaluationBoardService.getSearchList(courseEvaluationBoardVo, nowPage, search);
			model.addAttribute("search", search);
		}
		
		model.addAttribute("categoryList", courseEvaluationMainService.getMovieCategoryList());
		model.addAttribute("courseIdx", courseIdx);
		model.addAttribute("list", result.get("list"));
		model.addAttribute("pageVo", result.get("pageVo"));
		return "courseevaluationboard/courseevaluationboardlist";
	}
	
	// 게시판 글 상세
	@RequestMapping(value="view/{boardIdx}.do")
	public String view(Model model, @PathVariable("boardIdx") int boardIdx) {
		CourseEvaluationBoardVo courseEvaluationBoardVo = courseEvaluationBoardService.getDetail(boardIdx);
		model.addAttribute("categoryList", courseEvaluationMainService.getMovieCategoryList());
		model.addAttribute("courseEvaluationBoardVo", courseEvaluationBoardVo);
		return "courseevaluationboard/courseevaluationboardview";
	}
	
	
	// 게시판 글쓰기 Page
	@Auth
	@RequestMapping(value="/write/{courseIdx}.do", method=RequestMethod.GET)
	public String writeForm(Model model, @PathVariable("courseIdx") int courseIdx) {
		model.addAttribute("categoryList", courseEvaluationMainService.getMovieCategoryList());
		model.addAttribute("courseIdx", courseIdx);
		return "courseevaluationboard/courseevaluationboardwrite";
	}
	
	// 게시판 글쓰기 insert
	@Auth
	@RequestMapping(value="/write.do", method=RequestMethod.POST)
	public String write(@AuthUser UserVo userVo ,CourseEvaluationBoardVo courseEvaluationBoardVo, RedirectAttributes redirectAttributes) {
		Map<String, Object> param = new HashMap<String, Object>();
		
		courseEvaluationBoardVo.setCourseName(courseEvaluationBoardService.getCourseName(courseEvaluationBoardVo.getCourseIdx()));
		
		param.put("userVo", userVo);
		param.put("courseEvaluationBoardVo", courseEvaluationBoardVo);
		
		
		courseEvaluationBoardService.write(param);
		
		if(courseEvaluationBoardVo.getCourseName() != null) {
			redirectAttributes.addAttribute("movieName", courseEvaluationBoardVo.getCourseName());	
		}
		return "redirect:/courseEvaluationBoard/list.do";
	}
	
	// 게시판 update Page
	@Auth
	@RequestMapping(value="/update/{boardIdx}.do", method=RequestMethod.GET)
	public String updateForm(@AuthUser UserVo userVo, Model model, @PathVariable("boardIdx") int boardIdx) {
		CourseEvaluationBoardVo courseEvaluationBoardVo = courseEvaluationBoardService.getDetail(boardIdx);
		model.addAttribute("categoryList", courseEvaluationMainService.getMovieCategoryList());
		model.addAttribute("courseEvaluationBoardVo", courseEvaluationBoardVo);
		return "/courseevaluationboard/courseevaluationboardupdate";
	}
	
	// 게시판 글 update
	@Auth
	@RequestMapping(value="/update/{boardIdx}.do", method=RequestMethod.POST)
	public String update(@AuthUser UserVo userVo, CourseEvaluationBoardVo courseEvaluationBoardVo, @PathVariable("boardIdx") int boardIdx) {
		courseEvaluationBoardService.update(courseEvaluationBoardVo);
		return "redirect:/courseEvaluationBoard/list.do";
	}
	
	// 게시판 글 delete
	@Auth
	@RequestMapping("/delete/{boardIdx}.do")
	public String delete(@AuthUser UserVo userVo, @PathVariable("boardIdx") int boardIdx) {
		courseEvaluationBoardService.delete(boardIdx);
		return "redirect:/courseEvaluationBoard/list.do";
	}
}
