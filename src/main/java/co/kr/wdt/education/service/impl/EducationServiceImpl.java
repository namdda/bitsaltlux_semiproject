package co.kr.wdt.education.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.wdt.education.dao.EducationDao;
import co.kr.wdt.education.service.EducationService;
import co.kr.wdt.education.vo.EducationVo;

@Service
public class EducationServiceImpl implements EducationService {
	
	@Autowired
	private EducationDao educationDao;

	@Override
	public List<EducationVo> searchEducationList(String inputId, String type) {
		EducationVo educationVo = new EducationVo();
		educationVo.setInputId(inputId);
		educationVo.setType(type);
		return educationDao.searchEducationList(educationVo);
	}

	@Override
	public void joinEducation(String idx1, String idx2, HttpServletRequest req) {
		HttpSession session = req.getSession(true);
		EducationVo educationVo = new EducationVo();
		educationVo.setIdx1(idx1);
		educationVo.setIdx2(idx2);
		educationVo = educationDao.selectEducation(educationVo);
		educationVo.setInputId(Integer.toString((int) session.getAttribute("userId")));
		educationDao.joinEducation(educationVo);
	}

	@Override
	public List<EducationVo> joinEducationList(HttpServletRequest req) {
		HttpSession session = req.getSession(true);
		return educationDao.joinEducationList(Integer.toString((int) session.getAttribute("userId")));
	}
	
	@Override
	public int checkEducation(String idx1, String idx2, HttpServletRequest req) {
		HttpSession session = req.getSession(true);
		EducationVo educationVo = new EducationVo();
		educationVo.setIdx1(idx1);
		educationVo.setIdx2(idx2);
		educationVo.setInputId(Integer.toString((int) session.getAttribute("userId")));
		return educationDao.checkEducation(educationVo);
	}
}
