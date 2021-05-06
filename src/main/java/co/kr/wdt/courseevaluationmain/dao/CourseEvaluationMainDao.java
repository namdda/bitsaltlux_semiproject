package co.kr.wdt.courseevaluationmain.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import co.kr.wdt.common.dao.CommonSqlDao2;

@Repository
public class CourseEvaluationMainDao extends CommonSqlDao2 {
	
	private static String PREFIX = "courseEvaluationMain.";
	
	public List<Map<String, Object>> getTop8() {
		return selectList(PREFIX + "top9");
	}

	public List<Map<String, Object>> getSelectCategoryMovies(String cateCode) {
		return selectList(PREFIX + "getSelectCategoryMovies", cateCode);
	}

	public List<Map<String, Object>> getMovieCategoryList() {
		return selectList(PREFIX + "getMovieCategoryList");
	}
}