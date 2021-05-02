package co.kr.wdt.education.service;

import java.util.List;

import co.kr.wdt.education.vo.EducationVo;

public interface EducationService {

	public List<EducationVo> searchEducationList(String inputId);

}
