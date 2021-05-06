package co.kr.wdt.courseevaluationboard.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import co.kr.wdt.common.dao.CommonSqlDao2;
import co.kr.wdt.courseevaluationboard.vo.CourseEvaluationBoardVo;

@Repository
public class CourseEvaluationBoardDao extends CommonSqlDao2 {

	private static String PRIFIX = "courseEvaluationBoard.";
	
	public List<CourseEvaluationBoardVo> findAll(Map<String, Object> param) {
		return selectList(PRIFIX + "findAll", param);
	}

	public int updateMovieHit_Cnt(int courseIdx) {
		return (int) update(PRIFIX + "updateMovieHit_Cnt", courseIdx);
	}
	
	public int findAllTotalCount(Map<String, Object> param) {
		return (int) selectOne(PRIFIX + "findAll_totalCount", param);
	}
	
	public CourseEvaluationBoardVo findOne(int idx) {
		return (CourseEvaluationBoardVo) selectOne(PRIFIX + "findOne", idx);
	}
	
	public List<CourseEvaluationBoardVo> search(Map<String, Object> param) {
		return selectList(PRIFIX + "search", param);
	}
	
	public int searchTotalCount(Map<String, Object> param) {
		return (int) selectOne(PRIFIX + "search_totalCount", param);
	}
	
	public int updateHit_Cnt(int mv_Idx) {
		return (int) update(PRIFIX + "updateHit_Cnt", mv_Idx);
	}
	

	public String getCourseName(int courseIdx) {
		return (String) selectOne(PRIFIX + "search_courseName", courseIdx);
	}
	
	public int insert(Map<String, Object> param) {
		return (int) insert(PRIFIX + "insert", param);
	}
	
	public int delete(int mv_Idx) {
		return (int) update(PRIFIX + "delete", mv_Idx);
	}
	
	public int update(CourseEvaluationBoardVo courseEvaluationBoradVo) {
		return (int) update(PRIFIX + "update", courseEvaluationBoradVo);
	}



}
