package co.kr.wdt.subject.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import co.kr.wdt.common.dao.CommonSqlDao2;
import co.kr.wdt.subject.vo.SubjectVo;

@Repository
public class SubjectDao extends CommonSqlDao2 {

	private static String PREFIX = "SubjectMapper.";

	public List<SubjectVo> studentsubjectView(String inputId) {
		return selectList(PREFIX + "studentsubjectView", inputId);
	}

	public void studentSubjectDel(SubjectVo subjectVo) {
		update(PREFIX + "studentSubjectDel", subjectVo);
	}

	public List<SubjectVo> proSubjectView(String inputId) {
		return selectList(PREFIX + "proSubjectView", inputId);
	}

}
