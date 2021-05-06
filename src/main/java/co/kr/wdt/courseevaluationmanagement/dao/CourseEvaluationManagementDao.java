package co.kr.wdt.courseevaluationmanagement.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import co.kr.wdt.common.dao.CommonSqlDao2;
import co.kr.wdt.courseevaluationmanagement.vo.CourseCategoryVo;
import co.kr.wdt.courseevaluationmanagement.vo.CourseVo;

@Repository
public class CourseEvaluationManagementDao extends CommonSqlDao2 {
	
	private static String PREFIX = "courseEvaluationManagement.";

	public List<CourseCategoryVo> getCategory() {
		return selectList(PREFIX+ "getCategory");
	}
	
	public List<Map<String, Object>> getMovie() {
		return selectList(PREFIX+ "getMovie");
	}

	public boolean addMovie(CourseVo courseVo) {
		return (int)insert(PREFIX + "addMovie", courseVo) == 1;
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> findMovieOne(int courseIdx) {
		return (Map<String, Object>) selectOne(PREFIX + "findMovieOne", courseIdx);
	}

	public void insertFile(Map<String, Object> map) {
		insert(PREFIX + "insertFile", map);
	}
}
