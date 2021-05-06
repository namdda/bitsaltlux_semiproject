package co.kr.wdt.courseevaluationmain.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.wdt.courseevaluationmain.dao.CourseEvaluationMainDao;
import co.kr.wdt.courseevaluationmain.service.CourseEvaluationMainService;

@Service
public class CourseEvaluationMainServiceImpl implements CourseEvaluationMainService {
	
	@Autowired
	private CourseEvaluationMainDao courseEvaluationMainDao;
	
	public List<Map<String, Object>> getTop8() {
		return courseEvaluationMainDao.getTop8();
	}
	
	public List<Map<String, Object>> getSelectCategoryMovies(String cateCode) {
		return courseEvaluationMainDao.getSelectCategoryMovies(cateCode);
	}

	public List<Map<String, Object>> getMovieCategoryList() {
		return courseEvaluationMainDao.getMovieCategoryList();
	}
}
