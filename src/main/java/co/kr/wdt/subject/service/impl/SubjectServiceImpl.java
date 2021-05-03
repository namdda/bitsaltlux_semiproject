package co.kr.wdt.subject.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.wdt.subject.dao.SubjectDao;
import co.kr.wdt.subject.service.SubjectService;
import co.kr.wdt.subject.vo.SubjectVo;

@Service
public class SubjectServiceImpl implements SubjectService {

	@Autowired
	private SubjectDao subjectDao;

	@Override
	public Object myLectureList(String inputId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<SubjectVo> studentsubjectView(String inputId) {
		return subjectDao.studentsubjectView(inputId);
	}

	@Override
	public void studentSubjectDel(String inputId, String idx) {
		SubjectVo subjectVo = new SubjectVo();
		subjectVo.setUserId(inputId);
		subjectVo.setIdx(idx);
		subjectDao.studentSubjectDel(subjectVo);
	}

	@Override
	public List<SubjectVo> proSubjectView(String inputId) {
		
		return subjectDao.proSubjectView(inputId);
	}

}
