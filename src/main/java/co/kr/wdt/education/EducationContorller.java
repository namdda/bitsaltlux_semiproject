package co.kr.wdt.education;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import co.kr.wdt.education.service.EducationService;
import co.kr.wdt.education.vo.EducationVo;

@Controller
@RequestMapping(value="/education")
public class EducationContorller {
	
	@Autowired
	private EducationService educationService;
	
	@RequestMapping(value="/searchEducationList.do", method=RequestMethod.POST)
	@ResponseBody
	public List<EducationVo> searchEducationList(String inputId, String type) {
		List<EducationVo> educationVo = educationService.searchEducationList(inputId, type);
		return educationVo;
	}
	
	@RequestMapping(value="/joinEducation.do", method=RequestMethod.POST)
	@ResponseBody
	public List<EducationVo> joinEducation(String idx1, String idx2, HttpServletRequest req) {
		educationService.joinEducation(idx1, idx2, req);
		List<EducationVo> resultList = educationService.joinEducationList(req);
		return resultList;
	}
	
	@RequestMapping(value="/joinEducationList.do", method=RequestMethod.POST)
	@ResponseBody
	public List<EducationVo> joinEducationList(HttpServletRequest req) {
		List<EducationVo> resultList = educationService.joinEducationList(req);
		return resultList;
	}
	
	@RequestMapping(value="/checkEducation.do", method=RequestMethod.POST)
	@ResponseBody
	public String checkEducation(String idx1, String idx2, HttpServletRequest req) {
		String result = "fal";
		int resultList = educationService.checkEducation(idx1, idx2, req);
		if(resultList == 0) result = "ok";
		return result;
	}
	
	//insert 한 뒤 뿌릴 애 (list로 나와야 하니)... 
	
	/*
	 * @RequestMapping(value="/userUpdate.do", method=RequestMethod.GET)
	public String userUpdate(@RequestParam String inputId, Model model) {
		model.addAttribute("resutl", userService.userUpdate(inputId));
		return "user/userUpdate";
	}
	 * */
	
	//수강 취소 한다면? 
	//delete 가 아니라, update를 해야 하나? status를 n으로만 바꾸고 status가 n이면 display-none 으로
	

}
