package co.kr.wdt.main.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.wdt.common.vo.AllTypeVo;
import co.kr.wdt.common.vo.MajorVo;
import co.kr.wdt.common.vo.ProfessorVo;
import co.kr.wdt.main.dao.MainDao;
import co.kr.wdt.main.service.MainSevice;

@Service
public class MainSeviceImpl implements MainSevice {

	@Autowired
	private MainDao mainDao;
	
	@Override
	public List<MajorVo> selectMajorList() {
		return mainDao.selectMajorList();
	}

	@Override
	public List<AllTypeVo> allTypeList(String value) {
		return mainDao.allTypeList(value);
	}

	@Override
	public List<ProfessorVo> professorList(String value) {
		return mainDao.professorList(value);
	}
}
