package co.kr.wdt.courseevaluationmanagement.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import co.kr.wdt.courseevaluationmanagement.vo.CourseCategoryVo;
import co.kr.wdt.courseevaluationmanagement.vo.CourseVo;

public interface CourseEvaluationManagementService {
	
	public List<CourseCategoryVo> getCategory();
	
	public boolean addMovie(CourseVo courseVo, HttpServletRequest request) throws Exception;
	
	public Map<String, Object> getMovieDetail(int courseIdx);

	public List<Map<String, Object>> getMovie();
}
