package co.kr.wdt.subject.service;

import java.util.List;

import co.kr.wdt.subject.vo.SubjectVo;

public interface SubjectService {

	Object myLectureList(String inputId);

	public List<SubjectVo> studentsubjectView(String inputId);

	public void studentSubjectDel(String inputId, String idx);

	List<SubjectVo> proSubjectView(String inputId);

}
