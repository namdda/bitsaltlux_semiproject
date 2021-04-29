package co.kr.wdt.user.dao;

import org.springframework.stereotype.Repository;

import co.kr.wdt.common.dao.CommonSqlDao2;
import co.kr.wdt.user.vo.UserVo;

@Repository
public class UserDao extends CommonSqlDao2 {
	
	private static String PREFIX = "UserMapper.";

	public int checkExistid(String inputId) {
		return (int) selectOne(PREFIX + "checkExistid", inputId);
	}

	public void joinProc(UserVo userVo) {
		insert (PREFIX + "joinProc", userVo);
	}

}
