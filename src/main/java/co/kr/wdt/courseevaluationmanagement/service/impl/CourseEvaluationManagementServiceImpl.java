package co.kr.wdt.courseevaluationmanagement.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.wdt.courseevaluationmanagement.dao.CourseEvaluationManagementDao;
import co.kr.wdt.courseevaluationmanagement.service.CourseEvaluationManagementService;
import co.kr.wdt.courseevaluationmanagement.vo.CourseCategoryVo;
import co.kr.wdt.courseevaluationmanagement.vo.CourseVo;
import co.kr.wdt.utils.FileUtils;

@Service
public class CourseEvaluationManagementServiceImpl implements CourseEvaluationManagementService {
	
	@Autowired
	private CourseEvaluationManagementDao courseEvaluationManagementDao;
	
	@Resource(name="fileUtils") 
	private FileUtils fileUtils;
	
	public List<CourseCategoryVo> getCategory() {
		return courseEvaluationManagementDao.getCategory();
	}

	public boolean addMovie(CourseVo courseVo, HttpServletRequest request) throws Exception {
		Boolean result = courseEvaluationManagementDao.addMovie(courseVo); 
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("courseIdx", String.valueOf(courseVo.getCourseIdx()));
		map.put("courseName", String.valueOf(courseVo.getCourseName()));
		List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(map, request);
		for(int i=0, size=list.size(); i<size; i++){ 
			courseEvaluationManagementDao.insertFile(list.get(i)); 
		}
		
		return result;
	}
	
	public Map<String, Object> getMovieDetail(int courseIdx) {
		return courseEvaluationManagementDao.findMovieOne(courseIdx);
	}

	public List<Map<String, Object>> getMovie() {
		return courseEvaluationManagementDao.getMovie();
	}


	
	
}
