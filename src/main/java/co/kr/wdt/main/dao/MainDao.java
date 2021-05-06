package co.kr.wdt.main.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import co.kr.wdt.common.dao.CommonSqlDao2;
import co.kr.wdt.common.vo.AllTypeVo;
import co.kr.wdt.common.vo.MajorVo;
import co.kr.wdt.common.vo.ProfessorVo;

@Repository
public class MainDao extends CommonSqlDao2 {

	private static String PREFIX = "MainMapper.";

	public List<MajorVo> selectMajorList() {
		return selectList(PREFIX + "selectMajorList");
	}

	public List<AllTypeVo> allTypeList(String value) {
		return selectList(PREFIX + "allTypeList", value);
	}

	public List<ProfessorVo> professorList(String value) {
		return selectList(PREFIX + "professorList", value);
	}

	public Object userProfile(int userId) {
		return selectOne(PREFIX + "userProfile", userId);
	}
}
