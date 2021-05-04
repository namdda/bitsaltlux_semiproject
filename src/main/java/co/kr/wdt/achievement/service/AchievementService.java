package co.kr.wdt.achievement.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import co.kr.wdt.achievement.vo.AchievementVo;
import co.kr.wdt.education.vo.EducationVo;

public interface AchievementService{
	
	public void addAchievement(int todono);
	// 전체 achievement를 가져온다 ( 이용자 기준 )
	public AchievementVo getByTodoNo(int todono);
	// achievement를 삭제한다. 
	public boolean eraseAchievement(int todono);
	// achievement를 수정한다
	public boolean modifyAchievement(AchievementVo vo);
}
