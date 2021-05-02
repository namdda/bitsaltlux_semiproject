package co.kr.wdt.education.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import co.kr.wdt.common.dao.CommonSqlDao2;
import co.kr.wdt.education.vo.EducationVo;

@Repository
public class EducationDao extends CommonSqlDao2 {
	
	private static String PREFIX = "EducationMapper.";


	public List<EducationVo> searchEducationList(String inputId) {
		return selectList(PREFIX + "searchEducationList", inputId);
	}

}
