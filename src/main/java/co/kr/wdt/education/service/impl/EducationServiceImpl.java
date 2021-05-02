package co.kr.wdt.education.service.impl;

import java.util.List;

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
	public List<EducationVo> searchEducationList(String inputId) {
		return educationDao.searchEducationList(inputId);
	}

}
