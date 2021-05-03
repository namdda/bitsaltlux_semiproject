package co.kr.wdt.education.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import co.kr.wdt.common.dao.CommonSqlDao2;
import co.kr.wdt.education.vo.EducationVo;

@Repository
public class EducationDao extends CommonSqlDao2 {

	private static String PREFIX = "EducationMapper.";

	public List<EducationVo> searchEducationList(EducationVo educationVo) {
		return selectList(PREFIX + "searchEducationList", educationVo);
	}

	public EducationVo selectEducation(EducationVo educationVo) {
		return (EducationVo) selectOne(PREFIX + "selectEducation", educationVo);

	}
	public void joinEducation(EducationVo educationVo) {
		insert(PREFIX + "joinEducation", educationVo);
	}

	public List<EducationVo> joinEducationList(String userId) {
		return selectList(PREFIX + "joinEducationList", userId);
	}

	public int checkEducation(EducationVo educationVo) {
		return (int) selectOne(PREFIX + "checkEducation", educationVo);
	}
}
