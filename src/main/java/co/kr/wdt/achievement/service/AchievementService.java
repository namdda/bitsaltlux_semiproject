package co.kr.wdt.achievement.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.wdt.achievement.dao.AchievementDao;
import co.kr.wdt.achievement.vo.AchievementVo;


@Service
public class AchievementService {
	@Autowired
	AchievementDao achievementDao;
	// 
	public void addAchievement(int todono) {
		achievementDao.insert(todono);
	}
	// 전체 achievement를 가져온다 ( 이용자 기준 )
	public AchievementVo getByTodoNo(int todono){
		return achievementDao.selectByTodoNo(todono);
	}
	// achievement를 삭제한다. 
	public boolean eraseAchievement(int todono) {
		return achievementDao.deleteProc(todono);
	}
	// achievement를 수정한다
	public boolean modifyAchievement(AchievementVo vo) {
		return achievementDao.updateProc(vo);
	}
}
