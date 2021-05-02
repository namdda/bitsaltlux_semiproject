package co.kr.wdt.education.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import co.kr.wdt.education.vo.EducationVo;

public interface EducationService {

	public List<EducationVo> searchEducationList(String inputId, String type);	

	public void joinEducation(String idx1, String idx2, HttpServletRequest req);

	public List<EducationVo> joinEducationList(HttpServletRequest req);

	public int checkEducation(String idx1, String idx2, HttpServletRequest req);
}
