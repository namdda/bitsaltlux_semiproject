package co.kr.wdt.login.dao;

import org.springframework.stereotype.Repository;

import co.kr.wdt.common.dao.CommonSqlDao2;
import co.kr.wdt.user.vo.UserVo;

@Repository
public class LoginDao extends CommonSqlDao2 {
	
	private static String PREFIX = "LoginMapper.";

	public UserVo loginProc(String inputId) {
		return (UserVo) selectOne(PREFIX + "loginProc", inputId);
	}

}
