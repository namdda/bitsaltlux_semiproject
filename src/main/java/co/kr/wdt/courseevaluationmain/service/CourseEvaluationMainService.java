package co.kr.wdt.courseevaluationmain.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

public interface CourseEvaluationMainService {
	
	public List<Map<String, Object>> getTop8();
	
	public List<Map<String, Object>> getSelectCategoryMovies(String cateCode);

	public List<Map<String, Object>> getMovieCategoryList();
}