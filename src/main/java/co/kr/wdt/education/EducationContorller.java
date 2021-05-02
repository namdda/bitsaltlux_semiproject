package co.kr.wdt.education;

import java.util.List;

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
	
	@RequestMapping(value="searchEducationList.do", method=RequestMethod.POST)
	@ResponseBody
	public List<EducationVo> searchEducationList(String inputId) {
		List<EducationVo> educationVo = educationService.searchEducationList(inputId);
		return educationVo;
	}
	

}
