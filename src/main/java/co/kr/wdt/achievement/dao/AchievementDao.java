package co.kr.wdt.achievement.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.kr.wdt.achievement.vo.AchievementVo;
import co.kr.wdt.common.dao.CommonSqlDao2;


@Repository
public class AchievementDao extends CommonSqlDao2{
	
	private static String PREFIX = "AchievementMapper.";
	// 생성
	public void insert(int todono) {
		insert(PREFIX+"insert", todono);
	}
	
	// 삭제 기능 
	public boolean deleteProc(int todono) {
		return 1 == (int)delete(PREFIX+"delete", todono);
	}
	// 수정 기능 
	public boolean updateProc(AchievementVo vo) {
		return 1 == (int)update(PREFIX+"update",vo);
	}
	// 조회 기능 (todo번호)
	public AchievementVo selectByTodoNo(int todono) {
		return (AchievementVo)selectOne(PREFIX+"select",todono);
	}

		
}